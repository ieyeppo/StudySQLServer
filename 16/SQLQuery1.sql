use BikeStores;
go

select p.product_id, p.product_name, 
		/*p.brand_id,*/ b.brand_name,
		/*p.category_id,*/ ct.category_name,
		p.model_year, format(p.list_price, '$#,#.00')
from production.products as p
inner join production.categories as ct
on p.category_id = ct.category_id
inner join production.brands as b
on p.brand_id = b.brand_id;

------------------------

select od.order_id, /*od.customer_id,*/ 
		concat(ct.first_name,' ', ct.last_name) as fullname,
		case od.order_status
			when 1 then '주문완료'
			when 2 then '결제완료'
			when 3 then '배송준비'
			when 4 then '출고완료'
			else '이상상태'
		end as 주문단계,
		od.order_date, od.required_date, od.shipped_date, 
		/*od.store_id, od.staff_id*/
		sr.store_name,
		concat(sf.first_name, ' ', sf.last_name) as 담당직원
from sales.orders as od
inner join sales.customers as ct
on od.customer_id = ct.customer_id
inner join sales.staffs as sf
on od.staff_id = sf.staff_id
inner join sales.stores as sr
on od.store_id = sr.store_id;

