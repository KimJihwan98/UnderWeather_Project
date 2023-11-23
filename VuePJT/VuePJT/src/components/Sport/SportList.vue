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
        <li class="nav-item" @click="selectSport">
          <a class="nav-link" :class="check3" aria-current="page" href="#">추천</a>
        </li>
        <li class="nav-item" @click="selectAllSport">
          <a class="nav-link" :class="check4" href="#">전체</a>
        </li>
      </ul>
    </div>
    <!-- Bootstrap Carousel -->
    <div id="sportCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item" v-for="(group, index) in groupedSports" :key="index"
          :class="{ active: index === 0 }">
          <div class="d-flex">
            <SportListItem v-for="sport in group" :sport="sport" />
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="button">
    <button @click="prev" type="button" class="btn btn-outline-primary">
      &lt
    </button>
    <button @click="next" type="button" class="btn btn-outline-primary">
      &gt
    </button>
  </div>
</template>

<script setup>

import { onMounted, watch, computed } from 'vue';
import { useWeatherStore } from '@/stores/weather';
import { useSportStore } from '@/stores/sport';
import SportListItem from "@/components/Sport/SportListItem.vue"

const sstore = useSportStore();
const wstore = useWeatherStore();
onMounted(() => {
  wstore.getNowWeather();
})

const allSport = ['badminton', 'boxing', 'swimming', 'tabletennis', 'basketball', 'soccer', 'tennis', 'runner', 'golf']
const insideSport = ['badminton', 'boxing', 'swimming', 'tabletennis']
const outsideSport = ['basketball', 'soccer', 'tennis', 'runner', 'golf']


const selectedSport = [];
const selectSport = function() {
  if (wstore.status === 'inside') {
    selectedSport = [...insideSport[Math.floor(Math.random() * 4)]];
  } else if (wstore.status === 'outside') {
    selectedSport = [...outsideSport[Math.floor(Math.random() * 5)]];
  }
};

const selectAllSport = function() {
  selectedSport = [...allSport];
}

watch(selectedSport, () => {
  sstore.getSportList(selectedSport);
  // current.value = 0;
});


const check3 = computed(() => {
  if (selectedSport.length == 1) return { active: true };
});
const check4 = computed(() => {
  if (selectedSport.length != 1) return { active: true };
});

const groupedSports = computed(() => {
  const groups = [];
  for (let i = 0; i < sstore.sportList.length; i += 3) {
    groups.push(sstore.sportList.slice(i, i + 3));
  }
  return groups;
});

const modules = import.meta.glob("/public/assets/images/*.png", {
  eager: true,
});
const sports = [];
for (const img in modules) {
  sports.push(modules[img].default);
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
