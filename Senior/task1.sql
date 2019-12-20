CREATE DEFINER=`root`@`localhost` PROCEDURE `task1`(
in rental_rate_1 decimal(4,2), 
in rating_1 enum('G','PG','PG-13','R','NC-17')
)
BEGIN
	select title as "Название фильма",  release_year as "Год выпуска", description as "Описание" from film
    where rental_rate < rental_rate_1 AND rating=rating_1;
END