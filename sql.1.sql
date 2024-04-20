Q1. Who is the senior most employee based on the job title ?

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1

Q2. Which country have the most invoices ?


SELECT COUNT(*) AS c ,billing_country
FROM invoice
GROUP BY billing_country
ORDER BY c DESC


Q3. What are top 3 value in total invoice ?

SELECT total FROM invoice 
ORDER BY total DESC
LIMIT 3

Q4. Which country has been best customer? We would like to throw the promotional music festival we made the most money.Write the quary the return 
one city thats has the heighest sum of the invoice totals.Return both the city & sum of all invoice tables

SELECT SUM(total) AS total_invoice , billing_city
FROM invoice
GROUP BY billing_city
ORDER BY total_invoice DESC

Q5. Who is the best customer? the customer who has spend the most money will be decleard the best customer.Write the quary that return the
person who has spend the most money 

SELECT c.customer_id,c.first_name,c.last_name ,SUM (i.total) AS total 
FROM customer AS c
JOIN invoice AS i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total DESC
LIMIT 1

Q6. Write quary to return the e-mail,first_name,last_name & Gener of rock music listeners.Return your list orders alphabaticallys by email 
starting with A

SELECT DISTINCT c.email,c.first_name,c.last_name
FROM customer AS c
JOIN invoice AS i 
ON c.customer_id = i.customer_id
JOIN invoice_line AS il
ON i.invoice_id = il.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track AS t
	JOIN genre AS g
	ON t.genre_id = g.genre_id
	WHERE g.name LIKE 'Rock'
)
ORDER BY email;




















































