<template>
    <div>
        <h4>영상 목록</h4>
        <hr>
        <ul>
            <VideoListItem
                v-for="video in store.videoList"
                :key="video.youtubeId"
                :video="video"
            />
        </ul>
    </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import VideoListItem from "@/components/video/VideoListItem.vue";
import { onMounted } from "vue";

const store = useVideoStore();
onMounted(() => {
    store.getVideoList()
})
</script>

<style scoped></style>