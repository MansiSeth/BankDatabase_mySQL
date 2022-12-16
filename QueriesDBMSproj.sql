use normalizedDBMSproj;


/*Query all accounts that have ‘active’ status*/
Select c.fname, c.mname, c.ltname 
from customer c
join account a
on a.custid = c.custid
where astatus = 'active';


/*Query a city-wise list of accounts*/

select b.bcity, a.acnumber
from account a
join branch b 
on a.bid = b.bid;
group by bcity asc;


/*Query a citywise list of account holder names with active bank accounts*/
select b.bcity, c.fname, c.ltname 
from account a
join customer c
	on a.custid = c.custid
join branch b 
	on b.bid = a.bid
where a.astatus = 'active'
order by b.bcity;

/*Total withdrawal amount from every branch*/
select sum(t.transaction_amount), b.bname
from trandetails t
join account a
	on a.acnumber = t.acnumber
join branch b 
	on b.bid = a.bid
where t.transaction_type = 'withdrawal'
group by b.bname;


/*Total deposit amount from every branch*/
select sum(t.transaction_amount), b.bname
from trandetails t
join account a
	on a.acnumber = t.acnumber
join branch b 
	on b.bid = a.bid
where t.transaction_type = 'deposit'
group by b.bname;


