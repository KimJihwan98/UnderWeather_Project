<template>
    <div>
        <h4>리뷰 작성</h4>
        <fieldset>
            <legend>등록</legend>
            <div>
                <label for="title">제목 : </label>
                <input type="text" id="title" v-model="review.title">
            </div>
            <div>
                <label for="writer">작성자 : </label>
                <input type="text" id="writer" v-model="review.writer">
            </div>
            <div>
                <label for="content">내용 : </label>
                <textarea id="content" cols="30" rows="10" v-model="review.content"></textarea>
            </div>
            <div>
                <button @click="createReview">등록</button>
            </div>
        </fieldset>
    </div>
</template>

<script setup>
import { ref } from "vue";
import { useReviewStore } from "@/stores/review";
import {useRoute} from "vue-router"

const route = useRoute();
const store = useReviewStore()
    
const review = ref({
    title: '',
    writer: '',
    content: '',
    regDate: '',
    youtubeId: `${route.params.vid}`
})

const createReview = function () {
    store.createReview(review.value)
}
</script>

<style scoped></style>
