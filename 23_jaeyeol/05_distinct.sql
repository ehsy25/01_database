-- 5. distinct : 중복컬럼 값 제거 후 조회
-- 메뉴 테이블에 존재하는 카테고리의 종류를 조회
SELECT 
	DISTINCT category_code
	FROM tbl_menu
	ORDER BY category_code; 

-- null 값이 존재하는 컬럼에 사용
SELECT 
	DISTINCT ref_category_code 
FROM tbl_category 
ORDER BY 1 DESC ; 

-- 다중열에 distinct 사용한 경우 카데코리 코드가같아도 오더블의 값이 다르면출력 됨
-- SELECT ALL 	category_code , orderable_status
-- FROM tbl_menu
-- distinct 는 무조건 맨 앞에 와야한다
SELECT DISTINCT category_code , orderable_status
FROM tbl_menu

