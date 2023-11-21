<template>
  <div>
    <h1> 영상 목록 </h1>
    <VideoList/>
  </div>

  <br><hr><br>
    <div>
      <WeatherForecast/>
    </div>

  <br><hr><br>
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

</style>