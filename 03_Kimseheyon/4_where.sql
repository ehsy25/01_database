-- 04. whrer : 특정 조건에 맞는 레코드만 선택 
-- 1-1. 비교 연산자
-- 값이 일치하는지 확인(=)

SELECT 
	  menu_code
	, menu_name
	, orderable_status 
	FROM tbl_menu 
	WHERE orderable_status = 'Y';

SELECT
       menu_name
     , menu_price
     , orderable_status
  FROM tbl_menu
 WHERE menu_price = 13000;

-- 같지 않음(!=,<>) 연산자와 함께 where절 사용
SELECT
       menu_code
     , menu_name
     , orderable_status
  FROM tbl_menu
--  WHERE orderable_status <> 'Y';
 WHERE orderable_status != 'Y';

-- 대소 비교 연산자 (>,>=,<,<=)
SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 WHERE menu_price > 20000;

SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
 WHERE menu_price <= 20000;

-- 1-2. and 연산자 활용
-- 두 조건이 모두 참일 때만 결과 반환
SELECT
       menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'Y'
   AND category_code = 10;

SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE menu_price > 5000
   AND category_code = 10;

-- 1-3. or 연산자 활용
SELECT 
		menu_name
		, menu_price
		, category_code
		, orderable_status
	FROM tbl_menu
	WHERE orderable_status = 'Y'
		OR category_code = 10
	ORDER BY category_code ;

-- and와 or의 우선순위 
-- and > or
-- or의 우선순위를 높이고 싶다면 소괄호()를 사용

-- menu_price가 9000이고 menu_code가 10 이상인 것과 category_code가 4인 
SELECT
       menu_code
     , menu_name
     , menu_price
     ,category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 4
    OR menu_price = 9000
   AND menu_code > 10;
-- category_code가 4이거나 menu_price가 9000인것 들 중에 menu_code가 10 이상인 
SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE (category_code = 4
    OR menu_price = 9000)
   AND menu_code > 10;

-- 1-4. between 연산자 활용
-- between A and B : A 보다 크거나 같고 B 보다 작거나 같은 범위
SELECT
       menu_name
     , menu_price
     , category_code
  FROM tbl_menu
 WHERE menu_price BETWEEN 10000 AND 25000
 -- WHERE menu_price >= 10000
   -- AND menu_price <= 25000
 ORDER BY menu_price ;
-- 부정
SELECT 
		menu_name
		, menu_price
		, category_code
	FROM tbl_menu
	WHERE menu_price as pr NOT BETWEEN 10000 AND 25000
	-- WHERE menu_price > 25000 or menu_price < 10000
	ORDER BY menu_price ;

-- 1-5. like 연산자  활용
-- 와일드 카드
-- % : 0개 이상의 임의 문자와 매칭
-- %abc와 같은 쿼리문은 데이터를 전부 스캔해야해서 성능에 좋지 않음 
SELECT
        menu_name
      , menu_price
   FROM tbl_menu
  WHERE menu_name LIKE '%마늘%' -- 생마늘샐러드, 코다리마늘빵, 흑마늘아메리카
  ORDER BY menu_name;
-- _ : 1개의 임의 문자와 매칭 
SELECT
        menu_name
      , menu_price
   FROM tbl_menu
  WHERE menu_name LIKE '_마늘%' -- 생마늘샐러드, 흑마늘아메리카노
  ORDER BY menu_name;
-- 부정
SELECT
        menu_name
      , menu_price
   FROM tbl_menu
  WHERE menu_name NOT LIKE '%마늘%' 
  ORDER BY menu_name;
-- 메뉴 가격이 5000 이상이고 카테고리 코드가 10이며, 
-- 메뉴 이름에 갈치가 들어가는 메뉴의 모든 칼럼 값을 조회하는 쿼리를 작성하시오.
SELECT 
	*
	FROM tbl_menu
	WHERE menu_price >= 5000 
	and category_code = 10 
	and menu_name like '%갈치%' 
	ORDER BY menu_price ;

-- 와일드카드 문자 그대로 찾고 싶을 때 (escape) 
-- WHERE note LIKE '%\%%' ESCAPE '\';   -- 문자열에 '%'가 포함된 행
-- WHERE note LIKE '%\_%' ESCAPE '\';   -- '_'가 포함된 행
-- 다른 문자도 escape 문자로 지정 가능 : ESCAPE '!'
-- WHERE not LIKE '%!_%';

-- 대소문자구분
-- 기본 collation (ci): 대소문자 구분 ❌
-- SELECT 'Alice' LIKE 'alice';   -- 결과: 1 (TRUE)

-- binary collation: 대소문자 구분 ⭕
-- SELECT 'Alice' LIKE 'alice' COLLATE utf8mb4_bin;   -- 결과: 0 (FALSE)

-- BINARY 강제: 대소문자 구분 ⭕
-- SELECT BINARY 'Alice' LIKE 'alice';   -- 결과: 0 (FALSE)

-- 1-6. in 연산자 활용
SELECT 
        menu_name
      , category_code
   FROM tbl_menu
   -- where catergory_code = 4
   -- 	  or category_code = 5
   --	  or category_code = 6
  WHERE category_code IN (4, 5, 6)
  ORDER BY category_code;
-- 부정 
SELECT 
        menu_name
      , category_code
   FROM tbl_menu
  WHERE category_code NOT IN (4, 5, 6)
  ORDER BY category_code;

-- 1-7. IS NULL 연산자
SELECT 
       category_code, 
       category_name, 
       ref_category_code
  FROM tbl_category
 WHERE ref_category_code IS NULL;
-- where ref_category_code = NULL <- 틀린 표현
-- 부정 
SELECT 
       category_code, 
       category_name, 
       ref_category_code
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL;

-- =========================================
-- MariaDB / MySQL WHERE 절에서 사용 가능한 연산자
-- =========================================

-- 1️⃣ 산술 연산자
-- +, -, *, /, % : 숫자 계산

-- 2️⃣ 비교 연산자
-- =   : 같다
-- !=  : 같지 않다
-- <>  : 같지 않다
-- <   : 작다
-- <=  : 작거나 같다
-- >   : 크다
-- >=  : 크거나 같다
-- <=> : NULL-safe 비교 (NULL도 비교 가능)

-- 3️⃣ 논리 연산자
-- AND : 두 조건 모두 참일 때 참
-- OR  : 두 조건 중 하나라도 참이면 참
-- NOT : 조건의 부정

-- 4️⃣ IS 연산자
-- IS NULL       : NULL인지 검사
-- IS NOT NULL   : NULL이 아닌지 검사
-- IS TRUE       : TRUE인지 검사
-- IS FALSE      : FALSE인지 검사

-- 5️⃣ 패턴 / 범위 연산자
-- LIKE        : 문자열 패턴 매칭
-- REGEXP      : 정규표현식 매칭
-- IN(...)     : 목록 안에 있는지 검사
-- BETWEEN ... AND ... : 범위 안에 있는지 검사

-- 6️⃣ EXISTS 연산자
-- EXISTS(subquery) : 서브쿼리 결과 존재 여부

-- =========================================
-- 2️⃣ WHERE 절 연산자 우선순위 (높은 → 낮은)
-- =========================================

-- 1  : ()        - 괄호로 우선순위 명시 가능
-- 2  : +, -, ~   - 단항 산술, 비트 NOT
-- 3  : *, /, %   - 곱셈, 나눗셈, 나머지
-- 4  : +, -      - 덧셈, 뺄셈
-- 5  : <<, >>    - 비트 이동
-- 6  : &         - 비트 AND
-- 7  : ^         - 비트 XOR
-- 8  : |         - 비트 OR
-- 9  : =, <=>, >=, >, <=, <, !=, <>, IS, LIKE, REGEXP, IN, BETWEEN
--                  - 비교 연산자
-- 10 : NOT       - 논리 NOT (단항)
-- 11 : AND       - 논리 AND
-- 12 : XOR       - 논리 XOR
-- 13 : OR        - 논리 OR


