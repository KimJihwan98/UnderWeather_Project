<template>
  <div>
    <div class="nav-container">
      <ul class="nav nav-tabs">
        <li class="nav-item" @click="changeGenreName(`pop`)">
          <a class="nav-link" :class="check1" aria-current="page" href="#">POP</a>
        </li>
        <li class="nav-item" @click="changeGenreName(`kPop`)">
          <a class="nav-link" :class="check2" href="#">K-POP</a>
        </li>
        <li class="nav-item" @click="changeGenreName(`ballad`)">
          <a class="nav-link" :class="check3" href="#">발라드</a>
        </li>
        <li class="nav-item" @click="changeGenreName(`hipHop`)">
          <a class="nav-link" :class="check4" href="#">힙합</a>
        </li>
        <li class="nav-item" @click="changeGenreName(`classic`)">
          <a class="nav-link" :class="check5" href="#">클래식</a>
        </li>
        <li class="nav-item" @click="changeGenreName(`rock`)">
          <a class="nav-link" :class="check6" href="#">락</a>
        </li>
      </ul>

    </div>
    <!-- Bootstrap Carousel -->
    <div id="videoCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item" v-for="(group, index) in groupedVideos" :key="index"
          :class="{ active: index === current }">
          <div class="d-flex">
            <VideoListItem v-for="video in group" :key="video.youtubeId" :video="video" />
          </div>
        </div>
      </div>
    </div>
    <div class="button1">
      <button type="button" class="btn btn-link" @click="prev">◀</button>
      <button type="button" class="btn btn-link" @click="next">▶</button>

    </div>
  </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import VideoListItem from "@/components/video/VideoListItem.vue";
import { onMounted, ref, watch, computed } from "vue";

const store = useVideoStore();

const genre = ref("pop");

const check1 = computed(() => {
  if (genre.value === "pop") return { active: true };
});
const check2 = computed(() => {
  if (genre.value === "kPop") return { active: true };
});
const check3 = computed(() => {
  if (genre.value === "ballad") return { active: true };
});
const check4 = computed(() => {
  if (genre.value === "hipHop") return { active: true };
});
const check5 = computed(() => {
  if (genre.value === "classic") return { active: true };
});
const check6 = computed(() => {
  if (genre.value === "rock") return { active: true };
});


const changeGenreName = (newGenre) => {
  genre.value = newGenre;
};

watch(genre, () => {
  store.getVideoListGenre(genre);
  // console.log(store.VideoListItem(genre));
  current.value = 0;
});

onMounted(() => {
  store.getVideoListGenre(genre);
});

const current = ref(0);

const prev = function () {
  current.value =
    (current.value + (store.videoListGenre.length - 1)) % (Math.ceil(store.videoListGenre.length / 3));
};
const next = function () {
  current.value = (current.value + 1) % (Math.ceil(store.videoListGenre.length / 3));
};

const groupedVideos = computed(() => {
  const groups = [];
  for (let i = 0; i < store.videoListGenre.length; i += 3) {
    groups.push(store.videoListGenre.slice(i, i + 3));
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

.nav-container {
  display: flex;
  justify-content: center;
}


button {
  padding: 5px;
  width: 40px;
}

.vili {
  margin: auto;
}


</style>
