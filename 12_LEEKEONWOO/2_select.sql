-- 01. select : 특정 테이블에서 원하는 데이터 조회
use menudb;
select 
	   menu_name
 from tbl_menu;

select 
       menu_code
     , menu_name
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
select NOW(); -- 현재 날짜 확인
select CONCAT('홍','','길동');

-- 컬럼에 별칭
select NOW() as 현재시간; -- 실행 가능
select NOW() as 현재 시간; -- 실행 불가능
select NOW() as '현재 시간'; -- 실행 가능
select NOW() as "현재 시간"; -- 실행 가능

select NOW() 현재시간; -- as를 제외 해도 별칭 설정된다.
select NOW() "'현재 시간'"; -- ', " 서로 바뀌어도 실행가
-- select NOW() ""현재시간""; -- 실행 불가
-- full name
select CONCAT('홍','','길동') as fullname;
select CONCAT('홍','','길동') as 'full name';
select CONCAT('홍','','길동') as "full name";
select CONCAT('홍','','길동') fullname;
select CONCAT('홍','','길동') "'fullname'";
select CONCAT('홍','','길동') '"fullname"';