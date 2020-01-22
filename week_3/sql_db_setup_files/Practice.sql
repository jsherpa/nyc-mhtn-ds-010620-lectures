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


    