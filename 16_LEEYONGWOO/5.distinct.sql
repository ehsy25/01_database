-- 5. distinct

-- 다중열에 distinct 사용
SELECT 
	category_code
	, orderable_status
 FROM  tbl_menu;

SELECT
	DISTINCT category_code
    ,orderable_status
FROM tbl_menu;