USE menudb;

-- 2. order by: result set을 정렬
SELECT * FROM tbl_menu;

SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
-- ORDER BY menu_price ASC; -- Ascending Order 오름차순
-- ORDER BY menu_price; ASC 생략 가능(default 값) 
ORDER BY menu_price DESC; -- Descending Order 내림차순 

-- 정렬 기준 상 동일한 값이 있을 때 
-- 그 다음 정렬 기준을 세울 수 있음 
SELECT
       menu_code menu
     , menu_name
     , menu_price
  FROM tbl_menu
ORDER BY menu_price DESC, menu;

-- ORDER BY절 뒤에 컬럼명 외의 연산 결과, 별칭 등을 사용할 수 있음 
SELECT 
	    menu_code
	  , menu_name
	  , menu_price * menu_code
 FROM tbl_menu
ORDER BY menu_price * menu_code;

SELECT 
	    menu_code '메뉴코드'
	  , menu_name '메뉴명'
	  , menu_price * menu_code '연산결과'
 FROM tbl_menu
ORDER BY 연산결과;

-- field 함수 
SELECT FIELD('A', 'A', 'B', 'C'); -- return: 1
SELECT FIELD('B', 'A', 'B', 'C'); -- return: 2
SELECT FIELD('C', 'A', 'B', 'C'); -- return: 3
SELECT FIELD('D', 'A', 'B', 'C'); -- return: 0
-- field 함수를 활용하면 정렬 데이터 기준을 설정 가능 
SELECT 
	   menu_name
	 , orderable_status 
	 , FIELD(orderable_status, 'Y', 'N') '정렬'
  FROM tbl_menu
 ORDER BY 정렬;

-- null 값이 존재하는 칼럼에 대한 정렬 
SELECT 
	   category_code
	 , category_name
	 , ref_category_code 참조관계 
  FROM tbl_category; -- null 값이 가장 위로 

SELECT 
	   category_code
	 , category_name
	 , ref_category_code 참조관계 
  FROM tbl_category
ORDER BY 참조관계 DESC; -- null 값이 가장 아래로 








