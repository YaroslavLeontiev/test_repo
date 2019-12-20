CREATE DEFINER=`root`@`localhost` PROCEDURE `task2_1`(
in id_customer smallint(5),
out customer_city varchar(50),
out customer_phone varchar(20)
)
BEGIN
	select cities.city, addresses2_1.phone into customer_city, customer_phone from sakila.address as addresses2_1
    left join sakila.customer as customers2_1 on addresses2_1.address_id=customers2_1.address_id
    left join sakila.city as cities on addresses2_1.city_id=cities.city_id
    where customers2_1.customer_id=id_customer;
END