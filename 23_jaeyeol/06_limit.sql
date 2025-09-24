--  06. limit  select 문의 결과 집합에서 반환할 행의 갯수 제한
SELECT menu_code 
	, menu_name
	, menu_price
FROM tbl_menu
ORDER BY menu_price
LIMIT 1,4 ; -- 2번 행부터 5번 행까지 조회

-- limit 양식 LIMIT [offset,] row_count;
-- offset 은 생략이 가능하여 row_count 만 입력하면 top-n 행 반환
SELECT menu_code 
	, menu_name
	, menu_price
FROM tbl_menu
ORDER BY menu_price
LIMIT 5; -- 상위 다섯줄의 행만 조회 (order by)