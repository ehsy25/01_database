-- 01. select : 특정 테이블에서 원하는 데이터 조회
-- use menudb;
-- 
-- SELECT 
--        menu_name
--   FROM tbl_menu;
-- 
-- select 
-- 		menu_code
-- 	,	menu_name
-- 	, 	menu_price 
-- 	,	category_code 
-- 	,	orderable_status 
-- 	from tbl_menu;
-- 
-- -- '*' : 모든
-- 
-- select 
-- 		*
-- 	from tbl_menu;

select 3 + 7;
select 7 * 3;
select 7 % 3;
select 7 / 3; 

-- 내장함수 확인
select now();
select CONCAT('홍', '길', '동');

-- 컬럼 별칭
select now() as 현재시간;

select NOW() as '현재 시간';
select NOW() as "현재 시간";
select NOW() 현재시간;
select NOW() '"현재 시간"';
select NOW() "'현재 시간'";
-- select NOW() ''현재 시간''; 안 된다. 
-- full name
select concat('진', '희', '헌') as 'Full Name';




 