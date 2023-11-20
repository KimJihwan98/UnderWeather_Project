create database wellnessdb;

USE wellnessdb;

CREATE TABLE `Video` (
  `youtubeId` VARCHAR(50) PRIMARY KEY NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `fitPartName` VARCHAR(20) NOT NULL,
  `channelName` VARCHAR(20) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `viewCnt` LONG
);

CREATE TABLE Sport (
  spName VARCHAR(50) PRIMARY KEY NOT NULL,
  spImg LONGBLOB
);

CREATE TABLE `User` (
  `userId` VARCHAR(20) PRIMARY KEY NOT NULL,
  `pw` VARCHAR(50) NOT NULL,
  `preferSport` VARCHAR(50),
  `location` VARCHAR(50),
   FOREIGN KEY (`preferSport`) REFERENCES `Sport`(`spName`) 
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

CREATE TABLE `Grass` (
  `gId` VARCHAR(50) PRIMARY KEY NOT NULL,
  `userId` VARCHAR(20) NOT NULL,
  `index` INT NOT NULL,
  `img` LONGBLOB,
  `title` VARCHAR(50) NOT NULL,
  `content` LONGTEXT,
  FOREIGN KEY (`userId`) REFERENCES `User`(`userId`)
);

CREATE TABLE `Product` (
  `pId` VARCHAR(50) PRIMARY KEY NOT NULL,
  `youtubeId` VARCHAR(50) NOT NULL,
  `price` LONG NOT NULL,
  `pUrl` VARCHAR(100) NOT NULL,
  FOREIGN KEY (`youtubeId`) REFERENCES `VIdeo`(`youtubeId`)
);

INSERT INTO Video
VALUES ("gMaB-fG4u4g", "전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "전신", "ThankyouBUBU", "https://www.youtube.com/embed/gMaB-fG4u4g", 0),
("swRNeYw1JkY", "하루 15분! 전신 칼로리 불태우는 다이어트 운동", "전신", "ThankyouBUBU", "https://www.youtube.com/embed/swRNeYw1JkY", 0),
("54tTYO-vU2E", "상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]", "상체", "ThankyouBUBU", "https://www.youtube.com/embed/54tTYO-vU2E", 0),
("QqqZH3j_vH0", "상체비만 다이어트 최고의 운동 [상체 핵매운맛]", "상체", "ThankyouBUBU", "https://www.youtube.com/embed/QqqZH3j_vH0", 0),
("tzN6ypk6Sps", "하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]", "하체", "김강민", "https://www.youtube.com/embed/tzN6ypk6Sps", 0),
("u5OgcZdNbMo","저는 하체 식주의자 입니다", "하체","GYM종국", "https://www.youtube.com/embed/u5OgcZdNbMo", 0),
("PjGcOP-TQPE", "11자복근 복부 최고의 운동 [복근 핵매운맛]", "복부", "ThankyouBUBU", "https://www.youtube.com/embed/PjGcOP-TQPE", 0),
("7TLk7pscICk", "(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)", "복부", "SomiFit", "https://www.youtube.com/embed/7TLk7pscICk", 0);

INSERT INTO Sport(spName, spImg)
VALUES ("축구", NULL);

INSERT INTO User(userId,  pw, preferSport, location)
VALUES ("cha", '1234', "축구", "청량리");

INSERT INTO User(userId,  pw, preferSport, location)
VALUES ("ssafy01", '1234', "축구", "청량리"),
("ssafy02", '1234', "축구", "청량리"),
("ssafy03", '1234', "축구", "청량리");

INSERT INTO Review(title,  youtubeId, userId, content, viewCnt)
VALUES ("최고", 'gMaB-fG4u4g', "ssafy01", "최고입니다", 0),
("힘들어요", 'gMaB-fG4u4g', "ssafy02", "힘든데 효과 최고",  0),
("효과 짱", 'swRNeYw1JkY', "ssafy03", "효과 최고", 0);


select * from Video;
select * from User;
select * from Sport;
select * from Review;
select * from Product;
select * from Grass;