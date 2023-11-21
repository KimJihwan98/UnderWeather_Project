<template>
    <div class="card" style="width: 18rem;">
        <img :src="`${imgSrc}`" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">오늘의 날씨</h5>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">기온 : {{ tmp }}℃</li>
            <li class="list-group-item">날씨 : {{ sky }}</li>
            <li class="list-group-item">강수확률 : {{ pop }}%</li>
        </ul>
    </div>
    <!-- <div class="today-weather">
        <h4>날씨정보</h4>
        <div>기온 : {{ tmp }}℃</div>
        <div>날씨 : {{ sky }}</div>
        <div>강수형태 : {{ pty }}</div>
        <div>강수확률 : {{ pop }}%</div>
    </div> -->
</template>

<script setup>
import { onMounted, ref, onBeforeUpdate } from "vue";
import axios from "axios";
const tmp = ref(null);
const sky = ref(null);
const pty = ref(null);
const pop = ref(0);
onMounted(() => {
    const API_URL = `http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst`;

    const today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth() + 1;
    let day = today.getDate();
    let time = today.getHours() + '00';
    month = month < 10 ? "0" + month : month;
    day = day < 10 ? "0" + day : day;
    const todayStr = `${year}${month}${day}`;
    console.log(todayStr);
    //발표시간을 전부 넣어둬
    const times = ['0200', '0500', '0800', '1100', '1400', '1700', '2000', '2300']//8개넣어 
    let min = 10000;
    let min_idx = -1;
    for (let i = 0; i < 8; i++) {
        if (min > Math.abs(Number(time) - Number(times[i]))) {
            min = Math.abs(Number(time) - Number(times[i]));
            min_idx = i;
        }
    }
    const timeStr = `${times[min_idx]}`;
    axios
        .get(API_URL, {
            params: {
                ServiceKey: import.meta.env.VITE_WEATHER_API_KEY,
                dataType: "JSON",
                base_date: todayStr, //20231105 형태
                base_time: timeStr,   //이것은 총 8회 발표 
                numOfRows: 15,
                nx: 61, //역삼위치
                ny: 125,
            },
        })
        .then((response) => {
            return response.data.response.body.items.item;
        })
        .then((response) => {
            //TMP : 1시간 기온 ℃
            //SKY : 하늘상태 --> 코드 : 맑음(1), 구름많음(3), 흐림(4)
            //PTY : 강수형태 --> 코드 : 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4)
            //POP : 강수확률 %
            response.forEach((item) => {
                if (item.category === "TMP") {
                    tmp.value = item.fcstValue;
                } else if (item.category === "SKY") {
                    switch (item.fcstValue) {
                        case "1":
                            sky.value = "맑음";
                            break;
                        case "3":
                            sky.value = "구름많음";
                            break;
                        case "4":
                            sky.value = "흐림";
                            break;
                    }
                } else if (item.category === "PTY") {
                    pty.value = item.fcstValue;
                } else if (item.category === "POP") {
                    pop.value = item.fcstValue;
                }
            });
        });
});

let imgSrc = ref('');
onBeforeUpdate(() => {
    console.log(pty.value);
    if (pty.value === 1 || pty.value === 4) {
        sky.value = "비"
        imgSrc.value = "/assets/weatherImgs/rainy.png";
    } else if (pty.value === 2 || pty.value === 3) {
        sky.value = "눈"
        imgSrc.value = "/assets/weatherImgs/snow.png";
    } else if (sky.value === "맑음") {
        imgSrc.value = "/assets/weatherImgs/sunny.png";
    } else {
        imgSrc.value = "/assets/weatherImgs/cloudy.png";
    }
    console.log(imgSrc);
})
</script>

<style scoped></style>