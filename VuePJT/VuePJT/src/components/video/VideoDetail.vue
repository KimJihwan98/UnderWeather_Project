<template>
  <!-- <br />
  <br />
  <br />
  <br />
  <br />
  <br /> -->

  <div class="tit1"> 
    <h4 class="my-h2 my-underline">{{ vstore.video.title }}</h4>
  </div>
    <div class="container1">
  <div class="box">

    <div class="card" style="width:45rem">
      <iframe
        class="card-img-top"
        width="480"
        height="400"
        :src="videoURL"
        title="YouTube video player"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
        allowfullscreen
      ></iframe>

      <ul class="list-group list-group-flush">
        <li class="list-group-item" v-if=(vstore.video.genre)>장르 : {{ vstore.video.genre }}</li>
        <li class="list-group-item" v-if=(vstore.video.weather)>듣기 좋은 날 : {{ vstore.video.weather }}</li>
        <li class="list-group-item">
          채널 이름 : {{ vstore.video.channelName }}
        </li>
      </ul>
    </div>
  </div>

  <hr />
  <div class="weather">
        <WeatherForecast />
      </div>
    </div>
  <div class="container">
    <div class="text-center">
      
    </div>
    <ul class="nav nav-tabs">
      <li class="nav-item">
        <RouterLink
          class="nav-link"
          :class="reviewlist"
          :to="{ name: 'reviewList' }"
          >리뷰 목록</RouterLink
        >
      </li>
      <li class="nav-item">
        <RouterLink class="nav-link" :class="products" :to="{ name: 'product' }"
          >Singer in this Playlist</RouterLink
        >
      </li>
    </ul>
    <RouterView />
  </div>




</template>

<script setup>
import { useVideoStore } from "@/stores/video.js";
import { useReviewStore } from "@/stores/review.js";
import { useRouter, useRoute } from "vue-router";
import { computed, onMounted } from "vue";
import WeatherForecast from "@/components/weather/WeatherForecast.vue";

const vstore = useVideoStore();
const rstore = useReviewStore();
const router = useRouter();
const route = useRoute();

const youtubeId = route.params.youtubeId;

const videoURL = computed(() => {
  return `https://www.youtube.com/embed/${youtubeId}`;
});

vstore.getVideo(youtubeId);

// // Review리스트

// onMounted(() => {
//     rstore.getReviewList(youtubeId)
// })

// const createReview = function () {
//     router.push({ path: /review/${youtubeId}/create });
// };

const reviewlist = computed(() => {
  if (route.name === "reviewList") return { active: true };
});

const products = computed(() => {
  if (route.name === "product") return { active: true };
});
</script>

<style scoped>

.card-text{
  text-align: center;
}
h4{
  color: white;
  display: flex;
}
.tit1{
  display: flex;
  align-items: center;
  justify-content: center;
}

.box {
  display: flex;
  align-items: center;
  justify-content: center;
  margin:auto;
}

.card-img-top {
  border: 1px solid #ccc;
  border-radius: 8px;
}
.container1{
  display: flex;
}
</style>
