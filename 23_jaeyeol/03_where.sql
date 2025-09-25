-- 04. where : 특정조건애 맞는 레코드만 선택하는데 사용된다
-- 1.비교 연산자
-- 값이 일치하는지 확인(=)


SELECT 
	menu_code
	, menu_name
	FROM tbl_menu
WHERE orderable_status = 'n';


SELECT 
	menu_code
	, menu_name
	, menu_price
	FROM tbl_menu
WHERE menu_price = '13000';

-- 값이 일치하지 않는지 확인(!=, <>)
SELECT menu_code
	,menu_name
	FROM tbl_menu
	WHERE orderable_status != 'Y' ; -- orderable_status 가 Y가 아닌것을 알려주시오
	-- WHERE orderable_status <> 'Y' 위 쿼리문과 같은 부정의 뜻
	
-- 대소비교 (>, >=,<,<=)
SELECT menu_code
	,menu_name
	,menu_price
	FROM tbl_menu
	-- WHERE menu_price > 13000;  -- 메뉴 price 가 13000 이상인것을 
	
-- 2. 논리연산자
-- a and b 의 뜻 a와 b모두 만족할경우 true 
-- 하나가 false 면 다른 모든값은 f 이다 이산수학 ? 
SELECT *
	FROM tbl_menu
	WHERE (category_code = 4
	OR menu_price = 9000)
	AND category_code > 10;

SELECT *
FROM tbl_menu
WHERE menu_price >= 10000
AND menu_price <= 25000; 

-- 위 쿼리문과 같은 의미
SELECT *
FROM tbl_menu
WHERE menu_price BETWEEN 10000 AND 25000 
ORDER BY menu_price ;

-- not 연산자와 조합 
SELECT *
FROM tbl_menu
WHERE  menu_price NOT BETWEEN 10000 AND 25000 
ORDER BY menu_code ;

-- 4. like 연산자 키워드 찾을때 많이사용 % 기호를 사용 , % 기호 위치 따라서 결과가 달라짐 

SELECT *
FROM tbl_menu
WHERE menu_name LIKE '%마늘%' ; -- 마늘이라는 키워드가 어디있던지 포함만 되어 있으면 선택 '%내 용%'

SELECT *
FROM tbl_menu
WHERE menu_name LIKE '흑%' -- 해당 키워드로 시작하는 단어를 선택 '%단어' 면 해당 키워드로 끝나는 단어 찾음

SELECT *
FROM tbl_menu
WHERE menu_name LIKE '_마늘%'

-- '_' sl '%' 와 같은 기호를 실제로 검색하고 싶을 경우
-- like '%\_%' 또는 
-- like '%!_%' escape '!'와 같은 방식으로 escape 한다

SELECT * 
FROM tbl_menu
WHERE menu_name not LIKE '%마늘%';

--메뉴가격이 5000원이상 카테고리 코드가 10 
--메뉴 이름에 갈치가 들어가는 메뉴의 모든 컬럼 값을 조회하는 쿼리

select *
FROM tbl_menu
WHERE (menu_price >= 5000 and category_code = 10) and menu_name LIKE '%갈치%'

SELECT *
FROM tbl_menu
WHERE category_code NOT IN (4,5,6)
ORDER BY category_code ;

-- 6. is null : null  값 비교 (비교 연산자 사용 불가)
SELECT *
	FROM tbl_category tc 
	WHERE ref_category_code IS NULL ; -- 널값은 연산 안됨 . 그래서 is null 명령어를사용해야함
	
SELECT *
	FROM tbl_category tc 
	WHERE ref_category_code IS NOT NULL ; --  null 값이 없는 컬럼만 긁어옴 
	
--------
