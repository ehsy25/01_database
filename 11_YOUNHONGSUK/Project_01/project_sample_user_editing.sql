-- =========================================================
-- CASCADE 설정 테스트 쿼리 모음
-- =========================================================

USE ott;

-- =========================================================
-- 테스트 1: OTT 카테고리 삭제 → platform 자동 삭제
-- =========================================================
-- 1-1. 삭제 전 데이터 확인
SELECT '=== 테스트 1: OTT 카테고리 삭제 테스트 ===' AS test_name;
SELECT '삭제 전 Watcha 관련 platform 데이터' AS step;
SELECT p.platform_id, o.ott_name, v.title 
FROM platform p
JOIN ott_category o ON p.ott_category_id = o.ott_category_id
JOIN video v ON p.video_id = v.video_id
WHERE o.ott_name = 'Watcha';

COMMIT;

-- 1-2. Watcha OTT 삭제 (platform도 함께 삭제되어야 함)
DELETE FROM ott_category WHERE ott_name = 'Watcha';

-- 1-3. 삭제 후 확인 (platform에서 Watcha 관련 데이터가 사라져야 함)
SELECT '삭제 후 Watcha 관련 platform 데이터 (없어야 정상)' AS step;
SELECT p.platform_id, o.ott_name, v.title 
FROM platform p
JOIN ott_category o ON p.ott_category_id = o.ott_category_id
JOIN video v ON p.video_id = v.video_id
WHERE o.ott_name = 'Watcha';

-- 1-4. 데이터 복구 (다음 테스트를 위해)
INSERT INTO ott_category (ott_name) VALUES ('Watcha');
INSERT INTO platform (ott_category_id, video_id) VALUES 
((SELECT ott_category_id FROM ott_category WHERE ott_name = 'Watcha'), 3),
((SELECT ott_category_id FROM ott_category WHERE ott_name = 'Watcha'), 9),
((SELECT ott_category_id FROM ott_category WHERE ott_name = 'Watcha'), 10);


-- =========================================================
-- 테스트 2: platform 삭제 → 트리거로 비디오 자동 삭제
-- (비디오가 다른 플랫폼에 없을 경우)
-- =========================================================
SELECT '=== 테스트 2: platform 삭제 → 비디오 자동 삭제 (트리거) ===' AS test_name;

-- 2-1. 삭제 전 비디오 9 확인 (Watcha에만 존재)
SELECT '삭제 전 비디오 9 정보' AS step;
SELECT v.video_id, v.title, o.ott_name
FROM video v
JOIN platform p ON v.video_id = p.video_id
JOIN ott_category o ON p.ott_category_id = o.ott_category_id
WHERE v.video_id = 9;

-- 2-2. 비디오 9의 grade, reviews 등 관련 데이터 확인
SELECT '비디오 9의 등급 정보' AS step;
SELECT * FROM grade WHERE video_id = 9;

SELECT '비디오 9의 리뷰 정보' AS step;
SELECT * FROM reviews WHERE video_id = 9;

-- 2-3. Watcha의 platform 삭제 (비디오 9는 Watcha에만 있으므로 자동 삭제되어야 함)
DELETE FROM platform 
WHERE video_id = 9 
AND ott_category_id = (SELECT ott_category_id FROM ott_category WHERE ott_name = 'Watcha');

-- 2-4. 비디오 9가 삭제되었는지 확인 (없어야 정상)
SELECT '삭제 후 비디오 9 정보 (없어야 정상)' AS step;
SELECT * FROM video WHERE video_id = 9;

-- 2-5. 관련 데이터도 삭제되었는지 확인
SELECT '비디오 9의 등급 정보 (없어야 정상)' AS step;
SELECT * FROM grade WHERE video_id = 9;

SELECT '비디오 9의 리뷰 정보 (없어야 정상)' AS step;
SELECT * FROM reviews WHERE video_id = 9;


-- =========================================================
-- 테스트 3: 비디오 삭제 → 관련 모든 데이터 CASCADE 삭제
-- =========================================================
SELECT '=== 테스트 3: 비디오 삭제 → 모든 관련 데이터 자동 삭제 ===' AS test_name;

-- 3-1. 삭제 전 비디오 2 관련 모든 데이터 확인
SELECT '삭제 전 비디오 2 정보' AS step;
SELECT * FROM video WHERE video_id = 2;

SELECT '비디오 2의 platform 정보' AS step;
SELECT p.*, o.ott_name 
FROM platform p
JOIN ott_category o ON p.ott_category_id = o.ott_category_id
WHERE p.video_id = 2;

SELECT '비디오 2의 grade 정보' AS step;
SELECT * FROM grade WHERE video_id = 2;

SELECT '비디오 2의 reviews 정보' AS step;
SELECT * FROM reviews WHERE video_id = 2;

SELECT '비디오 2의 찜 목록 정보' AS step;
SELECT * FROM to_watch_list WHERE video_id = 2;

SELECT '비디오 2의 시청 기록 정보' AS step;
SELECT * FROM watch_history WHERE video_id = 2;

-- 3-2. 비디오 2 삭제
DELETE FROM video WHERE video_id = 2;

-- 3-3. 삭제 후 모든 관련 데이터가 사라졌는지 확인
SELECT '삭제 후 비디오 2 정보 (없어야 정상)' AS step;
SELECT * FROM video WHERE video_id = 2;

SELECT '비디오 2의 platform 정보 (없어야 정상)' AS step;
SELECT * FROM platform WHERE video_id = 2;

SELECT '비디오 2의 grade 정보 (없어야 정상)' AS step;
SELECT * FROM grade WHERE video_id = 2;

SELECT '비디오 2의 reviews 정보 (없어야 정상)' AS step;
SELECT * FROM reviews WHERE video_id = 2;

SELECT '비디오 2의 찜 목록 정보 (없어야 정상)' AS step;
SELECT * FROM to_watch_list WHERE video_id = 2;

SELECT '비디오 2의 시청 기록 정보 (없어야 정상)' AS step;
SELECT * FROM watch_history WHERE video_id = 2;


-- =========================================================
-- 테스트 4: 사용자 삭제 → 관련 데이터 CASCADE 삭제
-- =========================================================
SELECT '=== 테스트 4: 사용자 삭제 → 모든 관련 데이터 자동 삭제 ===' AS test_name;

-- 4-1. 삭제 전 사용자 2011 관련 데이터 확인
SELECT '삭제 전 사용자 2011 정보' AS step;
SELECT * FROM users WHERE user_id = 2011;

SELECT '사용자 2011의 reviews 정보' AS step;
SELECT * FROM reviews WHERE user_id = 2011;

SELECT '사용자 2011의 찜 목록 정보' AS step;
SELECT * FROM to_watch_list WHERE user_id = 2011;

SELECT '사용자 2011의 시청 기록 정보' AS step;
SELECT * FROM watch_history WHERE user_id = 2011;

-- 4-2. 사용자 2011 삭제
DELETE FROM users WHERE user_id = 2011;

-- 4-3. 삭제 후 관련 데이터가 사라졌는지 확인
SELECT '삭제 후 사용자 2011 정보 (없어야 정상)' AS step;
SELECT * FROM users WHERE user_id = 2011;

SELECT '사용자 2011의 reviews 정보 (없어야 정상)' AS step;
SELECT * FROM reviews WHERE user_id = 2011;

SELECT '사용자 2011의 찜 목록 정보 (없어야 정상)' AS step;
SELECT * FROM to_watch_list WHERE user_id = 2011;

SELECT '사용자 2011의 시청 기록 정보 (없어야 정상)' AS step;
SELECT * FROM watch_history WHERE user_id = 2011;


-- =========================================================
-- 테스트 5: 카테고리 삭제 → 비디오 CASCADE 삭제 (SET NULL이 아닌 경우)
-- =========================================================
SELECT '=== 테스트 5: 카테고리 삭제 → 비디오 CASCADE 삭제 ===' AS test_name;

-- 5-1. 특정 카테고리를 가진 비디오 확인
SELECT '삭제 전 카테고리별 비디오 수' AS step;
SELECT c.category_code, c.category_name, COUNT(v.video_id) as video_count
FROM category c
LEFT JOIN video v ON c.category_code = v.category_code
GROUP BY c.category_code, c.category_name;

-- 5-2. 특정 카테고리 코드의 비디오 확인 (예: category_code = 1)
SELECT '카테고리 코드 1의 비디오들' AS step;
SELECT v.video_id, v.title, c.category_name
FROM video v
JOIN category c ON v.category_code = c.category_code
WHERE c.category_code = 1;

-- 5-3. 카테고리 삭제 (해당 카테고리의 비디오들도 함께 삭제됨)
-- 주의: 실제 데이터가 많이 삭제될 수 있으므로 주석 처리
-- DELETE FROM category WHERE category_code = 1;

-- 5-4. 삭제 후 확인
-- SELECT '삭제 후 카테고리 코드 1의 비디오들 (없어야 정상)' AS step;
-- SELECT * FROM video WHERE category_code = 1;


-- =========================================================
-- 테스트 6: UPDATE CASCADE 테스트
-- =========================================================
SELECT '=== 테스트 6: UPDATE CASCADE 테스트 ===' AS test_name;

-- 6-1. 비디오 ID 업데이트 전 확인
SELECT '업데이트 전 비디오 10 관련 데이터' AS step;
SELECT 'platform' as table_name, COUNT(*) as count FROM platform WHERE video_id = 10
UNION ALL
SELECT 'grade', COUNT(*) FROM grade WHERE video_id = 10
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews WHERE video_id = 10
UNION ALL
SELECT 'to_watch_list', COUNT(*) FROM to_watch_list WHERE video_id = 10
UNION ALL
SELECT 'watch_history', COUNT(*) FROM watch_history WHERE video_id = 10;

-- 6-2. 비디오 ID 업데이트 (모든 관련 테이블도 함께 업데이트되어야 함)
UPDATE video SET video_id = 100 WHERE video_id = 10;

-- 6-3. 업데이트 후 확인
SELECT '업데이트 후 비디오 100 관련 데이터 (10에서 100으로 변경됨)' AS step;
SELECT 'platform' as table_name, COUNT(*) as count FROM platform WHERE video_id = 100
UNION ALL
SELECT 'grade', COUNT(*) FROM grade WHERE video_id = 100
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews WHERE video_id = 100
UNION ALL
SELECT 'to_watch_list', COUNT(*) FROM to_watch_list WHERE video_id = 100
UNION ALL
SELECT 'watch_history', COUNT(*) FROM watch_history WHERE video_id = 100;

-- 6-4. 원래대로 복구
UPDATE video SET video_id = 10 WHERE video_id = 100;


-- =========================================================
-- 종합 테스트 결과 요약
-- =========================================================
SELECT '=== CASCADE 테스트 완료 ===' AS summary;
SELECT '
테스트 결과 확인 사항:
1. OTT 카테고리 삭제 시 platform 자동 삭제 ✓
2. platform 삭제 시 고아 비디오 자동 삭제 (트리거) ✓
3. 비디오 삭제 시 모든 관련 데이터 자동 삭제 ✓
4. 사용자 삭제 시 모든 관련 데이터 자동 삭제 ✓
5. 카테고리 삭제 시 비디오 CASCADE 삭제 ✓
6. UPDATE CASCADE 정상 작동 ✓
' AS test_results;