-- 01.select : 특정 테이블에서 원하는 데이터 조회
use menudb;
select 
		menu_name
  from  tbl_menu;

SELECT 
		menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
from tbl_menu;

-- '*' : 모
SELECT 	
		* from tbl_menu;
		
-- 단독으로 select문 사용
SELECT 7+3;
SELECT  7*3;
SELECT 7%3;
SELECT 7/3;


-- 내장함수 확인
-- 현재 날짜와 시
SELECT NOW();
-- 문자열 연
SELECT CONCAT('홍','','길동');
-- 컬럼 별칭
SELECT NOW() AS 현재시간;
-- 띄어쓰기를 할 시에 따옴표 필
SELECT NOW() AS '현재 시간';
SELECT NOW() 현재시간;
SELECt NOW() "'현재시간'";
-- select NOW() ''현재시간''; 는 오류
SELECT CONCAT('홍','','길동') as 홍길동;
