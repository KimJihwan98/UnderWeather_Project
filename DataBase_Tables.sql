create database playlistdb;

USE playlistdb;

CREATE TABLE `Video` (
  `youtubeId` VARCHAR(50) PRIMARY KEY NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `channelName` VARCHAR(20) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `genre` VARCHAR(20),
  `weather` VARCHAR(20),
  `viewCnt` LONG
);

CREATE TABLE `User` (
  `userId` VARCHAR(20) PRIMARY KEY NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `name` varchar(40) NOT NULL,
  `location` VARCHAR(50)
);

CREATE TABLE `Review` (
  `rId` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `youtubeId` VARCHAR(50) NOT NULL,
  `userId` VARCHAR(20) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `regDate` DATETIME DEFAULT NOW(),
  `viewCnt` LONG,
  FOREIGN KEY (`youtubeId`) REFERENCES `Video`(`youtubeId`),
  FOREIGN KEY (`userId`) REFERENCES `User`(`userId`)
);


CREATE TABLE `Singer` (
  `sId` VARCHAR(50) PRIMARY KEY NOT NULL,
  `sName` VARCHAR(50) NOT NULL,
  `genre` VARCHAR(50) NOT NULL
);

INSERT INTO Video
VALUES ("gMaB-fG4u4g", "전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "ThankyouBUBU", "https://www.youtube.com/embed/gMaB-fG4u4g", '장르', '날씨', 0)




INSERT INTO User(userId,  password, name, location)
VALUES ("cha", '1234', "아름", "축구", "청량리");

INSERT INTO User(userId,  password,name, location)
VALUES ("ssafy01", '1234',"재현",  "청량리"),
("ssafy02", '1234', "병수", "청량리"),
("ssafy03", '1234', "민정", "청량리");

INSERT INTO Review(title,  youtubeId, userId, content, viewCnt)
VALUES ("최고", 'gMaB-fG4u4g', "ssafy01", "최고입니다", 0),
("힘들어요", 'gMaB-fG4u4g', "ssafy02", "힘든데 효과 최고",  0),
("효과 짱", 'swRNeYw1JkY', "ssafy03", "효과 최고", 0);


select * from Video;
select * from User;
select * from Review;
select * from Singer;
