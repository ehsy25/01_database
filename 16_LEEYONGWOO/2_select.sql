-- 01. select: 특정 테이블에서 원하는 데이터 조회
select
	  menu_name
	, menu_code
	, menu_price
	, category_code
	, orderable_status 
  from tbl_menu;

-- '*':모든

-- 내장함수 확인
-- full name
select CONCAT('홍',' ','길동') 홍;
select CONCAT("홍"," ","길동") 킬;
select GROUP_CONCAT("홍길",' ',"동") 동;

