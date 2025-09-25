-- 5. distinct: 중복 컬럼 값 제거 후 조회

-- 메뉴 테이블에 존재한느 카테고리의 종류를 조회
SELECT 
		category_code
	FROM tbl_menu
	ORDER BY category_code;

-- null 값이 존재하는 컬럼에 사용
SELECT 
		DISTINCT ref_category_code
	FROM tbl_category
	ORDER BY 1 DESC; -- ref_category_code 에 있는 순서를 말한다. 
	
-- 다중열에 distinct 사용
SELECT 
		ref_category_code
	,	orderable_status
	FROM tbl_menu;

SELECT 
		DISTINCT category_code
	  , orderable_status
	FROM tbl_menu;
