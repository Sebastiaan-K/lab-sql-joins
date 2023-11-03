# LAB | SQL Joins

USE sakila;

SHOW TABLES;

#1 List the number of films per category:
SELECT c.name AS category_name, COUNT(fc.film_id) AS number_of_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY number_of_films DESC;

#2 Retrieve the store ID, city, and country for each store:
SELECT s.store_id, ci.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

#3 Calculate the total revenue generated by each store in dollars:
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN rental r ON st.staff_id = r.staff_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY s.store_id;

#4 Determine the average running time of films for each category:
SELECT c.name AS category_name, ROUND(AVG(f.length), 2) AS average_duration
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY average_duration DESC;

