-- 01. select : 특정 테이블에서 원하는 데이터 조회
use menudb;

select 
        menu_name
  from tbl_menu;

select
        menu_code
      , menu_name
      , menu_price
      , category_code
      , orderable_status
  from tbl_menu;

-- '*' : 모든
select
        *
  from tbl_menu;

-- 단독으로 select 문 사용
select 7+3;
select 7*3;
select 7%3;
select 7/3;

-- 내장함수 확인
select now();
select concat('홍', '', '길동');

-- 컬럼 별칭

select now() as 현재시간;
-- select NOW() as 현재 시간; >> 현재 시간 처럼 사용하면 안 된다.
select now() as '현재 시간';
select now() as "현재 시간";

select now() 현재시간;
select now() '현재 시간';
select now() "'현재 시간'";
select now() '"현재 시간"';
-- select NOW() ''현재 시간'' -- 이렇게는 오류
-- full name

SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 -- ORDER BY menu_price asc ; -- Ascending Order 오름차
 -- ORDER BY menu_price; -- asc는 생략해도된다.(default)
  ORDER BY menu_price desc; -- desc는 내림차순
  
  
  -- 정렬 기준 상 동일한 값이 있을 때.
  -- 그 다음 정렬 기준을 세울 수 있다.
  
  SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
  order by menu_price desc, menu_code ;
  
  
 -- order by절 뒤에 컬럼명 외에 연산 결과, 별칭 등을 사용할 수 있다.
  select
  	   menu_code
  	 , menu_name
  	 , menu_price * menu_code
  from tbl_menu
  order by menu_price * menu_code
  
    select
  	   menu_code '메뉴 코드'
  	 , menu_name '메뉴명'
  	 , menu_price * menu_code '연산결과'
  from tbl_menu
  order by 연산결과;
    
 -- field 함수
select field('A', 'A', 'B', 'C'); -- 1
select field('B', 'A', 'B', 'C'); -- 2
select field('C', 'A', 'B', 'C'); -- 3
select field('D', 'A', 'B', 'C'); -- 0은 찾는 값이 없을 경우.

-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있다. 
select
	  menu_name
	, orderable_status
	, field(orderable_status, 'Y', 'N') 판매여부
from tbl_menu;
order 판매여부 -- field(orderable_status, 'Y', 'N');


-- null 값의 정렬 방식
select
	    category_code
	  , category_name
	  , ref_category_code
	from tbl_category;
	-- order by ref_category_code;
	-- order by ref_category_code desc;
	order by -ref_category_code;


  		