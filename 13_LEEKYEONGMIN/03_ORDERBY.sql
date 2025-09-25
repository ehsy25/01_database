-- 02. order by : result set을 정렬
select * from tbl_menu;

select 
		  menu_code
		, menu_name
		, menu_price
	from tbl_menu
order by menu_price desc; -- desc 내림차순



