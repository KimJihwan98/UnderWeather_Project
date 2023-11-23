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
  `genre` VARCHAR(50) NOT NULL,
  `youtubeId` VARCHAR(50) NOT NULL,
  FOREIGN KEY (`youtubeId`) REFERENCES `Video`(`youtubeId`)
);

INSERT INTO Video

VALUES ("xkdLZABmt7Hpp7Lj", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 따사로운 봄을 기다리며 spring pop 🌱🌼", "때껄룩TAKE A LOOK", "https://youtu.be/DpcJP-wQWGI?si=xkdLZABmt7Hpp7Lj", 'pop', '', 0),
("YvAjEojtUj1Qzqol", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 이 노래 10000번은 넘게 들은 듯.. 믿고 들어도 되는 주인장 최애 팝송🤍", "mycozypop", "https://youtu.be/nE7md7M6j8w?si=YvAjEojtUj1Qzqol", 'pop', '', 0),
("800gMULqiZeRdUQD", "추워질 때 들으려고 아껴둔 가을 팝송 대방출 𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭 🍂", "송디 DJSOHEE", "https://youtu.be/FT4vQyGp8eo?si=ㅊㅊ", 'pop', '', 0),
("q_6pmIeTp0yB0Tuh", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 2022년을 돌아보며 인기팝송 총모음ㅣBest Popular Songs Of 2022˚₊‧", "때껄룩TAKE A LOOK", "https://youtu.be/FtK_N-r05q4?si=q_6pmIeTp0yB0Tuh", 'pop', '', 0),
("J8-ZetnWwjuZ1JdQ", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 이보다 좋은 팝송 히트곡은 없다 2020~2023년을 빛낸 팝송들💫 [60곡]", "mycozypop", "https://youtu.be/hAGTFX9ipdI?si=J8-ZetnWwjuZ1JdQ", 'pop', '', 0),
("L6UILVUtL5SpjKua", "[Playlist] 가을 노을빛으로 물들어가는 밤 | 감성 팝과 함께 하는 재충전의 시간 with 해비치 | relaxing pop music", "essential;", "https://youtu.be/cqf0Ni3Jo_I?si=L6UILVUtL5SpjKua", 'pop', '', 0),


("bGqZoPztUYfFfEk8", "[KPOP Playlist] 요즘 듣는 케이팝 노동요 ➅", "김로라", "https://youtu.be/T31rLZSJdF8?si=bGqZoPztUYfFfEk8", 'kPop', '', 0),
("zDUPRS6u1_uxlSS5", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 내가 요즘 듣는 케이팝 최신곡 플리 🎧", "구구 Playlist", "https://youtu.be/NPqGJWqB6ws?si=zDUPRS6u1_uxlSS5", 'kPop', '', 0),
("eMzmhsjSCtzqxN0T", "[KPOP Playlist] 일단 즐겨! 신나는 케이팝 노동요", "김로라", "https://youtu.be/mtBDyfCu6oM?si=eMzmhsjSCtzqxN0T", 'kpop', '', 0),
("kODOUAe1tK-hfTJs", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 장기자랑 휩쓸었던 그시절 케이팝", "구구 Playlist", "https://youtu.be/HkTcZdWgOuo?si=kODOUAe1tK-hfTJs", 'kPop', '', 0),
("WOsgm-B4k3KSdQGh", "𝐏𝐥𝐚𝐲𝐥𝐈𝐬𝐭 2013년에 나온 여돌 노래 모음", "구구 Playlist", "https://youtu.be/60acaiXb1FQ?si=WOsgm-B4k3KSdQGh", 'kPop', '', 0),
("9u0dw3ScywFsgFRm", "【𝙋𝙡𝙖𝙮𝙡𝙞𝙨𝙩】 들으면 가슴 벅차오르는 케이팝 플레이리스트", "정확히조엘 exactly joel", "https://youtu.be/czOH-7CirK0?si=9u0dw3ScywFsgFRm", 'kPop', '', 0),

("Yz0bljWXTsB6xP3M", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 발라드의 계절, 노래방에서 자주 부르는 유명한 이별 발라드 모음", "때껄룩TAKE A LOOK", "https://youtu.be/3ZJkHS-qhWU?si=Yz0bljWXTsB6xP3M", 'ballad', '', 0),
("BgvlzID8xbsS0t2e", "【𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭】 잘 지내자, 우리", "쥬크박스", "https://youtu.be/W8k_qFWLhJ4?si=BgvlzID8xbsS0t2e", 'ballad', '', 0),
("jWW4ksbYuE7YXSgd", "Playlist 📀 연애를 발라드로 배웠습니다,,🙄🙂😉 | 주인장이 엄선한 발라드 명곡 노래모음 플레이리스트 광고없", "남자사람친구", "https://youtu.be/v6JwvQyqpXE?si=jWW4ksbYuE7YXSgd", 'ballad', '', 0),
("xzHcD92-Mc7rFUjP", "[𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 드라이브할 때 틀어놓기 좋은 감성 발라드 200분 모음 | 아침부터 새벽까지 데일리로 듣기", "우야 Lounge", "https://youtu.be/Je_scwtmbwQ?si=xzHcD92-Mc7rFUjP", 'ballad', '', 0),
("-hHZdpiakDNZVCZ0", "[Playlist] 새벽만 되면 감성이 폭발해 버리는 당신을 위해 준비한 새벽감성 노래 모음 #1 | 잔잔한 노래 모음", "조거북", "https://youtu.be/4qh8D_aPX5A?si=-hHZdpiakDNZVCZ0", 'ballad', '', 0),
("JsISNnEjbAhlEjLl", "침대에 누워 껴안고 잠드는 짙은 색감의 감성 발라드 모음ㅣPLAYLIST", "레몬쓰", "https://youtu.be/YuvEewomXcY?si=JsISNnEjbAhlEjLl", 'ballad', '', 0),

("iymoXwoQzBgCn_2Y", "[𝗣𝗹𝗮𝘆𝗹𝗶𝘀𝘁] 몽글몽글 감성 힙합에 R&B 한 스푼🥄 미노이, 릴러말즈 ,오반등등... | 𝒉𝒊𝒑-𝒉𝒐𝒑, 𝑹&𝑩, 𝑺𝒊𝒏𝒈𝒊𝒏𝒈 𝒓𝒂𝒑", "디디플리", "https://youtu.be/zaCPA12tskI?si=iymoXwoQzBgCn_2Y", 'hipHop', '', 0),
("sQFCWUnd6TgU2L49", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 트렌디한 힙합 레이블 AOMG 노래모음ㅣ 로꼬, 쿠기, 그레이, 쌈디, 우원재, 박재범", "때껄룩TAKE A LOOK", "https://youtu.be/lE04gKofFME?si=sQFCWUnd6TgU2L49", 'ballad', '', 0),
("xLw5RBhGhr9j5Z9T", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 돌아가고 싶은 그때 그 시절 2010년 감성힙합 I 다이나믹듀오, 프라이머리, 긱스, 개리, 빈지노", "때껄룩TAKE A LOOK", "https://youtu.be/GZKj-PRPc2c?si=xLw5RBhGhr9j5Z9T", 'hipHop', '', 0),
("NOCyQ8KUF2fkRika", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 외힙에 환장하는 클럽 죽돌이의 극락가는 플리🔥| 힙합클럽에 무조건 나오는 유명한 외힙", "때껄룩TAKE A LOOK", "https://youtu.be/NBB0b5lZSPo?si=NOCyQ8KUF2fkRika", 'hipHop', '', 0),
("NC5W5q1fsj7zl7N_", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 요새 외힙 들을거 없나?🥵 내 방구석이 힙합클럽으로 변해 아래층에선 소리 더 키워달라고 할 트렌디한 외힙 hip hop playlist 2023", "때껄룩TAKE A LOOK", "https://youtu.be/9Ug3qTi7Vr4?si=NC5W5q1fsj7zl7N_", 'hipHop', '', 0),
("JXKi8NDzWUkVUCyE", "'도입부 부터 지려버리는 미친 외힙' playlist", "sun", "https://youtu.be/LC4X5bf1K_8?si=JXKi8NDzWUkVUCyE", 'hipHop', '', 0),

("36LOlk91He8C95lc", "[𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 애미야 노래가 싱겁다😤 | 락할미 취향 매운맛 7080 락/메탈🤘🔥", "온에잇 On 8ight", "https://youtu.be/ZKwW9c2pSnI?si=36LOlk91He8C95lc", 'rock', '', 0),
("bQGd3HR5uq6-g2d4", "[𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 스니커즈 신고 나와 | 시원한 바람을 가르며 듣는 청명한 락🎸", "온에잇 On 8ight", "https://youtu.be/pAh2Fi08pR8?si=bQGd3HR5uq6-g2d4", 'rock', '', 0),
("gkrSuk2uuUo8DnNc", "[𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 오늘밤 롹스타는 나야나🤘| 그 시절 우리가 동경한 롹스타 노래모음", "온에잇 On 8ight", "https://youtu.be/WM5v6OI8Bx4?si=gkrSuk2uuUo8DnNc", 'rock', '', 0),
("MS-KDFhIiDQwG2q7", "촌스러웠던 그 여름을 잊지마 ⛱ (playlist)", "온에잇 On 8ight", "https://youtu.be/b_1W8oiqOP8?si=MS-KDFhIiDQwG2q7", 'rock', '', 0),
("IgGKFzFeFXzl5imd", "밀려오는 파도 소리, 살랑이는 야자수, 그리고 트로피컬 밴드 사운드 ‘CHS’ (playlist)", "온에잇 On 8ight", "https://youtu.be/qTZ4ULXfLTk?si=IgGKFzFeFXzl5imd", 'rock', '', 0),
("hVHYJsJbIQzu9xSJ", "초여름의 향수를 자극하는 80년대 락 (playlist)", "온에잇 On 8ight", "https://youtu.be/5-sOx9vunMQ?si=hVHYJsJbIQzu9xSJ", 'rock', '', 0),

("tuhDoivBpYtITmyk", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 화창한 날에 듣기 좋은 싱그러운 팝송들로 모아봤습니다", "사계 FOUR SEASONS", "https://youtu.be/EdUh3P3ssoo?si=tuhDoivBpYtITmyk", '', 'sunny', 0),
("sNqeCDFn28qaZ56w", "🌻 바람도 적당, 햇빛도 적당한 날에 듣기 좋은 싱그러운 팝송 모음 | PLAYLIST", "찐막 JJINMAK", "https://youtu.be/zAFYo-qteug?si=sNqeCDFn28qaZ56w", '', 'sunny', 0),
("8VWZFsw4e66z8HVA", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 날씨가 좋아서 무작정 나와버렸어", "때껄룩TAKE A LOOK", "https://youtu.be/k1V4ho7w_Ww?si=8VWZFsw4e66z8HVA", '', 'sunny', 0),
("zCb6ev1xev3MQcFG", "𝙿𝚕𝚊𝚢𝚕𝚒𝚜𝚝 : 화창한 날, 산책하면서 듣기 좋은 노래 모음", "도도리스", "https://youtu.be/jNrQyn3rQWU?si=zCb6ev1xev3MQcFG", '', 'sunny', 0),
("3AB3X0rRCL_Dgjaa", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 ☀️화창한 주말 아침 집돌이,집순이를 위한 기분 좋은 팝송", "TurningPoint Music", "https://youtu.be/MHIG4IFk0to?si=3AB3X0rRCL_Dgjaa", '', 'sunny', 0),
("MJhjI_2K7aM8VIOT", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 그냥, 날씨가 너무 좋아서 무작정 나와버렸어", "때껄룩TAKE A LOOK", "https://youtu.be/pDTJPg5gOxU?si=MJhjI_2K7aM8VIOT", '', 'sunny', 0),

("yqwbdziGuEUypuiZ", "[playlist] 비 오는 날의 수채화", "네고막을책임져도될까", "https://youtu.be/rG0c_ZILHKg?si=yqwbdziGuEUypuiZ", '', 'rainy', 0),
("BYoRb_GmfT270bOX", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 추적추적 비 내리는 날의 감성 팝 ˚₊‧ 𝐋𝐚𝐮𝐯, 𝐂𝐨𝐧𝐚𝐧 𝐆𝐫𝐚𝐲, 𝐓𝐚𝐲𝐥𝐨𝐫 𝐒𝐰𝐢𝐟𝐭, 𝐁𝐢𝐥𝐥𝐢𝐞 𝐄𝐢𝐥𝐢𝐬𝐡 ☔️", "기몽초", "https://youtu.be/2Uycc9jxfjc?si=BYoRb_GmfT270bOX", '', 'rainy', 0),
("BAL1cBB7n4m3lXt4", "[𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 비도 오고, 오늘은 그냥 늘어져서 음악이나 듣자 #인디플리 (데이먼스이어, 검정치마, 백아, 오왠, 너드커넥션, 카더가든)", "올리의뷰티대학 - 피부 탐구 채널", "https://youtu.be/c_l1ZwJbAnc?si=BAL1cBB7n4m3lXt4", '', 'rainy', 0),
("C2iAmwznVCLCqiwd", "[Playlist] 카페 알바생이 비 올 때 매장에 틀려고 만든 플리 ☔🌧💦 I 에픽하이, 윤하, 헤이즈, 태연, 이무진, 폴킴, 아이유, 잔나비 외", "희SUNNY", "https://youtu.be/A-51aNViFxk?si=C2iAmwznVCLCqiwd", '', 'rainy', 0),
("2KVt-iqzxKgL2-J7", "[playlist] 비와 낭만", "네고막을책임져도될까", "https://youtu.be/RN31XpLyR_8?si=2KVt-iqzxKgL2-J7", '', 'rainy', 0),
("m2FlybDrHcvt4a12", "[𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭] 비 올 때 틀어 놓기 좋은 감성힙합 모음🎵🎶 I 에픽하이, 헤이즈, 다이나믹듀오, 페노메코 + ..", "힙재 HIPJAE 🎵", "https://youtu.be/4FRRTSuhIBk?si=m2FlybDrHcvt4a12", '', 'rainy', 0),

("uZN35VsOhIKMoarR", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 설레는 겨울의 분위기를 담은 따뜻하고 포근한 겨울 노래 모음 winter vibes ‧₊˚.", "때껄룩TAKE A LOOK", "https://youtu.be/vLldpdlsfGU?si=uZN35VsOhIKMoarR", '', 'snowy', 0),
("iaxjZlsPNgytY-qS", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 어느덧 겨울이 오고 있는걸", "때껄룩TAKE A LOOK", "https://youtu.be/GjjhrDwM95Q?si=iaxjZlsPNgytY-qS", '', 'snowy', 0),
("5zkgn35Fvr-1TjoZ", "[PLAYLIST] 첫 소절 듣자마자 'ㅇㅋ 통과'가 절로 나온 겨울송들", "딸기 - Strawberries", "https://youtu.be/oefUljptkYw?si=5zkgn35Fvr-1TjoZ", '', 'snowy', 0),
("P-0eAfDm7lUh7BrY", "☃️ 눈 내리는 도쿄의 겨울 | J-POP PLAYLIST", "찐막 JJINMAK", "https://youtu.be/evL6xzMataM?si=P-0eAfDm7lUh7BrY", '', 'snowy', 0),
("bLaQZgmAt7UJFGXB", "[𝐏𝐋𝐀𝐘𝐋𝐈𝐒𝐓] :첫 눈 , 추워질 때 들으려고 아껴둔 겨울 팝송 대방출", "하얀 눈", "https://youtu.be/XLbuK4Urt90?si=bLaQZgmAt7UJFGXB", '', 'snowy', 0),
("2lq4NT4S3I-ectbr", "[Playlist] 슬슬 연말 분위기를 내볼까요? | 퍼펙트 크리스마스 캐롤 플레이리스트🎄🎅🎁 | Best Christmas Pop Songs Of All Time", "essential;", "https://youtu.be/a_80o2lDYec?si=2lq4NT4S3I-ectbr", '', 'snowy', 0),
("p1N4c2Fpoc4xHRGe", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭 다가오는 크리스마스를 기다리며 l 캐롤 BEST 인기곡 총모음 𝑴𝒆𝒓𝒓𝒚 𝑪𝒉𝒓𝒊𝒔𝒕𝒎𝒂𝒔‧₊˚.⋆", "때껄룩TAKE A LOOK", "https://youtu.be/MjyslpML32w?si=p1N4c2Fpoc4xHRGe", '', 'snowy', 0),
("pPwDkPayPtipOO_6", "𝐏𝐥𝐚𝐲𝐥𝐢𝐬𝐭🎄 크리스마스가 다가온다. 그것도 아주 행복할❤ 𝐂𝐡𝐫𝐢𝐬𝐭𝐦𝐚𝐬 𝑪𝒂𝒓𝒐𝒍 🎅 / 캐롤 플레이리스트", "mycozypop", "https://youtu.be/YAsAQgoh52I?si=pPwDkPayPtipOO_6", '', 'snowy', 0),

("9MHCxG9-xVEQXaAg", "잔뜩 흐린 마음을 굳이 달랠 이유는 없었다. / 새벽 팝송 playlist", "offweb", "https://youtu.be/z1UGaVSgcAM?si=9MHCxG9-xVEQXaAg", '', 'cloudy', 0),
("k5SQwKt6ivZ84Xsh", "[Playlist] 회색빛으로 물든 마음 | 흐린 날, 감성을 촉촉하게 적시는 연주곡 | classical music for rainy days", "essential;", "https://youtu.be/VNtKdI14eeM?si=k5SQwKt6ivZ84Xsh", '', 'cloudy', 0),
("i2oOynFgmxL8-hdc", "[playlist] 딱 요즘 듣는 잔잔한 인디들 | 카더가든, 잔나비, 검정치마, 혁오, 짙은, 데이먼스이어", "오퓨쳐Five future", "https://youtu.be/75kySTFaBQQ?si=i2oOynFgmxL8-hdc", '', 'cloudy', 0),
("rCS5sXrwfSsKF5SO", "[Playlist] 카페 알바생이 날씨 흐린 날 매장에 틀려고 만든 플리 ☁🌃🌬 I 백예린, 검정치마, 우효, 김예림, 수란, 크래커, Nov, BIBI, 등", "희SUNNY", "https://youtu.be/-xSoWCnKVW8?si=rCS5sXrwfSsKF5SO", '', 'cloudy', 0),
("6aqygeJ3DgRhlsZH", "[Playlist] 여름비에 흘려보내고 싶은 것들ㅣfor a rainy summer day 🌧️🌂", "essential;", "https://youtu.be/bmyeHpAcsXY?si=6aqygeJ3DgRhlsZH", '', 'cloudy', 0),
("o-iHHXO4Iv1BEx0E", "[Playlist] Cloudy", "필모티브 「 fillmotif 」", "https://youtu.be/g3tLkP8tLI4?si=o-iHHXO4Iv1BEx0E", '', 'cloudy', 0);



INSERT INTO User(userId,  password, name, location)
VALUES ("kim", '1234', "지환", "잠실"),
("cha", '1234', "다운", "회기"),
("ssafy01", '1234',"재현",  "청량리"),
("ssafy02", '1234', "병수", "낙성대"),
("ssafy04", '1234', "승연", "개포동"),
("ssafy03", '1234', "민정", "청량리");


INSERT INTO Review(title,  youtubeId, userId, content, viewCnt)
VALUES ("최고", 'xkdLZABmt7Hpp7Lj', "kim", "왕자님이 인정한 최고의 플레이리스트 !", 0),
("너무 좋아요ㅜㅜ", 'xkdLZABmt7Hpp7Lj', "ssafy02", "너무 좋아서 맨날 들어요ㅜ", 0),
("최애 플리", 'xkdLZABmt7Hpp7Lj', "ssafy03", "제 최애 플리랍니다아~!",  0);


select * from Video;
select * from User;
select * from Review;
select * from Singer;
