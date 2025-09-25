-- 5. distinct : 중복 칼럼 값 제거 후 조회 

-- 메뉴 테이블에 존재하는 카테고리의 종류를 조회 
SELECT 
	   DISTINCT category_code
  FROM tbl_menu
ORDER BY category_code;

-- null 값이 존재하는 칼럼에 사용 
SELECT 
	   DISTINCT ref_category_code
  FROM tbl_category
ORDER BY ref_category_code;

SELECT 
	   DISTINCT ref_category_code
  FROM tbl_category
ORDER BY 1; -- 1은 SELECT 절의 첫 번째 칼럼을 지목하는 것 

-- 다중 열에 DISTINCT 사용 
SELECT 
	   DISTINCT category_code
	 , orderable_status
 FROM  tbl_menu;