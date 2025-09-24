-- 01. select : 특정 테이블에서 원하는 데이터 조회
USE menudb;

SELECT
	   menu_name
  FROM tbl_menu;

SELECT
	   menu_code
	 , menu_name
	 , menu_price
	 , category_code
	 , orderable_status
  FROM tbl_menu;
	   
-- '*' : 모든
SELECT
	   *
  FROM tbl_menu;

-- 단독으로 select 문 사용
SELECT 7 + 3;
SELECT 7 * 3;
SELECT 7 % 3;
SELECT 7 / 3;

-- 내장함수 확인
SELECT NOW();
SELECT CONCAT('홍', '', '길동');

-- 컬럼 별칭
SELECT NOW() AS 현재시간;
-- select NOW() as 현재 시간; >> 현재 시간 처럼 사용하면 안된다.
SELECT NOW() AS '현재 시간';
SELECT NOW() AS "현재 시간";

SELECT NOW() 현재시간;
SELECT NOW() '현재 시간';
SELECT NOW() "'현재 시간'";
SELECT NOW() '"현재 시간"';
-- select NOW() ''현재 시간''; >> 이렇게는 오류
-- full name
SELECT CONCAT('홍', '', '길동');
SELECT CONCAT('홍', '', '길동') AS 'full name';
SELECT CONCAT('홍', '', '길동') AS "full name";
SELECT CONCAT('홍', '', '길동') 'full name';
SELECT CONCAT('홍', '', '길동') "full name";