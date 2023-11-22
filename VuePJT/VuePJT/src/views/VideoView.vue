<template>
  <div class="main">
    <div class="container">
      <div class="videoList">
        <VideoList />
      </div>

      <br />
      <hr />
      <br />
      <div class="weather">
        <WeatherForecast />
      </div>
    </div>

    <br />
    <hr />
    <br />
    <div>
      <SportList />
    </div>
  </div>
</template>

<script setup>
import VideoList from "@/components/video/VideoList.vue";
import SportList from "@/components/sport/SportList.vue";
import WeatherForecast from "@/components/weather/WeatherForecast.vue";
import { useWeatherStore } from "@/stores/weather";
import { ref, onMounted, watch } from "vue";
</script>

<style scoped>
.weather {
  position: fixed;
  margin: auto;
  right: 20px;
  top: 100px;
}

.container {
  display: flex;
}
</style>
