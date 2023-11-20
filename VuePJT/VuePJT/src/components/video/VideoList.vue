<template>
  <div>
    <h4>영상 목록</h4>
    <hr />

    <div class="container">
      <div id="youtube-carousel" class="carousel slide">
        <div class="carousel-inner">
          <!-- 반복문을 돌려서 컴포넌트를 쭉 써버리면 가넝할거 같다. -->
          <VideoListItem
            v-for="(video, index) in store.videoList"
            :key="video.youtubeId"
            :index="index"
            :current="current"
            :video="video"
          />
        </div>
        <button
          @click="prev"
          class="carousel-control-prev"
          type="button"
          data-bs-target="#youtube-carousel"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          @click="next"
          class="carousel-control-next"
          type="button"
          data-bs-target="#youtube-carousel"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>
  </div>
  <!-- <div
      id="carouselExampleControls"
      class="carousel slide"
      data-bs-ride="carousel"
    >
      <div
        class="carousel-inner"
        v-for="(i, video) in store.videoList"
        :key="video.youtubeId"
        :video="video"
      >
        <div class="carousel-item active">
          <img
            :src="`https://img.youtube.com/vi/${video.youtubeId}/0.jpg`"
            :class="imgg"
            class="d-block w-500"
            alt="..."
          />
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div> -->
  <!-- <ul>
      <v-carousel>
        <v-carousel-item
          v-for="video in store.videoList"
          :key="video.youtubeId"
          :video="video"
          :src="`https://img.youtube.com/vi/${video.youtubeId}/0.jpg`"
        />
      </v-carousel>
    </ul> -->
  <!-- </div>-->
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import VideoListItem from "@/components/video/VideoListItem.vue";
import { onMounted, ref } from "vue";

const current = ref(0);

const prev = function () {
  current.value = (current.value + 9) % 10;
};
const next = function () {
  current.value = (current.value + 1) % 10;
};

const store = useVideoStore();
onMounted(() => {
  store.getVideoList();
});
var arr = [];
arr.push;
</script>

<style scoped>
.container {
  height: 500;
}
</style>
