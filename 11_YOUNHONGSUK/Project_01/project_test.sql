CREATE DATABASE project2;


CREATE TABLE `users` (
    `user_id` BIGINT NOT NULL AUTO_INCREMENT, -- PK defined here
    `user_name` VARCHAR(100) NOT NULL,
    `user_email` VARCHAR(100) NOT NULL,
    `user_pwd` VARCHAR(100) NOT NULL,
    `user_nickname` VARCHAR(100) NOT NULL,
    `user_birth` INT NOT NULL,
    `is_admin` BOOLEAN NULL,
    PRIMARY KEY (`user_id`)
);
CREATE TABLE `video` (
    `video_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '비디오가 생성될때 생기는 아이디', -- PK defined here
    `title` VARCHAR(100) NOT NULL DEFAULT ' ',
    `link` INT NOT NULL,
    `thumbnail` TEXT NULL,
    `director` VARCHAR(100) NULL, -- Fixed 'varcahr' to 'VARCHAR'
    `actor` VARCHAR(100) NULL,
    `in_ott` INT NULL,
    `view_count` INT NULL,
    `category_code` INT NOT NULL,
    PRIMARY KEY (`video_id`)
    -- FK for category_code and in_ott (if it is a FK) are added later
);
CREATE TABLE `grade` (
    `grade` VARCHAR(3) NOT NULL, -- This looks like it should be part of a composite key or a lookup table. Assuming PK is grade for now, but usually grade and video_id are a composite PK.
    `video_id` BIGINT NOT NULL COMMENT '비디오가 생성될때 생기는 아이디',
    PRIMARY KEY (`grade`),
    FOREIGN KEY (`video_id`) REFERENCES `video`(`video_id`) -- Added FK
);
CREATE TABLE `category` (
    `category_code` INT NOT NULL, -- PK defined here
    `category_name` VARCHAR(100) NOT NULL,
    `video_id` BIGINT NOT NULL COMMENT '비디오가 생성될때 생기는 아이디',
    `ref_category_code` INT NOT NULL,
    PRIMARY KEY (`category_code`),
    FOREIGN KEY (`video_id`) REFERENCES `video`(`video_id`), -- Added FK
    FOREIGN KEY (`ref_category_code`) REFERENCES `category`(`category_code`) -- For hierarchical categories
);
CREATE TABLE `to_watch_list` (
    `to_watch_code` INT NOT NULL AUTO_INCREMENT, -- Added AUTO_INCREMENT for PK
    `create_dt` DATETIME NOT NULL,
    `user_id` BIGINT NOT NULL,
    `video_id` BIGINT NOT NULL COMMENT '비디오가 생성될때 생기는 아이디',
    PRIMARY KEY (`to_watch_code`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`video_id`) REFERENCES `video`(`video_id`)
);
CREATE TABLE `ott_category` (
    `ott_category_id` INT NOT NULL AUTO_INCREMENT, -- Assuming INT PK is Auto-increment
    `ott_name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`ott_category_id`)
);
CREATE TABLE `platform` (
    `platform_id` INT NOT NULL AUTO_INCREMENT, -- PK defined here
    `ott_category_id` INT NOT NULL,
    `video_id` BIGINT NOT NULL COMMENT '비디오가 생성될때 생기는 아이디',
    PRIMARY KEY (`platform_id`),
    FOREIGN KEY (`ott_category_id`) REFERENCES `ott_category`(`ott_category_id`),
    FOREIGN KEY (`video_id`) REFERENCES `video`(`video_id`)
);
CREATE TABLE `reviews` (
    `review_no` INT NOT NULL AUTO_INCREMENT, -- PK defined here
    `writer` VARCHAR(100) NULL,
    `article` TEXT NULL,
    `rating` INT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `video_id` BIGINT NOT NULL COMMENT '비디오가 생성될때 생기는 아이디',
    PRIMARY KEY (`review_no`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`video_id`) REFERENCES `video`(`video_id`)
);
CREATE TABLE `watch_history` (
    `history_id` INT NOT NULL AUTO_INCREMENT, -- Assuming INT PK is Auto-increment
    `create_dt` DATETIME NOT NULL,
    `video_id` BIGINT NOT NULL COMMENT '비디오가 생성될때 생기는 아이디',
    `user_id` BIGINT NOT NULL,
    PRIMARY KEY (`history_id`),
    FOREIGN KEY (`video_id`) REFERENCES `video`(`video_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);