-- 2. order by: result set을 정렬
-- select * from tbl_menu;

-- select
-- 		menu_code
-- 	,	menu_name
-- 	,	menu_price
-- 	from tbl_menu
-- 	-- order BY menu_price ASC; 
-- 	-- ascending order
-- 	-- order by me
  order by menu_price desc;
 	order by menu_price desc, menu_code; 
-- 생략하면 무조건 오름차순이다.  	

select menu_name
	from tbl_menu
	order by menu_name desc, menu_code;	

-- order by절 뒤에 컬럼명 외에 연산 결과, 별칭 등을 사용할 수 있다.
select	menu_code
	,	menu_name
	,	menu_price * menu_code
	from tbl_menu
	order by menu_price * menu_code
	
select	menu_code "메뉴코드"
	,	menu_name "메뉴명"
	,	menu_price * menu_code "연산결과"
	from tbl_menu
	order by 연산결과;

-- field 함수
select FIELD("A", "A", "B", "C"); -- 1 A의 위치가 어디에 있나요?
select FIELD("B", "A", "B", "C"); -- 2 B의 위치가 어디인가요?
select FIELD("C", "A", "B", "C"); -- 3 
select FIELD("D", "A", "B", "C"); -- 0 없으면 0이다

-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있다. 
select 
		menu_name
	,	orderable_status
	,	FIELD(orderable_status, 'Y', 'N')
	from tbl_menu
	order by FIELD(orderable_status, 'Y', 'N');

select
		category_code
	 ,	category_name
	 ,	ref_category_code
	 from tbl_category
	 -- order by ref_category_code ASC;
	 -- order by ref_category_code DESC; -- asc 생략 가능
	 order by -ref_category_code;