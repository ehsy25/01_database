-- 04. where : 특정 조건에 맞는 레코드만 선택.
-- 1. 비교 연산자
-- 값이 일치하는지 확인(=)

SELECT
	    menu_code
	  , menu_name
	FROM tbl_menu
	WHERE orderable_status = 'Y';

SELECT
	    menu_code
	  , menu_name
	  , menu_price
	FROM tbl_menu
	WHERE menu_price = 13000;


-- 값이 일치하지 않는지 확인(!=, <>) 
SELECT
	  menu_code
	, menu_name
	, orderable_status
	FROM tbl_menu
	-- WHERE orderable_status != 'Y' ;
	WHERE orderable_status <> 'Y' ;


-- 대소비교 (>, >=, <, <=) 
SELECT
	  menu_code
	, menu_name
	, menu_price
	FROM tbl_menu
	-- WHERE menu_price > 13000;
	-- WHERE menu_price >= 13000;
	-- WHERE menu_price < 13000;
	WHERE menu_price <= 13000;


-- 2.논리 연산자(AND)
-- a and b : a와 b 모두 만족할 경우 true. and는 Falut를 앞에두면 편하다(그럼 뒤에를 볼 필요가 없기 때).
SELECT
	  *
	FROM tbl_menu
	WHERE orderable_status = 'Y'
		AND category_code = 10;


-- a or b : a 또는 b 하나만 만족해도 	true.
SELECT
	  *
	FROM tbl_menu
	WHERE orderable_status = 'Y'
		OR category_code = 10;


-- and, or 연산자 중 우선순위가 높은 연산자는?  and이다. 
SELECT
	  *
	FROM tbl_menu
	WHERE category_code = 4
		OR menu_price = 9000
		AND menu_code > 10;

SELECT
	  *
	FROM tbl_menu
	WHERE (category_code = 4
		OR menu_price = 9000) -- OR먼저 연산하고 싶으면 괄호를 해주면 우선순위로 먼저 연산된다. 
		AND menu_code > 10;


-- 3. between and 연산자(~이상 ~이하의 값을 가져올때)(그냥 >=,<=보다 between가 우선순위다.)
SELECT
	  *
	FROM tbl_menu
	-- WHERE menu_price >= 10000
		-- AND menu_price <= 25000;
	WHERE menu_price BETWEEN 10000 AND 25000
	ORDER BY menu_price;


-- not 연산자와 조합 
SELECT
	  *
	FROM tbl_menu
	WHERE menu_price NOT BETWEEN 10000 AND 25000
	ORDER BY menu_code;


-- 4. Like 연산자(키워드 찾을때 많이 사용. 특수기호를 사용 -> %)%가 어디에 있느냐에 따라 찾고자하는 내용이 달라진다.
SELECT
		*
	FROM tbl_menu
	WHERE menu_name LIKE '%마늘%'; -- 어디가되었든지 마늘이라는 키워드가 포함되면 선택한다.
	
SELECT
		*
	FROM tbl_menu
	WHERE menu_name LIKE '%아메리카노'; -- %를 앞에만 붙이면 해당 키워드로 끝나는 걸 선택햔다. 
	WHERE menu_name LIKE '아메리카노%'; -- %를 뒤에만 붙이면 해당 키워드로 시작하는 걸 선택햔다.
	

-- '_'(언더스코어)나 '%'와 같은 기호를 실제로 검색하고 싶을 경우.
-- LIKE '%\_' 또는
-- LIKE '%!_' ESCAPE '!' 와 같은 방식으로 ESCAPE 한다.
SELECT
		*
	FROM tbl_menu
	WHERE menu_name LIKE '_마늘%'; 

SELECT
		*
	FROM tbl_menu
	WHERE menu_name NOT LIKE '_마늘%'; 

-- 메뉴 가격이 5000원 이상이고, 카테고리 코드가 10이며,
-- 메뉴 이름에 갈치가 들어가는 메뉴의 모든 컬럼 값을 조회하는 쿼리를 작성하시오.
SELECT 
		*
	FROM tbl_menu
	WHERE menu_price > 5000
		AND category_code = 10
		AND menu_name LIKE '%갈치%';


-- 5. in 연산자.(in이 or보다 연산순위가 높다.)
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
	ORDER BY category_code ;
	
-- not 연산자 조합  
SELECT
		*
	FROM tbl_menu 
	WHERE category_code NOT in(4,5,6)
	ORDER BY category_code ;


-- 6. is null : null 값 비교(비교 연산자 사용 불가)
SELECT 
		*
	FROM tbl_category
	WHERE ref_category_code IS NULL; -- (NULL 인것만 가져오라는 뜻.)
	
SELECT 
		*
	FROM tbl_category
	WHERE ref_category_code IS NOT NULL; -- (NULL이 아닌것만 가져오라는 뜻.)


	