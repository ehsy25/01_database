-- 04. where : 특정 조건에 맞는 레코드만 선택
-- 1. 비교 연산자
-- 값이 일치하는지 확인(=)

SELECT 
	  menu_code
	, menu_name                                                                                                                                   
FROM tbl_menu
WHERE menu_price = 13000;

-- 값이 일치하지 않는지 확인(!=,<>)

-- 대소 비교 (>,>=,<,<=)

-- 2. 논리(AND)연산자
-- a and B : a와 b 모두 만족 (앞 선택지가 거짓이면 뒤에는 안봄)

-- OR 연산자

-- a or b : 하나만 만족해도 true

-- and , or 연산자 중 우선순위가 높은 연산자는 ? - and 

-- 3. between and 연산자
SELECT 
	*
  FROM tbl_menu
  WHERE menu_price BETWEEN 10000 AND 25000
ORDER BY menu_price ;

-- not 연산자와 조합
SELECT 
	*
  FROM tbl_menu
 WHERE menu_price NOT BETWEEN 10000 AND 25000
ORDER BY menu_price ;

-- 4. LIKE 연산자 %
SELECT
		*
	FROM tbl_menu
WHERE menu_name LIKE '%마늘%'; -- 어디가 되었든지 마늘이라는 키워드가 포함되면 선택

SELECT
		*
	FROM tbl_menu
WHERE menu_name LIKE '%샐러드'; -- 해당 키워드로 끝나는 걸 선택

SELECT
		*
	FROM tbl_menu
WHERE menu_name LIKE '우럭%'; -- 해당 키워드로 시작되는 걸 선택

-- '_' 나 '%'와 같은 기호를 실제로 검색하고 싶은 경우
-- LIKE '%\_%' 또는
-- LIKE '%!_%' ESCAPE '!'와 같은 방식으로 ESCAPE 한다.

SELECT
		*
	FROM tbl_menu
WHERE menu_name NOT LIKE '%마늘%';

-- 메뉴 가격이 5000원 이상이고, 카테고리 코드가 10이며,
-- 메뉴 이름에 갈치가 들어가는 메뉴의 모든 컬럼 값을 조회하는 쿼리를 작성하시오.
SELECT
	 	menu_code 
	 	,menu_name 
	 	,menu_price 
	 	,category_code 
	 	,orderable_status 
	FROM tbl_menu
WHERE menu_price >= 5000
 AND category_code =10
 AND menu_name LIKE '%갈치%';

-- 5. in 연산자
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
WHERE category_code IN(4,5,6)
 ORDER BY category_code ;

-- NOT 연산자 조합
SELECT
		*
	FROM tbl_menu
WHERE category_code NOT IN(4,5,6)
 ORDER BY category_code ;

-- 6. is null : null 값 비교(비교 연산자 사용 불가)
SELECT
		*
	FROM tbl_category
WHERE ref_category_code IS NULL;

-- not 연산자 사용
SELECT
		*
	FROM tbl_category
WHERE ref_category_code IS NOT NULL;