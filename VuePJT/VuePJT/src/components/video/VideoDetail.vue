<template>
    <div>
        영상 상세정보

    </div>
    <div class="container1">
        <div class="card" style="width: 50rem">
            <iframe class="card-img-top" width="560" height="500" :src="videoURL" title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen></iframe>
            <div class="card-body">
                <p class="card-text">제목 : {{ vstore.video.title }}</p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">부위 : {{ vstore.video.fitPartName }}</li>
                <li class="list-group-item">채널 이름 : {{ vstore.video.channelName }}</li>
            </ul>
        </div>
    </div>
    <hr>

    <div class="container">
        <div class="text-center">
            <h2 class="my-h2 my-underline">{{vstore.video.title}}</h2>
        </div>
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <RouterLink class="nav-link" :class="reviewlist" :to="{ name: 'reviewList'}">리뷰 목록</RouterLink>
            </li>
            <li class="nav-item">
                <RouterLink class="nav-link" :class="products" :to="{ name: 'product' }">관련 제품 목록</RouterLink>
            </li>
        </ul>
        <RouterView />
    </div>
</template>

<script setup>
import { useVideoStore } from '@/stores/video.js';
import { useReviewStore } from '@/stores/review.js';
import { useRouter, useRoute } from 'vue-router'
import { computed, onMounted } from 'vue'

const vstore = useVideoStore();
const rstore = useReviewStore();
const router = useRouter();
const route = useRoute();

const youtubeId = route.params.youtubeId;

const videoURL = computed(() => {
    return `https://www.youtube.com/embed/${youtubeId}`
})


vstore.getVideo(youtubeId);

// // Review리스트

// onMounted(() => {
//     rstore.getReviewList(youtubeId)
// })

// const createReview = function () {
//     router.push({ path: `/review/${youtubeId}/create` });
// };

const reviewlist = computed(() => {
    if(route.name === 'reviewList') return {active: true}
})

const products = computed(() => {
    if( route.name==='product') return {active: true}
})


</script>

<style scoped>
.container1 {
    display: flex;
    justify-content: center;
}
</style>