select 
		menu_name as '이름',
		menu_price as '가격',
		menu_code as '번호'
	from tbl_menu
	order by 가격 desc, 번호;

select NOW() as '현재 시간';

select concat('홍','', '길동') as 'full name'
