<template>

  <div id="sports">
    <div class="sports-image" font-color="link-color">
      스포츠리스트
      <img :src="sport" v-for="sport in sports" :key="sport" alt="테스트" />
    </div>
  </div>

    <div>
        <hr />
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item" @click="selectSport()">
                    <a class="nav-link" :class="check1" aria-current="page" href="#">추천</a>
                </li>
                <li class="nav-item" @click="changeFitPartName(`상체`)">
                    <a class="nav-link" :class="check2" href="#">전체</a>
                </li>
            </ul>
        </div>
        <!-- Bootstrap Carousel -->
        <div id="sportCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item" v-for="(group, index) in Sports" :key="index"
                    :class="{ active: index === current }">
                    <div class="d-flex">
                        <VideoListItem v-for="video in group" :key="sport.spname" :sport="sport" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    
</template>

<script setup>

import { ref, onMounted } from 'vue';
import { useWeatherStore } from '@/stores/weather';


const wstore = useWeatherStore();
onMounted(() => {
    wstore.getNowWeather();
})

const insideSport = ['badminton', 'boxing', 'swimming', 'tabletennis']
const outsideSport = ['basketball', 'soccer', 'tennis', 'runner', 'golf']


const selectedSport = ref([]);
const selectSport = () => {
    if(wstore.status === 'inside'){
        selectedSport.value = insideSport[Math.floor(Math.random() * 4)];
    } else if(wstore.status=== 'outside') {
        selectedSport.value = outsideSport[Math.floor(Math.random() * 5)];
    }
};

const modules = import.meta.glob("/public/assets/images/*.png", {
  eager: true,
});
const sports = [];
for (const img in modules) {
    sports.push(modules[img].default);
};

// const check1 = computed(() => {
//   if (fitPartName === "전신") return { active: true };
// });
// const check2 = computed(() => {
//   if (fitPartName === "상체") return { active: true };
// });


let currentPage = 0;
const itemsPerPage = 3;
const nextPage = function () {
  currentPage = (currentPage + 1) % Math.ceil(sports.length / itemsPerPage);
};
const prevPage = function () {
  currentPage =
    (currentPage - 1 + Math.ceil(sports.length / itemsPerPage)) %
    Math.ceil(sports.length / itemsPerPage);
};
</script>

<style scoped>
img {
  border: 1px solid #d8d8d8;
  width: 40px;
  height: 40px;
  margin: 40px;
  box-shadow: 0px 0.5px 1px #d8d8d8;
}

.sports-image {
  width: 80%;
  color: rgb(15, 129, 236);
  margin: auto;
}

.sports {
  display: flex;
  flex-flow: wrap;
  padding: 1rem;
}
</style>
