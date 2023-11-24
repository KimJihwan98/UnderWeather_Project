import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import router from '@/router'
import axios from 'axios'

const API_URL = `http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst`;

export const useWeatherStore = defineStore('weather', () => {
    const nowWeather = ref({ tmp: '', sky: '', pty: '', pop: '' })
    const weatherName = ref('')
    const status = ref('');
    const getNowWeather = function () {
        const today = new Date();
        let year = today.getFullYear();
        let month = today.getMonth() + 1;
        let day = today.getDate();
        let time = today.getHours() + '00';
        month = month < 10 ? "0" + month : month;
        day = day < 10 ? "0" + day : day;
        const todayStr = `${year}${month}${day}`;
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
        return axios
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
                        nowWeather.value.tmp = item.fcstValue;
                    } else if (item.category === "SKY") {
                        switch (item.fcstValue) {
                            case "1":
                                nowWeather.value.sky = "맑음";
                                break;
                            case "3":
                                nowWeather.value.sky = "구름많음";
                                break;
                            case "4":
                                nowWeather.value.sky = "흐림";
                                break;
                        }
                    } else if (item.category === "PTY") {
                        nowWeather.value.pty = item.fcstValue;
                    } else if (item.category === "POP") {
                        nowWeather.value.pop = item.fcstValue;
                    }
                });
                // console.log('조건문 전', nowWeather.value);
                // if (nowWeather.value.pty === 1 || nowWeather.value.pty === 4) {
                //     weatherName.value = "rainy";
                // } else if (nowWeather.value.pty === 2 || nowWeather.value.pty === 3) {
                //     weatherName.value = "snow";
                // } else if (nowWeather.value.pty === 2) {
                //     if (nowWeather.value.sky === 1) {
                //         weatherName.value = "sunny";
                //     } else {
                //         weatherName.value = "cloudy";
                //     }
                // }
                if (nowWeather.value.pty === 1 || nowWeather.value.pty === 4) {
                    weatherName.value = "rainy";
                } else if (nowWeather.value.pty === 2 || nowWeather.value.pty === 3) {
                    weatherName.value = "snowy";
                } else if (nowWeather.value.sky === "맑음") {
                    weatherName.value = "sunny";
                } else {
                    weatherName.value = "cloudy";
                }

                if(nowWeather.pty === 1 || nowWeather.pty === 4 || nowWeather.pty === 2 || nowWeather.pty === 3){
                    status.value = 'inside';
                } else {
                    status.value = 'outside';
                }
                console.log('비동기요청', weatherName.value)
            });

    }


    return { nowWeather, weatherName, getNowWeather, status }
})
