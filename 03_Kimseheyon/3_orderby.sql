-- 2. order by: result set을 정렬
select * 
	from tbl_menu;

SELECT 	
		  menu_code
		, menu_name
		, menu_price
	from tbl_menu
	order by menu_price; -- ascending order 오름차순 (default)
 -- order by menu_price desc; -- descending order 내림차순 
-- 정렬 기준 상 동일한 값이 있을 때 그 다음 정렬 기준을 세울 수 있음
SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 ORDER BY menu_price DESC, menu_name; -- 가격은 내림차순, 메뉴 이름은 오름차순으로 정렬
 
-- 연산 결과로 결과 집합 정렬
 SELECT
	   menu_name 
     , menu_code
     , menu_price
     , menu_code * menu_price
  FROM tbl_menu
 ORDER BY menu_code * menu_price desc;

 SELECT
       menu_code as code
     , menu_price as price
     , menu_code * menu_price as result
  FROM tbl_menu
 ORDER BY result DESC;

 -- field 함수 
select field('A','A','B','C'); -- 1
select field('B','A','B','C'); -- 2
select field('C','A','B','C'); -- 3
select field('D','A','B','C'); -- 0

-- field 함수를 활용하면 정렬 데이터 기준 설정 가능
SELECT 
		  menu_name
		, orderable_status
		, field(orderable_status, 'Y','N') as orderable
	FROM tbl_menu
    ORDER BY orderable;
 
 -- null 값의 정렬 방식
 -- 오름차순으로 정렬 시 null이 가장 처음 (default)
SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
 ORDER BY ref_category_code;
 -- 내림차순으로 정렬 시 null이 가장 마지막 (default)
SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
 ORDER BY ref_category_code DESC ; 	
 -- 오름차순으로 정렬하고 null이 마지막으로 가도록 정렬할때, -(마이너스)기호 붙이고 내림차순으로 정렬
 SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
 ORDER BY -ref_category_code DESC ; 
 -- 내림차순으로 정렬하고 null이 처음으로 가도록 정렬할때, -(마이너스)기호 붙이고 오름차순으로 정렬
  SELECT
       category_code
     , category_name
     , ref_category_code
  FROM tbl_category
 ORDER BY -ref_category_code ; 