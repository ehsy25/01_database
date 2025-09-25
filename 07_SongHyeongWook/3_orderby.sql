-- 2. order by : result set을 정렬
select 
	   menu_code
	 , menu_name
	 , menu_price 
  from tbl_menu 
-- order by menu_price asc; -- Ascending 오름차순
--  order by menu_price; -- asc는 생략 가능. (default)
  order by menu_price desc; -- Descening 내림차순
  
-- 정렬 기준 상 동일한 값이 있을 때
-- 그 다음 정렬 기준을 세울 수 있다.
  select 
	   menu_code
	 , menu_name
	 , menu_price 
  from tbl_menu 
  order by menu_price desc, menu_code; -- Descening 내림차순
  
  -- 별칭
   select 
	   menu_code as 코드
	 , menu_name
	 , menu_price as 가격
  from tbl_menu 
  order by 가격 desc, 코드;
  
  -- order by절 뒤에 컬럼명 외에 연산 결과, 별칭 등을 사용할 수 있다.
  	select
  		   menu_code
  		 , menu_name
  		 , menu_price * menu_code
  	  from tbl_menu
  	 order by menu_price * menu_code;
  
   	select
  		   menu_code '메뉴코드'
  		 , menu_name '메뉴명'
  		 , menu_price * menu_code '연산결과'
  	  from tbl_menu
  	 order by 연산결과;
  
 	-- field 함수
   	select field('A', 'A', 'B', 'C'); -- 1
 	select field('B', 'A', 'B', 'C'); -- 2
 	select field('C', 'A', 'B', 'C'); -- 3
 	select field('D', 'A', 'B', 'C'); -- 0
 	
 	-- field 함수를 활용하면 정렬 데이터 기준을 설정할 수 있다.
 	select
 		   menu_name
 		 , orderable_status
 		 , FIELD(orderable_status, 'Y', 'N') 판매여부
 	  from tbl_menu
 	 order by 판매여부; -- FIELD(orderable_status, 'Y', 'N');
 	
 	-- null 값의 정렬 방식
 	select
 		   category_code
 		 , category_name
 		 , ref_category_code
 	  from tbl_category tc
 	 -- order by ref_category_code;
 	 -- order by ref_category_code desc;
     order by -ref_category_code; -- '-'를 붙이면 desc
 	
 	
 	
 	
 	
 	
 	