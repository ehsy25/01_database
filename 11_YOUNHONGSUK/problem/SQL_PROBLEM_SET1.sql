-- 문제 1: 모든 데이터 조회하기
-- 주제: SELECT, FROM

-- 문제: users 테이블에 있는 모든 사용자의 모든 정보를 조회하세요.

select
	*
	from users;

-- 문제 2: 특정 조건의 데이터 선택하기
-- 주제: SELECT (특정 컬럼), WHERE

-- 문제: '게임' 카테고리에 해당하는 모든 비디오의 제목과 조회수를 조회하세요.

select 
title 
, view_count 
from videos
Where category = '게임';

-- 문제 3: 숫자 비교 조건 사용하기
-- 주제: WHERE (숫자 비교)

-- 문제: 조회수(view_count)가 1,000,000 (백만) 회를 초과하는 모든 비디오의 creator_id, title, view_count를 조회하세요.

select
  creator_id 
, title
, v.view_count 
from videos v 
where v.view_count > 1000000;

-- 문제 4: 결과 정렬하기
-- 주제: ORDER BY

-- 문제: users 테이블의 모든 사용자를 가입일(registration_date)이 최신인 순서대로 정렬하여 모든 정보를 조회하세요.

select 
*
from users
order by registration_date desc;


-- 문제 5: 여러 조건 동시에 만족시키기
-- 주제: WHERE (복수 조건 AND)

-- 문제: 'IT/테크' 카테고리의 비디오 중에서 조회수가 500,000 이상인 비디오의 제목, 카테고리, 조회수를 조회하세요.


select 
title 
, category 
,view_count 
from videos
where view_count >= 500000
and category = 'It/테크';

-- 문제 6: 상위 N개 결과만 보기
-- 주제: ORDER BY, LIMIT

-- 문제: 전체 비디오 중에서 조회수가 가장 높은 상위 5개의 비디오 제목과 조회수를 조회하세요.

select 
title 
,view_count 
from videos
ORDER BY view_count DESC 
LIMIT 5;

-- 문제 7: 중복 없이 결과 보기
-- 주제: DISTINCT

-- 문제: videos 테이블에 존재하는 모든 비디오 카테고리의 종류를 중복 없이 조회하세요.

select 
distinct category 
from videos;

-- 문제 8: 특정 패턴의 문자열 검색하기
-- 주제: WHERE (패턴 검색 LIKE)

-- 문제: 비디오 제목에 '리뷰'라는 단어가 포함된 모든 비디오의 제목을 조회하세요.

select 
title 
from videos
where title like '%리뷰%';


-- 문제 9: 여러 값 중 하나와 일치하는 데이터 검색
-- 주제: WHERE (리스트 검색 IN)

-- 문제: creators 테이블에서 creator_id가 1, 3, 5, 7인 크리에이터의 채널명과 creator_id를 조회하세요.

select 
c.channel_name 
,c.creator_id 
from creators c 
where c.creator_id in (1,3,5,7);


-- 문제 10: 특정 범위의 데이터 검색하기
-- 주제: WHERE (범위 검색 BETWEEN)

-- 문제: 조회수가 500,000 이상 1,000,000 이하인 비디오의 제목과 조회수를 조회하세요.

select 
title
,view_count 
from videos
where view_count between 500000 and 1000000;

-- 문제 11: NULL이 아닌 데이터만 확인하기
-- 주제: WHERE (NULL 값 확인)

-- 문제: 채널 설명(channel_description)이 비어있지 않은(NULL이 아닌) 크리에이터의 채널명을 조회하세요.

select 
channel_name 
from creators c 
where c.channel_description IS NOT NULL ;

-- 문제 12: 복잡한 논리 조건 조합하기
-- 주제: WHERE (논리 연산자 AND, OR 조합)

-- 문제: 'IT/테크' 카테고리이거나 '교육' 카테고리이면서, 동시에 재생 시간이 1시간(3600초) 이상인 비디오의 **제목, 카테고리, 재생 시간(초)**을 조회하세요.

select 
title 
, category 
,duration_seconds 
from videos
WHERE duration_seconds >= 3600
AND (category = 'IT/테크'
OR category = '교육');


-- 문제 13: 여러 기준으로 정렬하기
-- 주제: ORDER BY (다중 컬럼 정렬)

-- 문제: 모든 비디오를 카테고리(오름차순) 순으로 먼저 정렬하고, 같은 카테고리 내에서는 조회수(내림차순)가 높은 순으로 정렬하여 비디오의 카테고리, 제목, 조회수를 조회하세요.

select 
category
, title
, view_count
from videos
ORDER BY category, view_count desc;

-- 문제 14: 특정 패턴을 제외한 데이터 검색
-- 주제: WHERE (NOT LIKE)

-- 문제: 크리에이터의 채널 설명(channel_description)에 '튜토리얼'이라는 단어가 포함되지 않은 채널의 이름을 조회하세요.

select 
channel_name 
FROM creators
WHERE channel_description NOT LIKE '%튜토리얼%';

-- 문제 15: 특정 범위를 벗어나는 데이터 검색
-- 주제: WHERE (NOT BETWEEN)

-- 문제: 재생 시간(duration_seconds)이 10분(600초)에서 30분(1800초) 사이가 아닌 비디오의 제목과 재생 시간을 조회하세요.

select 
title
, duration_seconds 
from videos
WHERE duration_seconds NOT BETWEEN 600 AND 1800
ORDER BY duration_seconds ;

-- 문제 16: 더 복잡한 논리 조건 조합하기
-- 주제: WHERE (복합 논리 조건 (), AND, OR)

-- 문제: '여행' 카테고리 비디오 중 조회수가 500,000 이상인 경우 또는 '음악' 카테고리 비디오 중 재생 시간이 5분(300초) 이하인 경우를 모두 조회하세요. (결과에는 제목, 카테고리, 조회수, 재생 시간을 포함하세요.)

select 
title
, category
, view_count 
, duration_seconds 
from videos
WHERE (category LIKE '%여행'
AND view_count > 500000)
OR (category LIKE '%음악%'
AND duration_seconds < 300);

-- 문제 17: 결과 구간 선택하기 (페이지네이션)
-- 주제: LIMIT with OFFSET

-- 문제: 모든 사용자를 user_id 순으로 정렬했을 때, 11번째부터 20번째까지(10건)의 사용자 이름과 이메일을 조회하세요.

select 
username 
,email 
from users
ORDER BY user_id
LIMIT 10,10;

-- 문제 18: 특정 목록을 제외한 데이터 검색
-- 주제: WHERE (부정 리스트 검색 NOT IN)

-- 문제: 'IT/테크', '게임', '교육' 카테고리를 제외한 나머지 카테고리의 비디오 제목과 카테고리를 조회하세요.

select 
title
,category
from videos
WHERE category NOT LIKE '%IT/테크%'
AND category NOT LIKE '%게임%'
AND category NOT LIKE '%교육%';

-- 문제 19: 특정 위치의 글자 수로 검색하기
-- 주제: WHERE (LIKE와 단일 문자 와일드카드 _)

-- 문제: users 테이블에서 사용자 이름(username)이 '겜'으로 시작하고 총 세 글자인 사용자를 조회하세요.

SELECT 
username 
FROM users
WHERE username LIKE '%겜__';

-- 문제 20: 기본기 종합 복습
-- 주제: WHERE, ORDER BY, LIMIT 종합

-- 문제: 국적이 '대한민국' 또는 '미국'인 사용자 중, 사용자 이름(username)의 가나다순으로 정렬하여 상위 5명만 user_id, username, country를 조회하세요.

SELECT 
user_id 
,username 
,country 
FROM users
WHERE country LIKE '%대한민국%'
OR country LIKE '%미국%'
ORDER BY username
LIMIT 5;

-- 문제 21: 정확한 글자 수로 패턴 검색하기
-- 주제: WHERE (LIKE와 단일 문자 와일드카드 _)

-- 문제: users 테이블에서 사용자 이름(username)이 '테스트사용자' 
-- 다음에 정확히 한 글자가 더 붙는 사용자(예: 테스트사용자1, 테스트사용자2)를 모두 조회하세요.

SELECT 
	 username
FROM users
WHERE username LIKE '%테스트사용자_';

-- 문제 22: 여러 값을 동시에 제외하기
-- 주제: WHERE (부정 리스트 검색 NOT IN)
-- 
-- 문제: 국적이 '대한민국', '미국', '일본'이 아닌 사용자의 사용자명과 국적을 조회하세요.

SELECT 
	 username 
	 , country 
FROM users
WHERE country != '대한민국'
AND country != '미국'
AND country != '일본';

-- 문제 23: 값이 없는(NULL) 데이터 검색하기
-- 주제: WHERE (NULL 값 검색 IS NULL)
-- 
-- 문제: creators 테이블에서 채널 설명(channel_description)이 등록되지 않은 (값이 NULL인) 크리에이터가 있는지 찾아보세요.

SELECT channel_name 
FROM creators
WHERE channel_description IS NULL;

-- 문제24: 여러 종류의 조건문 종합하기
-- 주제: WHERE (종합 논리 조건)
-- 
-- 문제: users 테이블에서, 국적이 '영국'이거나 '프랑스'이면서, 동시에 사용자 이름에 '사용자'라는 단어가 포함되지 않는 사용자를 조회하세요.
SELECT 
username 
FROM users
WHERE (country = '영국'
OR country = '프랑스')
AND username NOT LIKE '%사용자%';