-- 2. order by : result set을 정렬
select 
	menu_code,
	menu_name,
	menu_price
from tbl_menu
where menu_price > 10000
ORDER BY menu_price * menu_code ASC;
