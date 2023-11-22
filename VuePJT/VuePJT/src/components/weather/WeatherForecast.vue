<template>
  <div class="log">
    <a href="#" v-if="getUser" @click="logout" class="logout">로그아웃 | </a>
    <RouterLink to="/login" v-else class="login">로그인 | </RouterLink>
    <RouterLink :to="{ name: 'Regist' }" class="signup">회원가입</RouterLink>
  </div>
  <hr />
  <div class="weather1">
    <div class="card" style="width: 9rem">
      <div class="card-body">
        <h5 class="card-title">오늘의 날씨</h5>
      </div>
      <img :src="`${imgSrc}`" class="card-img-top" alt="..." />
      <ul class="list-group list-group-flush">
        <li class="list-group-item">기온 : {{ wstore.nowWeather.tmp }}℃</li>
        <li class="list-group-item">날씨 : {{ wstore.nowWeather.sky }}</li>
        <li class="list-group-item">강수확률 : {{ wstore.nowWeather.pop }}%</li>
      </ul>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, onBeforeUpdate } from "vue";
import axios from "axios";
import { useWeatherStore } from "@/stores/weather";

const wstore = useWeatherStore();

onMounted(() => {
  wstore.getNowWeather();
});

let imgSrc = ref("");
onBeforeUpdate(() => {
  if (wstore.nowWeather.pty === 1 || wstore.nowWeather.pty === 4) {
    wstore.nowWeather.sky = "비";
    imgSrc = "/assets/weatherImgs/rainy.png";
  } else if (wstore.nowWeather.pty === 2 || wstore.nowWeather.pty === 3) {
    wstore.nowWeather.sky = "눈";
    imgSrc = "/assets/weatherImgs/snowman.png";
  } else if (wstore.nowWeather.sky === "맑음") {
    imgSrc = "/assets/weatherImgs/sunny.png";
  } else {
    imgSrc = "/assets/weatherImgs/cloudy.png";
  }
});
</script>

<style scoped>
.card-title {
  justify-content: center;
}
.card {
  color: rgb(15, 129, 236);
}
.list-group-item {
  color: rgb(15, 129, 236);
}
.weather1 {
  margin: auto;
}
.login {
  color: white;
}
.logout {
  color: white;
}
.signup {
  color: white;
}
</style>
