<template>
  <li @click="getVideo">
    <img
      class="image"
      :src="`https://img.youtube.com/vi/${video.youtubeId}/mqdefault.jpg`"
    />
    <hr />
    <!-- <br /> -->
  </li>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import { useReviewStore } from "@/stores/review";
import { useRouter } from "vue-router";

const router = useRouter();
const store = useVideoStore();
const reviewstore = useReviewStore();

const props = defineProps({
  video: Object,
});

const getVideo = function () {
  // console.log(video.youtubeId);
  router.push({ path: `/${props.video.youtubeId}` });
};
</script>

<style scoped>
.image {
  width: 380px;
  height: 300px;
}
</style>
