USE menudb;

-- 01. select: 특정 테이블에서 원하는 데이터 조회할 때 사용 
SELECT 
	   menu_name
  FROM tbl_menu;

SELECT 
	    menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
  FROM  tbl_menu;

-- '*' : 모든

SELECT
	   *
  FROM tbl_menu;

-- 단독으로 select문 사용
SELECT 7 + 3;
SELECT 7 - 3;
SELECT 7 % 3;
SELECT 7 / 3;

-- 내장 함수 확인
SELECT NOW();
SELECT CONCAT('홍', '', '길동');

-- 칼럼 별칭
SELECT NOW() as 현재시간;
-- SELECT NOW() as 현재 시간; -> 이건 안 됨 
SELECT NOW() as '현재 시간';
SELECT NOW() 현재시간;
SELECT NOW() '현재 시간';
-- SELECT NEW() ''현재시간''; -> 이건 안 됨 

-- full name
SELECT CONCAT('홍', '', '길동');
SELECT CONCAT('홍', '', '길동') as 'full name';
SELECT CONCAT('홍', '', '길동') as "full name";
SELECT CONCAT('홍', '', '길동') 'full name';
SELECT CONCAT('홍', '', '길동') '"full name"';
SELECT CONCAT('홍', '', '길동') "full name";
SELECT CONCAT('홍', '', '길동') "'full name'";