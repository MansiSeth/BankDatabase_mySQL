use normalizedDBMSproj;

drop procedure if exists customer_name;
DELIMITER &&  
CREATE PROCEDURE numberofcustbycity(in entered_city varchar(20), out list_of_cust varchar(30))  
BEGIN  
    SELECT count(customer.custid) into list_of_cust FROM customer WHERE city= entered_city;  
END &&  
DELIMITER ;
call numberofcustbycity('mumbai', @m);
select @m;



DELIMITER &&  
CREATE PROCEDURE branch ()  
BEGIN  
    SELECT * FROM branch WHERE bcity='delhi';  
    SELECT COUNT(fname) AS delhi_customer FROM branch;    
END &&  
DELIMITER ;
call branch;



use normalizedDBMSproj;
DELIMITER &&  
CREATE PROCEDURE trans_details ()  
BEGIN  
    SELECT * FROM trandetails WHERE medium_of_transaction='cash';  
    SELECT COUNT(fname) AS trans_detail FROM transdetails;    
END &&  
DELIMITER ;
call trans_details;



use normalizedDBMSproj;
DELIMITER &&  
CREATE PROCEDURE loan_amt ()  
BEGIN    
    SELECT * FROM loan WHERE loan_amount > 300000;
    SELECT COUNT(fname) AS loan_detail FROM loan;    
END &&  
DELIMITER ;
call loan_amt;




DELIMITER &&  
CREATE PROCEDURE acct_status (in entered_status varchar(20), out list_of_cust varchar(30))  
BEGIN  
    SELECT COUNT(account.custid) into list_of_cust FROM account where astatus= entered_status;    
END &&  
DELIMITER ;
call acct_status('active', @a);
select @a;



