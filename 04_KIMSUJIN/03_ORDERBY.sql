-- 2. order by : result set을 정렬

use menudb;
select * from tbl_menu;

select
		menu_code
	  , menu_name
	  , menu_price
	from tbl_menu
  order by menu_price asc;
-- Ascending order(오름차순, asc생략 가능)
 
SELECT                                       
       menu_code                             
     , menu_name                             
     , menu_price                            
  FROM tbl_menu                              
 ORDER BY menu_price desc;
-- DESC는 내림차순

-- 정렬 기준 상 동일한 값이 있을 때
-- 그 다음 정렬 기준을 세울 수 있다.
select
	  menu_code
	, menu_name
	, menu_price
   from tbl_menu
  order by menu_price desc, menu_code;

-- order by절 뒤에 칼럼명 외에 연산 결과, 별칭 등을 사용할 수 있다.
SELECT 
		menu_code
	  , menu_name
	  , menu_price * menu_code
	FROM tbl_menu
  order by menu_price * menu_code;
  
SELECT 
		menu_code '메뉴코드'
	  , menu_name '메뉴명'
	  , menu_price * menu_code '연산결과'
	FROM tbl_menu
  order by '연산결과';

-- field 함수
select FIELD('A', 'A', 'B', 'C');
select FIELD('B', 'A', 'B', 'C');
select FIELD('C', 'A', 'B', 'C');
select FIELD('D', 'A', 'B', 'C');
-- 찾는 값이 없을 경우 0 반환

-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있다.

select
		menu_name
	  , orderable_status
	  , FIELD(orderable_status, 'Y', 'N')
	from tbl_menu
  order by FIELD(orderable_status, 'Y', 'N');

select
		menu_name
	  , orderable_status
	  , FIELD(orderable_status, 'Y', 'N') 판매여부
	from tbl_menu
  order by 판매여부;

-- null 값으이 정렬 방식
select
		category_code
	  , category_name
	  , ref_category_code
	from tbl_category;


select
		category_code
	  , category_name
	  , ref_category_code
	from tbl_category
  order by ref_category_code desc;

select
		category_code
	  , category_name
	  , ref_category_code
	from tbl_category
  order by -ref_category_code;

