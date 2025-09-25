-- 04. where : 특정 조건에 맞는 레코드만 선택
-- 1. 비교연산자
-- 값이 일치하는지 확인(=)

SELECT 
       menu_code
     , menu_name
  FROM tbl_menu
 WHERE orderable_status = 'Y';

SELECT 
       menu_code
     , menu_name
  FROM tbl_menu
 WHERE orderable_status = 'N';

SELECT 
       menu_code
     , menu_name
     , menu_price 
  FROM tbl_menu
 WHERE menu_price = 13000;


-- 값이 일치하지 않는지 확인 (!=, <>)
SELECT 
       menu_code
     , menu_name
     , orderable_status 
  FROM tbl_menu
-- WHERE orderable_status != 'Y'; (!= 와 <> 동일)
 WHERE orderable_status <> 'Y'; 

-- 대소비교 (>, >=, <, <=)
SELECT 
       menu_code
     , menu_name
     , menu_price 
  FROM tbl_menu
-- WHERE menu_price > 13000; 초과
-- WHERE menu_price >= 13000; 이상
-- WHERE menu_price < 13000; 미만
 WHERE menu_price >= 13000; -- 이하
 
 -- 2. 논리연산자(AND, OR)
 
 -- a and b : a와 b 모두 만족할 경우 true
 -- a가 false면 b 확인 안함(동작x)
 SELECT
        *
   FROM tbl_menu
  WHERE orderable_status = 'Y'
    AND category_code = 10;
 
 -- a or b : a 와 b 중 하나만 만족해도 true
  SELECT
        *
   FROM tbl_menu
  WHERE orderable_status = 'Y'
     OR category_code = 10;
 
 -- and, or 연산자 중 우선순위가 높은 연산자 = and
 
SELECT 
       *
  FROM tbl_menu
 WHERE category_code = 4
    OR menu_price = 9000
   AND menu_code > 10;

-- ( )안에 절 먼저처리
SELECT 
       *
  FROM tbl_menu
 WHERE (category_code = 4
    OR menu_price = 9000)
   AND menu_code > 10;

-- 3. between and 연산자 (이상 .. 이하의 값을 가져올때)
SELECT 
       *
  FROM tbl_menu
-- WHERE menu_price >= 10000
--   AND menu_price <= 25000;
 WHERE menu_price BETWEEN 10000 AND 25000 -- 같은 결과 도출
 ORDER BY menu_price;

-- not 연산자와 조합
SELECT 
       *
  FROM tbl_menu
 WHERE menu_price NOT BETWEEN 10000 AND 25000 -- BETWEEN 10000 AND 25000 제외한 값 도출 
 ORDER BY menu_price; 

-- 4. LIKE 연산자 ('%키워드%', '%키워드', '키워드%', 파일 전체를 검색하기 떄문에 쿼리문 속도가 느림)
SELECT 
       *
  FROM tbl_menu
 WHERE menu_name LIKE '%마늘%'; -- 어디가 되었든지 마늘 이라는 키워드 포함된 항목 도출
 
SELECT  
       *
  FROM tbl_menu
 WHERE menu_name LIKE '%아메리카노'; -- 해당 키워드로 끝나는 항목 도출
 
SELECT  
       *
  FROM tbl_menu
 WHERE menu_name LIKE '흑%'; -- 해당 키워드로 시작하는 항목 도충
 
SELECT 
       *
  FROM tbl_menu
 WHERE menu_name LIKE '_마늘%'; -- _ = escape문자, _ 갯수만큼 어떤문자라도 있는것 

-- '_' 나 '%'와 같은 기호를 실제로 검색하고 싶을 경우
-- LIKE '%\_%' 또는
-- LIKE '%!_%' ESCAPE '!' 와 같은 방식으로 ESCAPE 한다.
 
SELECT 
       *
  FROM tbl_menu
 WHERE menu_name NOT LIKE '%마늘%'; -- 마늘 빼고 모두 검색 
 
-- 메뉴 가격이 5000원 이상이고, 카테고리 코드가 10이며,
-- 메뉴 이름에 갈치가 들어가는 메뉴의 모든 컬럼 값을 조회하는 쿼리를 작석하시오.
SELECT 
       *
  FROM tbl_menu
 WHERE menu_price >= 5000
   AND category_code = 10 
   AND menu_name LIKE '%갈치%';

-- 5. in 연산자 (or 함축 in연산자가 or연산자보다 우선순위)
SELECT 
       *
  FROM tbl_menu
 WHERE category_code = 4
    OR category_code = 5
    OR category_code = 6
 ORDER BY category_code ;

SELECT 
       *
  FROM tbl_menu
 WHERE category_code IN(4, 5, 6)
 ORDER BY category_code ;

-- NOT 연산자 조합
SELECT 
       *
  FROM tbl_menu
 WHERE category_code NOT IN(4, 5, 6)
 ORDER BY category_code ;

-- 6. is null : null 값 비교(비교 연산자 사용 불가)
SELECT 
       *
  FROM tbl_category
-- WHERE ref_category_code = 'null';  결과값 도출X
-- WHERE ref_category_code IS NULL; -- null 값 도출
 WHERE ref_category_code IS NOT NULL; -- null 이외의 값 도출 