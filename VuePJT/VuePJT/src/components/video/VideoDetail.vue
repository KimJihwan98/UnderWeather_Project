<template>
    <div>
        영상 상세정보

    </div>
    <div class="container">
        <div class="card" style="width: 50rem">
            <iframe class="card-img-top" width="560" height="500" :src="videoURL" title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen></iframe>
            <div class="card-body">
                <p class="card-text">제목 : {{vstore.video.title}}</p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">부위 : {{ vstore.video.fitPartName }}</li>
                <li class="list-group-item">채널 이름 : {{ vstore.video.channelName }}</li>
            </ul>
        </div>
    </div>
    <hr>

    <div class="container">
        <h4>리뷰 목록</h4>
        <button @click="createReview"> 리뷰 작성하기 </button>
        <hr>
        <!-- <ReviewSerachInput /> -->
        <table class=" table table-hover text-center">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>리뷰 내용</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            <tr v-for="(review, index) in rstore.reviewList" :key="review.rId">
                <td>{{ index+1 }}</td>
                <td>
                    <RouterLink :to="`/review/${youtubeId}/${review.rId}`">{{ review.title }}</RouterLink>
                </td>
                <td>{{ review.userId }}</td>
                <td>{{ review.content }}</td>
                <td>{{ review.regDate }}</td>
                <td>{{ review.viewCnt }}</td>
            </tr>
        </table>
        

    </div>

</template>

<script setup>
import { useVideoStore } from '@/stores/video.js';
import { useReviewStore} from '@/stores/review.js';
import { useRouter, useRoute } from 'vue-router'
import { computed, onMounted } from 'vue'

const vstore = useVideoStore();
const rstore = useReviewStore();
const router = useRouter();
const route = useRoute();

const videoURL = computed(() => {
    return `https://www.youtube.com/embed/${youtubeId}`
})

const youtubeId = route.params.youtubeId;

vstore.getVideo(youtubeId);

// Review리스트

onMounted(() => {
    rstore.getReviewList(youtubeId)
})

const createReview = function () {
    router.push({ path: `/review/${youtubeId}/create` });
};


</script>

<style scoped>
.container {
    display: flex;
    justify-content: center;
}
</style>