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
	ORDER BY 1 DESC;

-- 다중 열에 DISTINCT 사용
SELECT
		category_code
	  , orderable_status
	 FROM  tbl_menu;

SELECT
		DISTINCT category_code
	  , orderable_status
	 FROM  tbl_menu;
-- distinct는 앞에 와야함, 앞 예제에서 orderable_status앞에
-- distinct 넣으면 syntax error 발생







