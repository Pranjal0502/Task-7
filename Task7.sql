Create view view_customer_orders as
select cust.customer_id, cust.name, count(o.order_id) as total_orders
from customers cust
left join orders o on cust.customer_id = o.user_id
group by cust.customer_id, cust.name;

select * from view_customer_orders; 

create view view_product_sales as
select p.product_id, p.name, sum(oit.quantity) as total_quantity_sold, sum(oit.quantity * oit.price) as total_revenue
from products p
join order_items oit on p.product_id = oit.product_id
group by p.product_id, p.name;

select * from view_product_sales;
