-- 01. SELECT : 특정 테이블에서 원하는 데이터 조회

use menudb;
select 
		menu_name
	from tbl_menu;
-- > tbl_menu에서 menu_name열 조회

select 
		menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
  from tbl_menu;
-- > select 뒤에 순서도 유의미
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
select NOW(); -- ex) 상품등록날짜 기입할때 사용
select concat('홍', '', '길동') -- 두 글짜 이상일 때 이어줌

-- 칼럼 별칭
select NOW() as 현재시간;

select now() "'현재 시간'";

select concat('홍', '', '길동') as 'full name';
select '홍길동';