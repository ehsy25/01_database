-- 04. where : 특정 조건에 맞는 레코드만 선택
-- 1. 비교 연산자
-- 값이 일치하는지 확인(=)

select 
	  menu_code
	, menu_name
  from tbl_menu
where orderable_status = 'Y';

select 
	  menu_code
	, menu_name
  from tbl_menu
where orderable_status = 'N';

select 
	  menu_code
	, menu_name
  from tbl_menu
where menu_price=13000;

-- 값이 일치하지 않는지 확인(!=, <>)
select
	  menu_code
	, menu_name
   from tbl_menu 
  -- where orderable_status <> 'Y';
  where orderable_status != 'Y';

-- 대소비교(>,>=,<,<=)
select
	  menu_code
	, menu_name
   from tbl_menu 
 -- where menu_price > 13000;
 -- where menu_price >= 13000;
 -- where menu_price < 13000;
	where menu_price <= 13000;

-- 2. 논리연산자 (AND)
-- a and b : a와 b 모두 만족할 경우 true 반대는 false
select 
	*
	from tbl_menu
where orderable_status =  'Y' and category_code =10;

-- a or b : a 또는 b 하나만 만족해도 true
select 
	*
 from tbl_menu 
 where orderable_status = 'Y'
 or category_code=10;

-- and, or 연산자 중 우선순위가 높은 연산자는? and
select 
	*
	from tbl_menu
	where category_code =4
	or menu_price = 9000
	and menu_code > 10;

select 
	*
	from tbl_menu
	where (category_code =4
	or menu_price = 9000)
	and menu_code > 10;

-- 3. between and 연산자
select *
from tbl_menu 
-- where menu_price>=10000
-- and menu_price<=25000;
where menu_price between 10000 and 25000
order by menu_price;

-- not 연산자와 조합
select *
from tbl_menu 
where menu_price not between 10000 and 25000
order by menu_price;

-- 4. LIKE 연산자
select
	*
  from tbl_menu 
 where menu_name like '%마늘%'; -- 어디가 되었든지 마늘이라는 키워드가 포함되면 선택
 
select
	*
  from tbl_menu 
 where menu_name like '%아케리카노'; -- 해당 키워드로 끝나는 걸 선택
 
 select
	*
  from tbl_menu 
 where menu_name like '흑%'; -- 해당 키워드로 시작하는 걸 선택
 
 select 
 	*
   from tbl_menu
  where menu_name like '_마늘%'; 
  
 -- '_' 나 '%' 와 같으 기호를 실제로 검색하고 싶을 경우
 -- LIKE '%\_%' 또는
 -- LIKE '%!_%' ESCAPE '!' 와 같은 방식으로 ESCAPE 한다.
 
 select
	*
  from tbl_menu 
 where menu_name not like '%마늘%';
 
 -- 메뉴 가격이 5000원 이상이고, 카테고리 코드가 10이며,
 -- 메뉴 이름에 갈치가 들어가는 메뉴의 모든 칼럼 값을 조회하는 쿼리를 작성하시오.
 select
 	*
 from tbl_menu
 where menu_price>=5000 
 and category_code=10 
 and menu_name like '%갈치%';
 
 -- 5. in 연산자
 select
 	*
 from tbl_menu
where category_code=4
	or category_code=5
	or category_code=6
order by category_code;

select
	*
from tbl_menu  
where category_code IN(4,5,6)
order by category_code ;

-- NOT 연산자 조합
select
	*
from tbl_menu  
where category_code not IN(4,5,6)
order by category_code ;

-- 6. is null: null값 비교(비교연산자 사용 불가)
select
	*
from tbl_category 
where ref_category_code is not null;


