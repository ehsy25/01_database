-- 01. select : 특정 테이블에서 원하는 데이터를 조회
use menudb;

select
       menu_name
  from tbl_menu;

select
	   menu_name
	 , menu_code
	 , menu_price
	 , category_code 
	 , orderable_status
  from tbl_menu;

-- '*' : 모든
select 
	   * 
  from tbl_menu;

-- 단독으로 select 문 사용
select 7 + 3;
select 7 * 3;
select 7 % 3;
select 7 / 3;

-- 내장함수 확인
select now();
select concat("홍","길","동");
select concat("홍","길","동", now());

-- 컬럼 별칭
select now() as 현재시간;
select now() as '현재 시간';
select now() as "현재 시간";
select now() 현재시간;
select now() '현재 시간';
select now() "현재 시간";
select now() "'현재 시간'";
select now() '"현재 시간"';
-- select now() as 현재 시간; >> 오류 (띄어쓰기 X)
-- select now() ''현재 시간''; >> 인식 불가
-- full name
select concat("홍","길동") as 'full name';
select concat("홍", "길동") as "full name";
select concat("홍", "길동") 'full name';
select concat("홍", "길동") "full name";