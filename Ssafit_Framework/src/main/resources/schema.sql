create database ssafitdb;

USE ssafitdb;

CREATE TABLE Video(
	youtubeId VARCHAR(50) PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL,
    fitPartName VARCHAR(20) NOT NULL,
    channelName VARCHAR(20) NOT NULL,
    url VARCHAR(100) NOT NULL,
    viewCnt LONG NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Review(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    title VARCHAR(40) NOT NULL,
    writer  VARCHAR(20) NOT NULL,
    content LONGTEXT NOT NULL,
    regDate DATETIME NOT NULL,
	youtubeId VARCHAR(50) NOT NULL,
    viewCnt LONG,
    FOREIGN KEY (youtubeId) REFERENCES Video (youtubeId)
) ENGINE = InnoDB;

CREATE TABLE User(
	id VARCHAR(40) NOT NULL PRIMARY KEY,
    password VARCHAR(40) NOT NULL,
    name VARCHAR(40) NOT NULL
) ENGINE = InnoDB;


INSERT INTO Video
VALUES ("gMaB-fG4u4g", "전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "전신", "ThankyouBUBU", "https://www.youtube.com/embed/gMaB-fG4u4g", 2),
("swRNeYw1JkY", "하루 15분! 전신 칼로리 불태우는 다이어트 운동", "전신", "ThankyouBUBU", "https://www.youtube.com/embed/swRNeYw1JkY", 5),
("54tTYO-vU2E", "상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]", "상체", "ThankyouBUBU", "https://www.youtube.com/embed/54tTYO-vU2E", 7),
("QqqZH3j_vH0", "상체비만 다이어트 최고의 운동 [상체 핵매운맛]", "상체", "ThankyouBUBU", "https://www.youtube.com/embed/QqqZH3j_vH0", 10),
("tzN6ypk6Sps", "하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]", "하체", "김강민", "https://www.youtube.com/embed/tzN6ypk6Sps", 0),
("u5OgcZdNbMo","저는 하체 식주의자 입니다", "하체","GYM종국", "https://www.youtube.com/embed/u5OgcZdNbMo", 15),
("PjGcOP-TQPE", "11자복근 복부 최고의 운동 [복근 핵매운맛]", "복부", "ThankyouBUBU", "https://www.youtube.com/embed/PjGcOP-TQPE", 13),
("7TLk7pscICk", "(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)", "복부", "SomiFit", "https://www.youtube.com/embed/7TLk7pscICk", 20);

INSERT INTO Review(title,  writer, content, regDate, youtubeId, viewCnt)
VALUES ("최고", "ssafy01", "최고입니다", "2023-10-27", 'gMaB-fG4u4g', 0),
("힘들어요", "ssafy02", "힘든데 효과 최고", "2023-10-27", 'gMaB-fG4u4g', 0),
("효과 짱", "ssafy03", "효과 최고", "2023-10-27", 'swRNeYw1JkY', 0);

insert into user
values ("cha", "chacha", "chachacha"),
("choi", "choichoi", "choichoichoi");

select * from video;
select * from review;
select * from user;

