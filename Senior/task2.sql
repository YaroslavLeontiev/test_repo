CREATE DEFINER=`root`@`localhost` PROCEDURE `task2`(
in adress_store1 varchar(50)
)
BEGIN
	declare id_customer, cur_finished int default 0;
	declare name_customer varchar(25);
	declare amount_customer decimal(5,2);
	DECLARE cur_customer CURSOR FOR
	SELECT customer3.customer_id, concat(customer3.first_name, " ", customer3.last_name) as ФИО, sum(payment3.amount)
    FROM sakila.customer as customer3
	left join sakila.store as store3 on customer3.store_id=store3.store_id
	left join sakila.address as address3 on store3.address_id=address3.address_id
	left join sakila.payment as payment3 on  customer3.customer_id=payment3.customer_id
    where address3.address=adress_store1
    group by customer3.customer_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
    SET cur_finished= 1;
	open cur_customer;
		while (cur_finished = 0)
        do
			fetch cur_customer into id_customer, name_customer, amount_customer;
			call task2_1(id_customer, @city_of_customer, @phone_of_customer);
			select id_customer as ID, name_customer, amount_customer, @city_of_customer as City, @phone_of_customer as Phone;
		end while;
	close cur_customer;
	
    SELECT sum(bill.amount) as 'Общая сумма' FROM sakila.payment as bill
	left join sakila.staff as worker
	on bill.staff_id=worker.staff_id
	left join sakila.store as moll
	on worker.store_id=moll.store_id
	left join sakila.address as address
	on moll.address_id=address.address_id
	where address.address=adress_store1;
END