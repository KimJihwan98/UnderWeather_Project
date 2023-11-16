<template>
    <li @click="getVideo">
        <div>{{ video.title }}</div>
        <img :src="`https://img.youtube.com/vi/${video.youtubeId}/0.jpg`">
        <hr><br>
    </li>
</template>

<script setup>
import {useVideoStore} from '@/stores/video';
import {useReviewStore} from '@/stores/review';
import {useRouter} from "vue-router";

const router = useRouter();
const store = useVideoStore();
const reviewstore = useReviewStore();

const props = defineProps({
    video: Object,
})

const getVideo = function() {
    // console.log(video.youtubeId);
    router.push({path: `/${props.video.youtubeId}`});
}

</script>

<style scoped>

</style>