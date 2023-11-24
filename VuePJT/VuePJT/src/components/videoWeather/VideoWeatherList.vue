<template>
  <div class="container">
    <ul class="nav nav-tabs">
      <li class="nav-item" @click="changeWeatherName(`sunny`)">
        <a class="nav-link" :class="check1" aria-current="page">
          <span v-if="(`${heart}` ==='sunny')">💙</span>해
          <span v-if="(`${heart}` ==='sunny')">💙</span></a>
      </li>
      <li class="nav-item" @click="changeWeatherName(`cloudy`)">
        <a class="nav-link" :class="check2">
          <span v-if="(`${heart}` ==='cloudy')">💙</span>구름
          <span v-if="(`${heart}` ==='cloudy')">💙</span></a>
      </li>
      <li class="nav-item" @click="changeWeatherName(`rainy`)">
        <a class="nav-link" :class="check3">
          <span v-if="(`${heart}` ==='rainy')">💙</span>비
          <span v-if="(`${heart}` ==='rainy')">💙</span></a>
      </li>
      <li class="nav-item" @click="changeWeatherName(`snowy`)">
        <a class="nav-link" :class="check4">
          <span v-if="(`${heart}` ==='snowy')">💙</span>눈
          <span v-if="(`${heart}` ==='snowy')">💙</span></a>
      </li>
    </ul>
  </div>

  <!-- Bootstrap Carousel -->
  <div id="videoCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item" v-for="(group, index) in groupedVideos" :key="index"
        :class="{ active: index === current }">
        <div class="d-flex">
          <VideoWeatherListItem v-for="video in group" :key="video.youtubeId" :video="video" />
        </div>
      </div>
    </div>
  </div>

  <div class="button1">
    <button type="button" class="btn btn-link" @click="prev">◀</button>
    <button type="button" class="btn btn-link" @click="next">▶</button>
  </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import { useWeatherStore } from "@/stores/weather";
import VideoWeatherListItem from "@/components/videoWeather/VideoWeatherListItem.vue";
import { onMounted, ref, watch, computed, onBeforeUpdate } from "vue";
import HeaderNav from "../common/HeaderNav.vue";

const wstore = useWeatherStore();
const store = useVideoStore();

const weather = ref('');
const heart = ref('0');

onMounted(() => {
  wstore.getNowWeather()
    .then(() => {
      weather.value = wstore.weatherName;
      heart.value = wstore.weatherName;
      store.getVideoListWeather(weather.value);
    });
});



const check1 = computed(() => {
  if (weather.value === "sunny") return { active: true };
});
const check2 = computed(() => {
  if (weather.value === "cloudy") return { active: true };
});
const check3 = computed(() => {
  if (weather.value === "rainy") return { active: true };
});
const check4 = computed(() => {
  if (weather.value === "snowy") return { active: true };
});


const changeWeatherName = (newWeather) => {
  weather.value = newWeather;
};

watch(weather, () => {
  store.getVideoListWeather(weather);
  current.value = 0;
});




const current = ref(0);

const prev = function () {
  current.value =
    (current.value + (store.videoListWeather.length - 1)) % (Math.ceil(store.videoListWeather.length / 3));
};
const next = function () {
  current.value = (current.value + 1) % (Math.ceil(store.videoListWeather.length / 3));
};

const groupedVideos = computed(() => {
  const groups = [];
  for (let i = 0; i < store.videoListWeather.length; i += 3) {
    groups.push(store.videoListWeather.slice(i, i + 3));
  }
  return groups;
});
</script>

<style scoped>
.button1 {
  display: flex;
  justify-content: center;
}

button {
  padding: 5px;
  width: 40px;
}

.btn-link {
  background-color: white;
  border-color: rgb(15, 129, 236);
  color: rgb(15, 129, 236);
}

.container {
  display: flex;
  justify-content: center;
}

.vili {
  margin: auto;
}
</style>
