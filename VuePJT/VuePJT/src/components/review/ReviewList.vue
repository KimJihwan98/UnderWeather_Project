<template>
    <div>
        <h4>리뷰 목록</h4>
        <hr>
        <ul>
           
        </ul>
    </div>
</template>

<script setup>
import { useReviewStore } from "@/stores/review";
import { onMounted } from "vue";

const store = useReviewStore();
onMounted(() => {
    store.getReviewList()
})
</script>

<style scoped>

</style>