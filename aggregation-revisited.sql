-- Select the first name, last name, and email address of all the customers who have rented a movie.
SELECT first_name, last_name, email
FROM customer
JOIN rental 
ON customer.customer_id = rental.customer_id
JOIN inventory 
ON rental.inventory_id = inventory.inventory_id
JOIN film 
ON film.film_id = inventory.film_id
JOIN film_category 
ON film_category.film_id = film.film_id
JOIN category 
ON category.category_id = film_category.category_id
GROUP BY first_name, last_name, email;

-- What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
SELECT cus.customer_id, CONCAT(first_name, ' ', last_name), AVG(payment.amount) AS payment 
FROM customer AS cus
JOIN payment
ON cus.customer_id = payment.customer_id
GROUP BY cus.customer_id;

-- Select the name and email address of all the customers who have rented the "Action" movies.
-- Write the query using multiple join statements
SELECT first_name, last_name, email
FROM customer
JOIN rental 
ON customer.customer_id = rental.customer_id
JOIN inventory 
ON rental.inventory_id = inventory.inventory_id
JOIN film 
ON film.film_id = inventory.film_id
JOIN film_category 
ON film_category.film_id = film.film_id
JOIN category 
ON category.category_id = film_category.category_id
WHERE category.name = "Action"
GROUP BY first_name, last_name, email;

-- Write the query using sub queries with multiple WHERE clause and IN condition

SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN 
	(SELECT 
		customer_id
	FROM 
		rental
	WHERE  
		inventory_id IN 
	   (SELECT 
		inventory_id
	   FROM 
         inventory
       WHERE 
		film_id IN 
	       (SELECT 
              film_id
		    FROM 
              film
			WHERE film_id IN 
              (SELECT 
                 film_id
			   FROM 
				    film_category
               WHERE 
		            category_id IN
			        (SELECT
				       category_id
			         FROM 
					   category
			         WHERE 
				       name = "Action")
))));
        
-- Verify if the above two queries produce the same results or not
# The two qureries produce the same results.
            
-- Use the case statement to create a new column classifying existing columns as either or high value transactions based on the amount of payment. If the amount is between 0 and 2, label should be low and if the amount is between 2 and 4, the label should be medium, and if it is more than 4, then it should be high.


          
         
    
