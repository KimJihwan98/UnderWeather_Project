<template>
  <br />
  <br />
  <br />
  <br />
  <br />
  <br />
  <div class="container">
    <!-- <div class="text-center">
              <h2 class="my-h2 my-underline">{{ vstore.video.title }}</h2>
          </div> -->
    <ul class="nav nav-tabs">
      <!-- <p>{{ genre }}</p> -->
      <li class="nav-item" @click="changeWeatherName(`sunny`)">
        <a class="nav-link" :class="check1" aria-current="page" href="#">해</a>
      </li>
      <li class="nav-item" @click="changeWeatherName(`cloudy`)">
        <a class="nav-link" :class="check2" href="#">구름</a>
      </li>
      <li class="nav-item" @click="changeWeatherName(`rainy`)">
        <a class="nav-link" :class="check3" href="#">비</a>
      </li>
      <li class="nav-item" @click="changeWeatherName(`snowy`)">
        <a class="nav-link" :class="check4" href="#">눈</a>
      </li>
    </ul>

  </div>
  <!-- Bootstrap Carousel -->
  <div id="videoCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item" v-for="(group, index) in groupedVideos" :key="index"
        :class="{ active: index === current }">
        <div class="d-flex">
          <SportListItem v-for="video in group" :key="video.youtubeId" :video="video" />
        </div>
      </div>
    </div>
  </div>



  <!-- <ul>
      <VideoListItem v-for="video in store.videoList" :key="video.youtubeId" :video="video" />
  </ul> -->
  <div class="button1">
    <button type="button" class="btn btn-link" @click="prev">◀</button>
    <button type="button" class="btn btn-link" @click="next">▶</button>

  </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import SportListItem from "@/components/Sport/SportListItem.vue";
import { onMounted, ref, watch, computed } from "vue";

const store = useVideoStore();

const weather = ref("sunny");

const check1 = computed(() => {
  if (weather === "sunny") return { active: true };
});
const check2 = computed(() => {
  if (weather === "cloudy") return { active: true };
});
const check3 = computed(() => {
  if (weather === "rainy") return { active: true };
});
const check4 = computed(() => {
  if (weather === "snowy") return { active: true };
});


const changeWeatherName = (newWeather) => {
  weather.value = newWeather;
};

watch(weather, () => {
  store.getVideoListWeather(weather);
  current.value = 0;
});

onMounted(() => {
  store.getVideoListWeather(weather);
});

const current = ref(0);

const prev = function () {
  current.value =
    (current.value + (store.videoListWeather.length - 1)) % (Math.floor(store.videoListWeather.length / 3) + 1);
};
const next = function () {
  current.value = (current.value + 1) % (Math.floor(store.videoListWeather.length / 3) + 1);
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
