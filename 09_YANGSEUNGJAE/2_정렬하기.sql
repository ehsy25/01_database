-- 2. ORDER BY : result set을 정렬


select 
		menu_code, 
		menu_name, 
		menu_price 
	from tbl_menu 
 order by menu_price;



select 
		menu_code, 
		menu_name, 
		menu_price 
	from tbl_menu 
 order by menu_price desc, menu_name asc;

-- order by절 뒤에 컬럼명 외에 연산 결과, 별칭 들을 사용할 수 있다.

select 
		menu_code as '메뉴코드', 
		menu_name as '메뉴이름', 
		menu_price * menu_code as '연산결과' 
	from tbl_menu 
 order by 연산결과 desc, menu_name asc;

select 
		menu_code as '메뉴코드', 
		menu_name as '메뉴이름', 
		menu_price as '메뉴가격' 
	from tbl_menu 
 order by menu_price desc, menu_name asc;

-- field 함수

select field('A', 'A', 'B', 'C');

select field('B', 'A', 'B', 'C');

select field('C', 'A', 'B', 'C');

select
		menu_name,
		orderable_status,
		field(orderable_status, 'Y', 'N') 판매여부
	from tbl_menu
	order by 판매여부;

select
		menu_name,
		orderable_status
	from tbl_menu
	order by field(orderable_status, 'N', 'Y');

-- null 값의 정렬 방식
select 
		category_code,
		category_name,
		ref_category_code
	from tbl_category
	order by ref_category_code;

select 
		category_code,
		category_name,
		ref_category_code
	from tbl_category
	order by ref_category_code DESC;

