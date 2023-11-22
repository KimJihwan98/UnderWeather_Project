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
      <!-- <p>{{ fitPartName }}</p> -->
      <li class="nav-item" @click="changeFitPartName(`전신`)">
        <a class="nav-link" :class="check1" aria-current="page" href="#"
          >전신</a
        >
      </li>
      <li class="nav-item" @click="changeFitPartName(`상체`)">
        <a class="nav-link" :class="check2" href="#">상체</a>
      </li>
      <li class="nav-item" @click="changeFitPartName(`하체`)">
        <a class="nav-link" :class="check3" href="#">하체</a>
      </li>
      <li class="nav-item" @click="changeFitPartName(`복부`)">
        <a class="nav-link" :class="check4" href="#">복부</a>
      </li>
    </ul>

    <!-- Bootstrap Carousel -->
    <div id="videoCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div
          class="carousel-item"
          v-for="(group, index) in groupedVideos"
          :key="index"
          :class="{ active: index === current }"
        >
          <div class="d-flex">
            <VideoListItem
              v-for="video in group"
              :key="video.youtubeId"
              :video="video"
            />
          </div>
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
import VideoListItem from "@/components/video/VideoListItem.vue";
import { onMounted, ref, watch, computed } from "vue";

const store = useVideoStore();

const fitPartName = ref("전신");

const check1 = computed(() => {
  if (fitPartName === "전신") return { active: true };
});
const check2 = computed(() => {
  if (fitPartName === "상체") return { active: true };
});
const check3 = computed(() => {
  if (fitPartName === "하체") return { active: true };
});
const check4 = computed(() => {
  if (fitPartName === "복부") return { active: true };
});

const changeFitPartName = (newName) => {
  fitPartName.value = newName;
};

watch(fitPartName, () => {
  store.getVideoList(fitPartName);
  current.value=0;
});

onMounted(() => {
  store.getVideoList(fitPartName);
});

const current = ref(0);

const prev = function () {
  current.value =
    (current.value + (store.videoList.length - 1)) % (Math.floor(store.videoList.length/3)+1);
};
const next = function () {
  current.value = (current.value + 1) % (Math.floor(store.videoList.length/3)+1);
};

const groupedVideos = computed(() => {
  const groups = [];
  for (let i = 0; i < store.videoList.length; i += 3) {
    groups.push(store.videoList.slice(i, i + 3));
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
  display:flex;
  justify-content:center;
}
.vili {
  margin: auto;


.container {
  display:flex;
  justify-content:center;

}
</style>
