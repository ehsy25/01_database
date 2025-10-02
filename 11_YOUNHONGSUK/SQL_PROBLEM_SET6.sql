-- 문제 72: 가장 간단한 프로시저 만들기
-- 주제: 파라미터 없는 SELECT 프로시저
-- 문제: 조회수가 100만을 넘는 '인기 비디오'의 제목과 조회수를 조회하는 GetPopularVideos라는 이름의 프로시저를 만드세요.

delimiter //

CREATE PROCEDURE GetPopularVideos()
BEGIN
	SELECT title, view_count
	FROM videos
	WHERE view_count > 1000000;
END //

delimiter ;

CALL GetPopularVideos();

-- 문제 73: 입력받아 동작하는 프로시저 만들기
-- 주제: IN 파라미터
-- 문제: 특정 creator_id를 입력받아, 해당 크리에이터가 올린 비디오 목록을 조회하는 GetVideosByCreator라는 프로시저를 만드세요.

delimiter //

CREATE PROCEDURE GetVideosByCreator(
IN id varchar(2)
)
BEGIN
	SELECT title
	FROM videos
	WHERE  creator_id = id;
END //

delimiter ;

CALL GetVideosByCreator(6);

-- 문제 74: 결과를 반환하는 프로시저 만들기
-- 주제: OUT 파라미터
-- 문제: 특정 user_id를 입력받아, 해당 사용자의 username을 결과로 반환하는 GetUsernameById 프로시저를 만드세요.

delimiter //

CREATE PROCEDURE GetUsernameById(
IN id int,
OUT name varchar(10)
)

BEGIN
	SELECT username INTO name
	FROM users
	WHERE  user_id = id;
END //

delimiter ;

SET @name = '';
CALL GetUsernameById(22, @name);
SELECT @name;

-- 문제 75: 조건문으로 분기하는 프로시저 만들기
-- 주제: IF 조건문
-- 문제: 비디오의 video_id를 입력받아, 조회수가 50만 이상이면 '인기 영상', 10만 이상이면 '일반 영상', 그 미만이면 '관심 필요'라는 메시지를 결과로 반환하는 GetVideoRating 프로시저를 만드세요.

delimiter //
CREATE PROCEDURE GetVideoRating(
	IN id int,
	OUT rate varchar(255)
)

BEGIN
	DECLARE views INT;
	SELECT view_count INTO views
	FROM videos
	WHERE video_id = id;

	IF views > 500000 THEN
		SET rate = '인기 영상';
	ELSEIF views > 100000 THEN
		SET rate = '일반 영상';
	ELSE 
		SET rate = '관심 필요';
	END IF;

END //
delimiter ;

SET @name = 'as';
CALL GetVideoRating(10, @name);
SELECT @name;

-- 문제 76: 입력과 출력을 겸하는 프로시저 만들기
-- 주제: INOUT 파라미터
-- 문제: 숫자 하나를 입력받아, 그 숫자에 10을 더한 후 원래 변수에 다시 저장해주는 AddTen 프로시저를 만드세요.

delimiter // 

CREATE PROCEDURE AddTen(
INOUT num int
)

BEGIN 
	Set num = num + 10;
END // 

delimiter ;

SET @tensum = 15;
CALL AddTen(@tensum);
SELECT @tensum;


-- 문제 77: 반복문으로 데이터 처리하기
-- 주제: WHILE 반복문
-- 문제: video_tags 테이블에 특정 video_id의 태그를 여러 개 한번에 추가하는 프로시저 AddTags를 만드세요.
-- 태그는 콤마(,)로 구분된 하나의 문자열(예: 'SQL,DB,MariaDB')로 입력받습니다.
-- 힌트: CHAR_LENGTH(), SUBSTRING_INDEX(), SUBSTRING() 이용해보면 좋지않을까..

delimiter //

CREATE PROCEDURE AddTags(
IN vid INT
, IN tags varchar(255)
)

DECLARE chopped = ' ';
SET chopped = tags;

WHILE char_length (substring_index(chopped, ',' , 1))) > 0;
	SET chopped = substring_index(chopped, ',' , 1);
INSERT INTO video_tags
(vid, chopped);

delimiter ;

-- 문제 78: 프로시저 실행 중 발생하는 에러 처리하기
-- 주제: DECLARE HANDLER (에러 처리)

-- 문제: 새로운 사용자를 users 테이블에 추가하는 AddUser라는 프로시저를 만드세요. 이 프로시저는 username, 
-- email, country를 입력받습니다. 만약 username이나 email이 이미 존재하여 **중복 키 오류(Duplicate Key Error)**가 발생하면, 
-- '이미 존재하는 사용자 이름 또는 이메일입니다.'라는 메시지를 반환하고, 성공적으로 추가되면 '새로운 사용자가 추가되었습니다.'라는 메시지를 반환하도록 만드세요.
-- 참고: 중복키 오류는 Error Code : 1062

delimiter //

CREATE PROCEDURE AddUser (
IN name varchar(255),
IN mail varchar(255),
IN country varchar(255)
)

DECLARE dup Condition FOR '1062';
DECLARE EXIT handler FOR repeats
BEGIN 
	SIGNAL '1062' SET message_text = '이미 존재하는 사용자 이름 또는 이메일입니다.'
END

DECLARE check_mail = (SELECT email FROM users WHERE users.email = mail);

IF mail = email
	SIGNAL dup;
ELSE 
	SET message_text = '새로운 사용자가 추가되었습니다.';
END IF; 

END // 

delimiter ;


