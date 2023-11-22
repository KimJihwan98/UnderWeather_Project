<template>
  <div class="container">
    <div class="videoList">
      <h1> 영상 목록 </h1>
      <VideoList />
    </div>

    <br>
    <hr><br>
    <div class="weather">
      <WeatherForecast />
    </div>
  </div>


  <br>
  <hr><br>
  <div>
    <SportList />
  </div>
</template>

<script setup>
import VideoList from '@/components/video/VideoList.vue';
import SportList from '@/components/sport/SportList.vue';
import WeatherForecast from '@/components/weather/WeatherForecast.vue';

</script>

<style scoped>
.weather {
  position: fixed;


  right: 20px;
  top: 100px;
}

.container {
  display: flex;
}
</style>