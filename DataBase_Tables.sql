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

CREATE TABLE `Exercise` (
  `exName` VARCHAR(50) PRIMARY KEY NOT NULL,
  `fitPartName` VARCHAR(20) NOT NULL,
  `exImg` LONGBLOB NOT NULL
);

CREATE TABLE `User` (
  `userId` VARCHAR(20) PRIMARY KEY NOT NULL,
  `pw` VARCHAR(50) NOT NULL,
  `preferExercise` VARCHAR(50),
  `location` VARCHAR(50),
   FOREIGN KEY (`preferExercise`) REFERENCES `Exercise`(`exName`) 
);

CREATE TABLE `Review` (
  `rId` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `youtubeID` VARCHAR(50) NOT NULL,
  `userID` VARCHAR(20) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `regDate` DATETIME DEFAULT NOW(),
  `viewCnt` LONG,
  FOREIGN KEY (`youtubeID`) REFERENCES `Video`(`youtubeId`),
  FOREIGN KEY (`userID`) REFERENCES `User`(`userId`)
);

CREATE TABLE `Grass` (
  `gId` VARCHAR(50) PRIMARY KEY NOT NULL,
  `userId` VARCHAR(20) NOT NULL,
  `index` INT NOT NULL,
  `img` LONGBLOB NOT NULL,
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



