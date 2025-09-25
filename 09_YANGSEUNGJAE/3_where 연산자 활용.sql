-- 04. where : 특정 조건에 맞는 레코드만 선택
-- 1. 비교연산자

SELECT
		menu_code,
		menu_name
	FROM tbl_menu
	WHERE orderable_status = 'Y';

SELECT
		menu_name,
		menu_price,
		orderable_status
	FROM tbl_menu
	WHERE menu_price = '13000';

SELECT
		menu_code,
		menu_name
	FROM tbl_menu
	WHERE orderable_status != 'Y'; -- <>도 사용가능
	
-- 대소비교 (<, >, <=, >=)

SELECT
		menu_name,
		menu_price
		orderable_status
	FROM tbl_menu
	-- WHERE menu_price < '13000';
	-- WHERE menu_price <= '13000';
	-- WHERE menu_price >= '13000';
	WHERE menu_price > '13000';

-- 2. 논리연산자
-- and 연산자
SELECT
		*
	from tbl_menu
	WHERE orderable_status = 'Y'
	AND category_code = 10;

-- or 연산자
SELECT
		*
	from tbl_menu
	WHERE orderable_status = 'Y'
	or category_code = 10;

SELECT
		*
	from tbl_menu
	WHERE (category_code = 4
	or menu_price = 9000)
	AND menu_code > 10;

-- 3 between and 연산자

SELECT
		*
	FROM tbl_menu
	WHERE menu_price >= 10000
	AND menu_price  <= 25000;

SELECT
		*
	FROM tbl_menu
	WHERE menu_price NOT BETWEEN 10000 AND 25000
	ORDER BY menu_code;


-- 4 like 연산자

SELECT
		*
	FROM tbl_menu
	WHERE menu_name LIKE '%마늘%';

SELECT
		*
	FROM tbl_menu
	WHERE menu_name LIKE '%아메리카노';

SELECT
		*
	FROM tbl_menu
	WHERE menu_name LIKE '생%';

SELECT
		*
	FROM tbl_menu
	WHERE menu_name LIKE '_마늘%'
	
-- '_' 나 '%' 와 같은 기호를 실제로 검색하고 싶을 경우
-- like '&\_&', '%!_%' escape '!' 와 같은 방식으로 escape 한다
	
SELECT 
		*
	FROM tbl_menu
	WHERE menu_price >= 5000
	AND category_code = 10
	AND menu_name LIKE '%갈치%';

-- in 연산자

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
	WHERE category_code in(4,5,6)
	ORDER BY category_code;

SELECT
		*
	FROM tbl_menu
	WHERE category_code NOT in(4,5,6)
	ORDER BY category_code;	
	
-- 6. is null : null 값 비교(비교연산자 사용불가)

SELECT
		*
	FROM tbl_category
	WHERE ref_category_code is NULL;
	
SELECT
		*
	FROM tbl_category
	WHERE ref_category_code is NOT NULL;	
	