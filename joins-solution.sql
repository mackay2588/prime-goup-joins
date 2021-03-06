--Get all customers and their addresses.
 SELECT * FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

--Get all orders and their line items.
SELECT "orders"."id","line_items"."quantity","products"."description" FROM "orders" 
JOIN  "line_items" ON "orders"."id" = "line_items"."order_id" JOIN "products" 
ON "products"."id" = "line_items"."product_id";

--Which warehouses have cheetos?
SELECT "warehouse"."warehouse" FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" WHERE "products"."description" = 'cheetos';

--Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse" FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" WHERE "products"."description" = 'diet pepsi';

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", "customers"."last_name", COUNT(*) 
FROM "orders" JOIN "addresses" ON "orders"."address_id" = "addresses"."id" 
JOIN "customers" ON "customers"."id" = "addresses"."customer_id" GROUP BY "customers"."id";

--How many customers do we have?
SELECT Count(*) FROM "customers";

--How many products do we carry?
SELECT Count(*) FROM "products";

--What is the total available on-hand quantity of diet pepsi?

SELECT SUM("warehouse_product"."on_hand") FROM "warehouse_product" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."description" = 'diet pepsi';

