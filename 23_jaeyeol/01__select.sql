-- 01. select : 특정테이블에서 원하는 데이터를 조회할 때 사용
use menudb;
select menu_name
from tbl_menu ;


select menu_code,
		menu_name
		, menu_price
		, category_code
		, orderable_status
from tbl_menu ;

select * 
from tbl_menu;

-- 내장함수 확인
select now (); -- 시간을 나타내주는 함수 나중에 쿼리문에 now 쓰면 등록한 시간이 등록됨
select concat('홍','','길동' ); -- 문자열 끼리 붙이는 함수
-- 컬럼 별칭을 짓는법 
select now() as  현재시간 ;
select now() as '현재 시간'; -- 따옴표 쓰면 공백 입력가능 
select now() 현재시간;
select now() "'현재 시간'";
select now() '"현재 시간"';

select concat ('홍','길동') 바보 ;