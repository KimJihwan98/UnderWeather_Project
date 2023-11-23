<template>
  <div class="main">
    <div class="videoList-container">
      <div class="videoList">
        <VideoList />
      </div>
    </div>
    <div class="weather">
      <WeatherForecast />
    </div>
    <div class="videoWeather-container">
      <div>
        <VideoWeatherList />
      </div>
    </div>
  </div>
</template>

<script setup>
import VideoList from "@/components/video/VideoList.vue";
import VideoWeatherList from "@/components/videoWeather/VideoWeatherList.vue";
import WeatherForecast from "@/components/weather/WeatherForecast.vue";

</script>

<style scoped>
.weather {
  position: fixed;
  margin: auto;
  right: 150px;
  top: 100px;
}
.main {
  display: flex;
  flex-direction: column;
}
.videoList-container {
  display: flex;
  justify-content: center;
  height: 500px;
}

.videoWeather-container {
  display: flex;
  justify-content: center;
  height: 400px;
}
</style>
