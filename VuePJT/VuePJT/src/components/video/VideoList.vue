<template>
    <div>
        <h4>영상 목록</h4>
        <hr>
        <div class="container">
            <!-- <div class="text-center">
                <h2 class="my-h2 my-underline">{{ vstore.video.title }}</h2>
            </div> -->
            <ul class="nav nav-tabs">
                <!-- <p>{{ fitPartName }}</p> -->
                <li class="nav-item" @click="changeFitPartName(`전신`)">
                    <a class="nav-link" :class="check1" aria-current="page" href="#">전신</a>
                </li>
                <li class="nav-item" @click="changeFitPartName(`상체`)">
                    <a class="nav-link" :class="check2" href="#">상체</a>
                </li>
                <li class="nav-item" @click="changeFitPartName(`하체`)">
                    <a class="nav-link" :class="check3" href="#">하체</a>
                </li>
                <li class="nav-item" @click="changeFitPartName(`복부`)">
                    <a class="nav-link" :class="check4" href="#">복부</a>
                </li>
            </ul>
        </div>
        <ul>
            <VideoListItem v-for="video in store.videoList" :key="video.youtubeId" :video="video" />
        </ul>
    </div>
</template>

<script setup>
import { useVideoStore } from "@/stores/video";
import VideoListItem from "@/components/video/VideoListItem.vue";
import { onMounted, ref, watch, computed } from "vue";

const store = useVideoStore();

const fitPartName = ref('전신');

const check1 = computed(() => {
    if(fitPartName === '전신') return {active: true}
})
const check2 = computed(() => {
    if(fitPartName === '상체') return {active: true}
})
const check3 = computed(() => {
    if(fitPartName === '하체') return {active: true}
})
const check4 = computed(() => {
    if(fitPartName === '복부') return {active: true}
})

const changeFitPartName = (newName) => {
    fitPartName.value = newName;
}

watch(fitPartName, () => {
    store.getVideoList(fitPartName);
})

onMounted(() => {
    store.getVideoList(fitPartName)
})

</script>

<style scoped></style>