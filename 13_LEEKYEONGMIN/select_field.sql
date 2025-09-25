-- order by절 뒤에 컬럼명 외에 연산 결과, 별칭 등을 사용할 수 있다.
select
	menu_code
	,menu_name
	,menu_price *menu_code
from tbl_menu
order by menu_price * menu_code

select
	menu_code '메뉴코드'
	,menu_name '메뉴명'
	,menu_price * menu_code '연산결과'
from tbl_menu
order  by 연산결과;

-- field 함수 맨 앞에 문자가 몇번째에 위치하는지를 찾음
select field('A','A','B','C'); -- 1
select field('b','A','B','C'); -- 2
select field('c','A','B','C'); -- 3 소문자 가능
select field('D','A','B','C'); -- 0 은 찾는 값이 없는 경우
-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있다.
select
	 menu_name
	,orderable_status
	,field(orderable_status, 'Y', 'N') 판매여부
from tbl_menu
order by 판매여부;

-- null 값의 정렬 방식
select
	  category_code
	, category_name
	, ref_category_code
from tbl_category
order by ref_category_code desc;