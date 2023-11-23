create database playlistdb;

USE playlistdb;

CREATE TABLE `Video` (
  `idx` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `youtubeId` VARCHAR(50) UNIQUE NOT NULL,
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
  `genre` VARCHAR(50) NOT NULL,
  `youtubeId` VARCHAR(50) NOT NULL,
  FOREIGN KEY (`youtubeId`) REFERENCES `Video`(`youtubeId`)
);

INSERT INTO Video (youtubeId, title, channelName, url, genre, weather, viewCnt)
VALUES ("DpcJP-wQWGI", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 따사로운 봄을 기다리며 spring pop 🌱🌼", "때껄룩TAKE A LOOK", "https://youtu.be/DpcJP-wQWGI", 'pop', '', 0),
("nE7md7M6j8w", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 이 노래 10000번은 넘게 들은 듯.. 믿고 들어도 되는 주인장 최애 팝송🤍", "mycozypop", "https://youtu.be/nE7md7M6j8w", 'pop', '', 0),
("FT4vQyGp8eo", "추워질 때 들으려고 아껴둔 가을 팝송 대방출 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭 🍂", "송디 DJSOHEE", "https://youtu.be/FT4vQyGp8eo", 'pop', '', 0),
("FtK_N-r05q4", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 2022년을 돌아보며 인기팝송 총모음ㅣBest Popular Songs Of 2022˚₊‧", "때껄룩TAKE A LOOK", "https://youtu.be/FtK_N-r05q4", 'pop', '', 0),
("hAGTFX9ipdI", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 이보다 좋은 팝송 히트곡은 없다 2020~2023년을 빛낸 팝송들💫 [60곡]", "mycozypop", "https://youtu.be/hAGTFX9ipdI", 'pop', '', 0),
("cqf0Ni3Jo_I", "[Playlist] 가을 노을빛으로 물들어가는 밤 | 감성 팝과 함께 하는 재충전의 시간 with 해비치 | relaxing pop music", "essential;", "https://youtu.be/cqf0Ni3Jo_I", 'pop', '', 0),


("T31rLZSJdF8", "[KPOP Playlist] 요즘 듣는 케이팝 노동요 ➅", "김로라", "https://youtu.be/T31rLZSJdF8", 'kPop', '', 0),
("NPqGJWqB6ws", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 내가 요즘 듣는 케이팝 최신곡 플리 🎧", "구구 Playlist", "https://youtu.be/NPqGJWqB6ws", 'kPop', '', 0),
("mtBDyfCu6oM", "[KPOP Playlist] 일단 즐겨! 신나는 케이팝 노동요", "김로라", "https://youtu.be/mtBDyfCu6oM", 'kpop', '', 0),
("HkTcZdWgOuo", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 장기자랑 휩쓸었던 그시절 케이팝", "구구 Playlist", "https://youtu.be/HkTcZdWgOuo", 'kPop', '', 0),
("60acaiXb1FQ", "𝐏𝐥𝐚𝐲𝐥𝐈𝐬𝐭 2013년에 나온 여돌 노래 모음", "구구 Playlist", "https://youtu.be/60acaiXb1FQ", 'kPop', '', 0),
("czOH-7CirK0", "【𝙋𝙡𝙖𝙮𝙡𝙞𝙨𝙩】 들으면 가슴 벅차오르는 케이팝 플레이리스트", "정확히조엘 exactly joel", "https://youtu.be/czOH-7CirK0", 'kPop', '', 0),

("3ZJkHS-qhWU", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 발라드의 계절, 노래방에서 자주 부르는 유명한 이별 발라드 모음", "때껄룩TAKE A LOOK", "https://youtu.be/3ZJkHS-qhWU", 'ballad', '', 0),
("W8k_qFWLhJ4", "【𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭】 잘 지내자, 우리", "쥬크박스", "https://youtu.be/W8k_qFWLhJ4", 'ballad', '', 0),
("v6JwvQyqpXE", "Playlist 📀 연애를 발라드로 배웠습니다,,🙄🙂😉 | 주인장이 엄선한 발라드 명곡 노래모음 플레이리스트 광고없", "남자사람친구", "https://youtu.be/v6JwvQyqpXE", 'ballad', '', 0),
("Je_scwtmbwQ", "[𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 드라이브할 때 틀어놓기 좋은 감성 발라드 200분 모음 | 아침부터 새벽까지 데일리로 듣기", "우야 Lounge", "https://youtu.be/Je_scwtmbwQ", 'ballad', '', 0),
("4qh8D_aPX5A", "[Playlist] 새벽만 되면 감성이 폭발해 버리는 당신을 위해 준비한 새벽감성 노래 모음 #1 | 잔잔한 노래 모음", "조거북", "https://youtu.be/4qh8D_aPX5A", 'ballad', '', 0),
("YuvEewomXcY", "침대에 누워 껴안고 잠드는 짙은 색감의 감성 발라드 모음ㅣPLAYLIST", "레몬쓰", "https://youtu.be/YuvEewomXcY", 'ballad', '', 0),

("zaCPA12tskI", "[𝗣𝗹𝗮𝘆𝗹𝗶𝘀𝘁] 몽글몽글 감성 힙합에 R&B 한 스푼🥄 미노이, 릴러말즈 ,오반등등... | 𝒉𝒊𝒑-𝒉𝒐𝒑, 𝑹&𝑩, 𝑺𝒊𝒏𝒈𝒊𝒏𝒈 𝒓𝒂𝒑", "디디플리", "https://youtu.be/zaCPA12tskI", 'hipHop', '', 0),
("lE04gKofFME", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 트렌디한 힙합 레이블 AOMG 노래모음ㅣ 로꼬, 쿠기, 그레이, 쌈디, 우원재, 박재범", "때껄룩TAKE A LOOK", "https://youtu.be/lE04gKofFME", 'hipHop', '', 0),
("GZKj-PRPc2c", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 돌아가고 싶은 그때 그 시절 2010년 감성힙합 I 다이나믹듀오, 프라이머리, 긱스, 개리, 빈지노", "때껄룩TAKE A LOOK", "https://youtu.be/GZKj-PRPc2c", 'hipHop', '', 0),
("NBB0b5lZSPo", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 외힙에 환장하는 클럽 죽돌이의 극락가는 플리🔥| 힙합클럽에 무조건 나오는 유명한 외힙", "때껄룩TAKE A LOOK", "https://youtu.be/NBB0b5lZSPo", 'hipHop', '', 0),
("9Ug3qTi7Vr4", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 요새 외힙 들을거 없나?🥵 내 방구석이 힙합클럽으로 변해 아래층에선 소리 더 키워달라고 할 트렌디한 외힙 hip hop playlist 2023", "때껄룩TAKE A LOOK", "https://youtu.be/9Ug3qTi7Vr4", 'hipHop', '', 0),
("LC4X5bf1K_8", "'도입부 부터 지려버리는 미친 외힙' playlist", "sun", "https://youtu.be/LC4X5bf1K_8", 'hipHop', '', 0),

("WGwP4-zYH5M", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 미술관에서 들려오는 고급진 조성진의 클래식", "때껄룩TAKE A LOOK", "https://youtu.be/WGwP4-zYH5M", 'classic', '', 0),
("rub7vg6YG7k", "포근한 이불 속, 우리가 사랑한 클래식 Top 50 | 익숙하고 잔잔한 클래식 플레이리스트", "hello, sunset", "https://youtu.be/rub7vg6YG7k", 'classic', '', 0),
("_xTOxSSqgzA", "클래식 플레이리스트 | 20년차 클덕이 담은 인생 추천곡 | classical music playlist", "SOHYUNISM 소혀니즘", "https://youtu.be/_xTOxSSqgzA", 'classic', '', 0),
("YmZLR7311O4", "홀로 마감하는 박물관 직원, 클래식 음악 [dark academia Playlist]", "by the wawy", "https://youtu.be/YmZLR7311O4", 'classic', '', 0),
("n77IIyaKy9k", "조성진의 고요한 우아함 𝐂𝐥𝐚𝐬𝐬𝐢𝐜 𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭", "장밀크milk", "https://youtu.be/n77IIyaKy9k", 'classic', '', 0),
("Muz2GkNXciM", "늦은 새벽, 혼자 공부할 때 듣는 따뜻한 피아노 | 클래식 플레이리스트", "hello, sunset", "https://youtu.be/Muz2GkNXciM", 'classic', '', 0),

("ZKwW9c2pSnI", "[𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 애미야 노래가 싱겁다😤 | 락할미 취향 매운맛 7080 락/메탈🤘🔥", "온에잇 On 8ight", "https://youtu.be/ZKwW9c2pSnI", 'rock', '', 0),
("pAh2Fi08pR8", "[𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 스니커즈 신고 나와 | 시원한 바람을 가르며 듣는 청명한 락🎸", "온에잇 On 8ight", "https://youtu.be/pAh2Fi08pR8", 'rock', '', 0),
("WM5v6OI8Bx4", "[𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 오늘밤 롹스타는 나야나🤘| 그 시절 우리가 동경한 롹스타 노래모음", "온에잇 On 8ight", "https://youtu.be/WM5v6OI8Bx4", 'rock', '', 0),
("b_1W8oiqOP8", "촌스러웠던 그 여름을 잊지마 ⛱ (playlist)", "온에잇 On 8ight", "https://youtu.be/b_1W8oiqOP8", 'rock', '', 0),
("qTZ4ULXfLTk", "밀려오는 파도 소리, 살랑이는 야자수, 그리고 트로피컬 밴드 사운드 ‘CHS’ (playlist)", "온에잇 On 8ight", "https://youtu.be/qTZ4ULXfLTk", 'rock', '', 0),
("5-sOx9vunMQ", "초여름의 향수를 자극하는 80년대 락 (playlist)", "온에잇 On 8ight", "https://youtu.be/5-sOx9vunMQ", 'rock', '', 0),

("EdUh3P3ssoo", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 화창한 날에 듣기 좋은 싱그러운 팝송들로 모아봤습니다", "사계 FOUR SEASONS", "https://youtu.be/EdUh3P3ssoo", '', 'sunny', 0),
("zAFYo-qteug", "🌻 바람도 적당, 햇빛도 적당한 날에 듣기 좋은 싱그러운 팝송 모음 | PLAYLIST", "찐막 JJINMAK", "https://youtu.be/zAFYo-qteug", '', 'sunny', 0),
("k1V4ho7w_Ww", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 날씨가 좋아서 무작정 나와버렸어", "때껄룩TAKE A LOOK", "https://youtu.be/k1V4ho7w_Ww", '', 'sunny', 0),
("jNrQyn3rQWU", "𝙿𝚕𝚊𝚢𝚕𝚒𝚜𝚝 : 화창한 날, 산책하면서 듣기 좋은 노래 모음", "도도리스", "https://youtu.be/jNrQyn3rQWU", '', 'sunny', 0),
("MHIG4IFk0to", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 ☀️화창한 주말 아침 집돌이,집순이를 위한 기분 좋은 팝송", "TurningPoint Music", "https://youtu.be/MHIG4IFk0to", '', 'sunny', 0),
("pDTJPg5gOxU", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 그냥, 날씨가 너무 좋아서 무작정 나와버렸어", "때껄룩TAKE A LOOK", "https://youtu.be/pDTJPg5gOxU", '', 'sunny', 0),

("rG0c_ZILHKg", "[playlist] 비 오는 날의 수채화", "네고막을책임져도될까", "https://youtu.be/rG0c_ZILHKg", '', 'rainy', 0),
("2Uycc9jxfjc", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 추적추적 비 내리는 날의 감성 팝 ˚₊‧ 𝐋𝐚𝐮𝐯, 𝐂𝐨𝐧𝐚𝐧 𝐆𝐫𝐚𝐲, 𝐓𝐚𝐲𝐥𝐨𝐫 𝐒𝐰𝐢𝐟𝐭, 𝐁𝐢𝐥𝐥𝐢𝐞 𝐄𝐢𝐥𝐢𝐬𝐡 ☔️", "기몽초", "https://youtu.be/2Uycc9jxfjc", '', 'rainy', 0),
("c_l1ZwJbAnc", "[𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 비도 오고, 오늘은 그냥 늘어져서 음악이나 듣자 #인디플리 (데이먼스이어, 검정치마, 백아, 오왠, 너드커넥션, 카더가든)", "올리의뷰티대학 - 피부 탐구 채널", "https://youtu.be/c_l1ZwJbAnc", '', 'rainy', 0),
("A-51aNViFxk", "[Playlist] 카페 알바생이 비 올 때 매장에 틀려고 만든 플리 ☔🌧💦 I 에픽하이, 윤하, 헤이즈, 태연, 이무진, 폴킴, 아이유, 잔나비 외", "희SUNNY", "https://youtu.be/A-51aNViFxk", '', 'rainy', 0),
("RN31XpLyR_8", "[playlist] 비와 낭만", "네고막을책임져도될까", "https://youtu.be/RN31XpLyR_8", '', 'rainy', 0),
("4FRRTSuhIBk", "[𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 비 올 때 틀어 놓기 좋은 감성힙합 모음🎵🎶 I 에픽하이, 헤이즈, 다이나믹듀오, 페노메코 + ..", "힙재 HIPJAE 🎵", "https://youtu.be/4FRRTSuhIBk", '', 'rainy', 0),

("vLldpdlsfGU", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 설레는 겨울의 분위기를 담은 따뜻하고 포근한 겨울 노래 모음 winter vibes ‧₊˚.", "때껄룩TAKE A LOOK", "https://youtu.be/vLldpdlsfGU", '', 'snowy', 0),
("GjjhrDwM95Q", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 어느덧 겨울이 오고 있는걸", "때껄룩TAKE A LOOK", "https://youtu.be/GjjhrDwM95Q", '', 'snowy', 0),
("oefUljptkYw", "[PLAYLIST] 첫 소절 듣자마자 'ㅇㅋ 통과'가 절로 나온 겨울송들", "딸기 - Strawberries", "https://youtu.be/oefUljptkYw", '', 'snowy', 0),
("a_80o2lDYec", "[Playlist] 슬슬 연말 분위기를 내볼까요? | 퍼펙트 크리스마스 캐롤 플레이리스트🎄🎅🎁 | Best Christmas Pop Songs Of All Time", "essential;", "https://youtu.be/a_80o2lDYec", '', 'snowy', 0),
("MjyslpML32w", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 다가오는 크리스마스를 기다리며 l 캐롤 BEST 인기곡 총모음 𝑴𝒆𝒓𝒓𝒚 𝑪𝒉𝒓𝒊𝒔𝒕𝒎𝒂𝒔‧₊˚.⋆", "때껄룩TAKE A LOOK", "https://youtu.be/MjyslpML32w", '', 'snowy', 0),
("YAsAQgoh52I", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭🎄 크리스마스가 다가온다. 그것도 아주 행복할❤ 𝐂𝐡𝐫𝐢𝐬𝐭𝐦𝐚𝐬 𝑪𝒂𝒓𝒐𝒍 🎅 / 캐롤 플레이리스트", "mycozypop", "https://youtu.be/YAsAQgoh52I", '', 'snowy', 0),
("evL6xzMataM", "☃️ 눈 내리는 도쿄의 겨울 | J-POP PLAYLIST", "찐막 JJINMAK", "https://youtu.be/evL6xzMataM", '', 'snowy', 0),
("XLbuK4Urt90", "[𝐏𝐋𝐀𝐘𝐋𝐈𝐒𝐓] :첫 눈 , 추워질 때 들으려고 아껴둔 겨울 팝송 대방출", "하얀 눈", "https://youtu.be/XLbuK4Urt90", '', 'snowy', 0),


("z1UGaVSgcAM", "잔뜩 흐린 마음을 굳이 달랠 이유는 없었다. / 새벽 팝송 playlist", "offweb", "https://youtu.be/z1UGaVSgcAM", '', 'cloudy', 0),
("VNtKdI14eeM", "[Playlist] 회색빛으로 물든 마음 | 흐린 날, 감성을 촉촉하게 적시는 연주곡 | classical music for rainy days", "essential;", "https://youtu.be/VNtKdI14eeM", '', 'cloudy', 0),
("75kySTFaBQQ", "[playlist] 딱 요즘 듣는 잔잔한 인디들 | 카더가든, 잔나비, 검정치마, 혁오, 짙은, 데이먼스이어", "오퓨쳐Five future", "https://youtu.be/75kySTFaBQQ", '', 'cloudy', 0),
("-xSoWCnKVW8", "[Playlist] 카페 알바생이 날씨 흐린 날 매장에 틀려고 만든 플리 ☁🌃🌬 I 백예린, 검정치마, 우효, 김예림, 수란, 크래커, Nov, BIBI, 등", "희SUNNY", "https://youtu.be/-xSoWCnKVW8", '', 'cloudy', 0),
("bmyeHpAcsXY", "[Playlist] 여름비에 흘려보내고 싶은 것들ㅣfor a rainy summer day 🌧️🌂", "essential;", "https://youtu.be/bmyeHpAcsXY", '', 'cloudy', 0),
("g3tLkP8tLI4", "[Playlist] Cloudy", "필모티브 「 fillmotif 」", "https://youtu.be/g3tLkP8tLI4", '', 'cloudy', 0);



INSERT INTO User(userId,  password, name, location)
VALUES ("kim", '1234', "지환", "잠실"),
("cha", '1234', "다운", "회기"),
("ssafy01", '1234',"재현",  "청량리"),
("ssafy02", '1234', "병수", "낙성대"),
("ssafy04", '1234', "승연", "개포동"),
("ssafy03", '1234', "민정", "청량리");


INSERT INTO Review(title,  youtubeId, userId, content, viewCnt)
VALUES ("최고", 'DpcJP-wQWGI', "kim", "왕자님이 인정한 최고의 플레이리스트 !", 0),
("너무 좋아요ㅜㅜ", 'DpcJP-wQWGI', "ssafy02", "너무 좋아서 맨날 들어요ㅜ", 0),
("최애 플리", 'DpcJP-wQWGI', "ssafy03", "제 최애 플리랍니다아~!",  0);

select * from Video;
select * from User;
select * from Review;
select * from Singer;
select * from Video where weather="snowy"; 