<template>
    <div>
      <h4>영상 목록</h4>
      <hr />
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
      </div>
      <!-- Bootstrap Carousel -->
      <div id="videoCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div
            class="carousel-item"
            v-for="(group, index) in groupedVideos"
            :key="index"
            :class="{ active: index === 0 }"
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
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#videoCarousel"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#videoCarousel"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>
    <!-- <ul>
        <VideoListItem v-for="video in store.videoList" :key="video.youtubeId" :video="video" />
    </ul> -->
    <div class="button">
      <button class="btn btn-primary btn-sm" @click="prev" type="button">
        prev
      </button>
      <button class="btn btn-primary btn-sm" @click="next" type="button">
        next
      </button>
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
  });
  
  onMounted(() => {
    store.getVideoList(fitPartName);
  });
  
  const current = ref(0);
  
  const prev = function () {
    current.value =
      (current.value + (store.videoList.length - 1)) % store.videoList.length;
  };
  const next = function () {
    current.value = (current.value + 1) % store.videoList.length;
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
  .button {
    display: flex;
    justify-content: center;
  }
  </style>
  