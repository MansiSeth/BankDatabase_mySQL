use normalizedDBMSproj;


/*Negative Balance*/
delimiter &&
create trigger after_withdraw_negativebalance
before update on account
for each row
begin 
	if (account.curr_balance < 0)
    then 
		signal sqlstate '02000' set message_text = 'warning';
	end if;
end
&& delimiter ;





/*Auto update account balance on withdrawal*/
delimiter &&
create trigger afterupdate_withdrawal
after update on trandetails
for each row
begin 
	update account
    set curr_balance = curr_balance - new.transaction_amount
    where id = new.tnumber;	
end
&& delimiter ;


/*Auto update account balance on deposit*/
delimiter &&
create trigger afterupdate_deposit
after update on trandetails
for each row
begin 
	update account
    set curr_balance = curr_balance + new.transaction_amount
    where id = new.tnumber;	
end
&& delimiter ;


/*Auto update account balance on withdrawal*/
delimiter &&
create trigger afterupdate_withdrawal
after update on trandetails
for each row
begin 
	update account
    set curr_balance = curr_balance - new.transaction_amount
    where id = new.tnumber;	
end
&& delimiter ;


/*Auto update account balance on deposit*/
delimiter &&
create trigger afterupdate_deposit
after update on trandetails
for each row
begin 
	update account
    set curr_balance = curr_balance + new.transaction_amount
    where id = new.tnumber;	
end
&& delimiter ;


