<template>
  <div class="carousel-item text-center" :class="active">
    <img class="image" @click="getVideo" :src="thumbnailURL" />
  </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import { useReviewStore } from "@/stores/review";
import { useRouter } from "vue-router";
import { computed } from "vue";

const router = useRouter();
const store = useVideoStore();
const reviewstore = useReviewStore();

const props = defineProps({
  video: {
    type: Object,
    required: true,
  },
  index: Number,
  current: Number,
});

const active = computed(() => {
  if (props.current == props.index) return { active: true };
});

const getVideo = function () {
  // console.log(video.youtubeId);
  router.push({ path: `/${props.video.youtubeId}` });
};

const thumbnailURL = computed(() => {
  const youtubeId = props.video.youtubeId;
  return `https://img.youtube.com/vi/${youtubeId}/mqdefault.jpg`;
});
</script>

<style scoped>
.image {
  width: 100%;
  height: 600px;
}
.carousel-item text-center {
  position: relative;
}
</style>
