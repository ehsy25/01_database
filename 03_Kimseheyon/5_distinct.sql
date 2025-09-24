-- 05. distinct : 중복 칼럼 값 제거 후 조회

-- 메뉴 테이블에 존재하는 카테고리의 종류 조
SELECT 
      DISTINCT category_code
  FROM tbl_menu
 ORDER BY category_code;

-- null값 존재하는 칼럼에 사용
SELECT
       ref_category_code
  FROM tbl_category;

SELECT
       DISTINCT ref_category_code
  FROM tbl_category;

SELECT
       DISTINCT ref_category_code
  FROM tbl_category
  ORDER BY 1;

-- 다중열 distinct 사용
-- 다중열의 값들이 모두 동일하면 중복된 것으로 판별
SELECT 
       category_code
     , orderable_status
  FROM tbl_menu;

SELECT 
       DISTINCT category_code
     , orderable_status
     -- distinct는 맨 앞에 와야 함 (syntax error)
     --   category_code
     -- , DISTINCT orderable_status
  FROM tbl_menu;
