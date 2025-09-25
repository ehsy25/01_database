-- 04. where : 특정 조건에 맞는 레코드만 선택 가능
-- 1. 비교 연산자
-- 값이 일치하는지 확인(=)

SELECT 
		menu_code,
		menu_name
	FROM tbl_menu
 WHERE orderable_status = 'Y';

SELECT 
		menu_code,
		menu_name
	FROM tbl_menu
 WHERE orderable_status = 'N';

SELECT 
		menu_code,
		menu_name
	FROM tbl_menu
 WHERE menu_price = 13000;

-- 값이 일치하지 않는지 확인(!=, <>)

SELECT 
		menu_code,
		menu_name
	FROM tbl_menu
--  WHERE orderable_status != 'N';
 WHERE orderable_status <> 'Y';

-- 대소비교 (>, >=, <, <=)
SELECT 
		menu_code,
		menu_name
	FROM tbl_menu
-- WHERE menu_price > 13000;
-- WHERE menu_price < 13000;
-- WHERE menu_price >= 13000;
 WHERE menu_price <= 13000;

-- 2. 논리연산자(AND, OR)
-- a and b : a와 b가 모두 만족할 경우 true
SELECT
		* -- (4)
	FROM tbl_menu -- (3)
 WHERE orderable_status = 'Y' -- (1)
 	AND category_code = 10; -- (2)
 	
-- a or b : a 또는 b 하나만 만족해도 true
SELECT 
		*
	FROM tbl_menu
 WHERE orderable_status ='Y'
 	OR category_code = 10;

-- and, or 연산자 중 우선 순위가 높은 연산자는? AND
SELECT
		*
	FROM tbl_menu
WHERE (category_code = 4
	OR menu_price = 9000)
	AND menu_code > 10;

-- 3. between and 연산자(이상 .. 이하의 값을 가져올 때)
SELECT 
		* 
	FROM tbl_menu
 WHERE menu_price >= 10000
 	AND menu_price <= 25000;

SELECT
		*
	FROM tbl_menu tm 
 WHERE menu_price BETWEEN 10000 AND 15000
ORDER BY menu_price;

-- not 연산자와 조합
SELECT
		* 
	FROM tbl_menu tm 
 WHERE menu_price NOT BETWEEN 10000 AND 25000
ORDER BY menu_code;

-- 4. LIKE 연산자 (%의 위치에 따라 달라짐)
SELECT 
		*
	FROM tbl_menu tm;
 -- WHERE menu_name LIKE '%마늘%' -- 위치와 상관없이 해당 키워드가 포함되면 선택
 -- WHERE menu_name LIKE '%아메리카노' -- 해당 키워드로 끝나는 경우 선택
 -- WHERE menu_name LIKE '흑%' -- 해당 키워드로 시작하는 경우 선택


SELECT
		*
	FROM tbl_menu
WHERE menu_name LIKE '_마늘%'; -- 앞 한 글자 뒤에 해당 키워드가 있는 경우(공백 포함)

-- '_' 나 '%'와 같은 기호를 실제로 검색하고 싶을 경우
-- LIKE '%\_%' 또는
-- LIKE '%!_%' ESCAPE '!'와 같은 방식으로 ESCAPE 한다.

SELECT 
		*
	FROM tbl_menu
WHERE menu_name NOT LIKE '%마늘%';

-- 메뉴 가격이 5000원 이상이고, 카테고리 코드가 10이며
-- 메뉴 이름에 갈치가 들어가는 메뉴의 모든 컬럼 값을 조회하는 쿼리를 작성하시오.

SELECT 
		*
	FROM tbl_menu
WHERE menu_price >= 5000
	AND category_code = 10
	AND menu_name LIKE '%갈치%';

-- 5. IN 연산자
SELECT 
		*
	FROM tbl_menu tm
 WHERE tm.category_code = 
 	OR tm.category_code = 5
 	OR tm.category_code = 6
 ORDER BY category_code;

SELECT
		*
	FROM tbl_menu
 WHERE category_code IN(4, 5, 6);

SELECT
		*
	FROM tbl_menu
 WHERE category_code NOT IN(4, 5, 6);

-- 6. is null : null 값 비교 (null 값은 비교 연산자 사용 불가)
SELECT 
		*
	FROM tbl_category
 WHERE ref_category_code = NULL; -- null 값이 나오지 않음

SELECT 
		*
	FROM tbl_category tc 
 WHERE tc.ref_category_code IS NULL; -- null인 값만 가져옴
 
 SELECT 
 		*
 	FROM tbl_category
  WHERE ref_category_code IS NOT NULL; -- null이 아닌 값만 가져옴