<template>
    <div class="container">
        <h2>리뷰 목록</h2>
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
import { useReviewStore} from '@/stores/review.js';
import { useRouter, useRoute } from 'vue-router'
import { computed, onMounted } from 'vue'

const rstore = useReviewStore();
const route = useRoute();
const router = useRouter();

const youtubeId = route.params.youtubeId;

onMounted(() => {
    rstore.getReviewList(youtubeId)
})

const createReview = function () {
    router.push({ path: `/review/${youtubeId}/create` });
};
</script>

<style scoped>

</style>