Use normalizedDBMSproj;

drop function if exists balcheck ;
delimiter &&
create function balcheck(actno varchar(20)) 
returns int  
deterministic  
BEGIN
declare result int ;
	select curr_balance into result from account
    where acnumber = actno;
    return result ;
    end;
&& delimiter ;

select balcheck('a00001') as result;


drop function if exists deposit ;
delimiter &&
create function deposit(actno varchar(20), amt int) 
returns int  
deterministic  
BEGIN
declare result int ;
	select curr_balance into result from account
    where acnumber = actno;
    set result = result + amt;
    return result ;
    end;
&& delimiter ;

select deposit('a00001',100) as result;


drop function if exists NumofTransactionbyacno ;
delimiter &&
create function NumofTransactionbyacno(actno varchar(20) ) 
returns int  
deterministic  
BEGIN
declare result int ;
	Select count(tnumber) into result from trandetails where actno = acnumber ;
    return result ;
    end;
&& delimiter ;
select NumofTransactionbyacno('a00001') as result;



drop function if exists withdraw ;
delimiter &&
create function withdraw(actno varchar(20), amt int,curr_balance int) 
returns int
deterministic  
BEGIN
declare result int ;
	select curr_balance into result from account where acnumber = actno ;
	if curr_balance < amt
    then 
		set result = failedwithraw();
    else
		set curr_balance = result - amt;
	end if;
    return curr_balance; 
    end;
&& delimiter ;


select withdraw('a00001',1200, (select curr_balance from account where acnumber = 'a00001')) as result;


delimiter &&
create function failedwithdraw() 
returns int
deterministic 
begin
declare result int;
	set result = 0000000;
return result;
end;
&& delimiter ;

select failedwithdraw() as result;







