SELECT 
   p.product_name AS  "Prod_name",
   p.list_price price 
FROM
	production.products p
;

SELECT
	model_year
FROM
	production.products
GROUP BY
	model_year
;
-- To search things using real data
SELECT 
	product_name
    list_price
FROM
	production.products
WHERE
	product_name LIKE "Trek%"
AND 
	list_price <= 200
;

SELECT 
	product_name
    list_price
FROM
	production.products
WHERE
	list_price BETWEEN 150 AND 250
;


SELECT
	first_name,
    last_name,
    email,
    phone
FROM 
	sales.customers
WHERE
	phone IS NULL
;

SELECT
	first_name,
    last_name,
    email,
    phone,
    state
FROM 
	sales.customers
WHERE
	state = "NY"
;

SELECT 
*
FROM 
	sales.orders
WHERE
	order_status = 3
;

SELECT 
	store_id,
	COUNT(*)
	 
FROM
	sales.orders
WHERE
	order_status = 3
GROUP BY
1
;

SELECT 
	COUNT(o.customer_id),
    s.email
	
FROM
	sales.orders o
INNER JOIN
	sales.staffs s
ON
	o.staff_id = s.staff_id
GROUP BY
	s.email
;

SELECT
	s.staff_id,
    s.first_name,
    s.last_name,
	s.store_id,
    COUNT(order_status)
FROM 
	sales.staffs s
INNER JOIN
	sales.orders o 
ON
	s.staff_id = o.staff_id
WHERE
	-- s.store_id = 3
GROUP BY
	1,2,3,4
;

SELECT 
	order_id,
    order_date,
    customer_id
FROM
	sales.orders
WHERE
	customer_id IN (
		SELECT 
			customer_id
		FROM
			sales.customers
		WHERE
			city = 'New York'
    ) 
ORDER BY
	order_date DESC
;


SELECT
	COUNT(product_id),
    product_name
    
FROM
	production.products
WHERE
	product_name LIKE "Surly%"
GROUP BY
	product_name
HAVING
	COUNT(product_id) = 2
ORDER BY
	COUNT(product_id)DESC
;
-- 

SELECT 
	CASE order_status
		WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Processing'
        WHEN 3 THEN 'Rejected'
        WHEN 4 THEN 'Completed'
	 END AS order_status_str, 
     COUNT(order_id) AS order_count
        
FROM
	sales.orders
WHERE
	YEAR(order_date) = 2018
ORDER BY
	order_status DESC
;


SELECT
	SUM(CASE
		  WHEN order_status =1
          THEN 1
          ELSE 0
		END) AS "Pending",
	SUM(CASE
		  WHEN order_status =2
          THEN 1
          ELSE 0
		END) AS "Processing",
	SUM(CASE
		  WHEN order_status =3
          THEN 1
          ELSE 0
		END) AS "Rejected",
	SUM(CASE
		  WHEN order_status =4
          THEN 1
          ELSE 0
		END) AS "Completed",
	COUNT(*) AS total 
FROM
	sales.orders
WHERE
	YEAR(order_date) = 2018
;

SELECT
	o.order_id,
    SUM(quantity * list_price) AS order_value,
    CASE
		WHEN SUM(quantity * list_price) < = 500
			THEN "Very low"
		WHEN SUM(quantity * list_price) > 500 AND 
			 SUM(quantity * list_price) < = 1000
             THEN "LOW"
		WHEN SUM(quantity * list_price) > = 1000 AND
			 SUM(quantity * list_price) < = 5000
             THEN "Medium"
		WHEN SUM(quantity * list_price) > = 5000 AND
			 SUM(quantity * list_price) < = 10000
             THEN "High"
		WHEN SUM(quantity * list_price) >  10000
             THEN "Very High"
		END AS order_priority
FROM
	sales.orders o 
INNER JOIN
	sales.order_items  i 
ON 
	o.order_id = i.order_id
WHERE
	YEAR(o.order_date) = 2018
GROUP BY
	o.order_id
;

-- Union 
(SELECT
	product_id,
    product_name,
    list_price
FROM
	production.products
WHERE
	list_price >100 )
;
UNION ALL  
(SELECT
	product_id,
    product_name,
    list_price
FROM
	production.products
WHERE
	list_price <500) 
;
