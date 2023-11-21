<template>
    <div id="sports">
        <div class="sports-image">
            스포츠리스트
            <img :src="sport" v-for="sport in sports" :key="sport" alt="테스트" />
        </div>
    </div>

    <div id="imageCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div v-for="(sport, index) in sports" :key="index" :class="{ 'carousel-item': true, 'active': index === 0 }">
                <img :src="sport" class="d-block w-30" :alt="'sport ' + (index + 1)">
            </div>
        </div>
        <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev" @click="prevPage">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next" @click="nextPage">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const modules = import.meta.glob("/public/assets/images/*.png", { eager: true });
const sports = [];
for (const img in modules) {
    sports.push(modules[img].default);
}

let currentPage = 0;
const itemsPerPage = 3;
const nextPage = function () {
    currentPage = (currentPage + 1) % Math.ceil(sports.length / itemsPerPage);
}
const prevPage = function () {
    currentPage = (currentPage - 1 + Math.ceil(sports.length / itemsPerPage)) % Math.ceil(sports.length / itemsPerPage);
}

</script>

<style scoped>
img {
    border: 1px solid #d8d8d8;
    width: 40px;
    height: 40px;
    margin: 40px;
    box-shadow: 0px .5px 1px #d8d8d8;
}

.sports-image {
    width: 80%;
}

.sports {
    display: flex;
    flex-flow: wrap;
    padding: 1rem;
}
</style>