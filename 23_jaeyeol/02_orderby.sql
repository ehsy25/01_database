-- 2.order by : result set 을정렬

select menu_code as CODE	, menu_name as NAME , menu_price as PRICE
from tbl_menu
order by price DESC , CODE ASC; 
-- 정렬기준상 동일한 값이 있을떄 그 다음 정렬 기준을 세울수 있다


-- order by 절 뒤에 컬럼명 외 연산결과 , 별칭등을 사용할 수 있다.
select menu_code
		, menu_name 
			,menu_price * menu_code 
from tbl_menu
order by menu_price * menu_code


select menu_code '메뉴코드'
			, menu_name '메뉴이름'
			,menu_price * menu_code '연산결과'
from tbl_menu
order by menu_price * menu_code


-- field 함수
select field ('a','a','b','c') ; -- 1 a 의 위치가 어디있나? 1번째
select field ('b','a','b','c') ;   -- 2   b 의 위치가 어디있나? 2번째
select field ('c','a','b','c') ;  -- c 의 위치가 어디있나? 3번째
select field ('d','a','b','c') ; -- 찾는 값이 없는데 (d) 그렇다면 결과는?
-- field 함수를 횔용하면 정렬 데이터 기준을 설정할 수 있다

select menu_name
	, orderable_status
	, field (orderable_status,'y','n') 판매여부
from tbl_menu
order by 판매여부; -- field( orderable_status, 'y','n')	

-- null 값의 정렬방식
select category_code
	, category_name
	, ref_category_code -- 참조하는 친구들 
from tbl_category
order by ref_category_code;