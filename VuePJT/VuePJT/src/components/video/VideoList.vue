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
        <!-- <table>
            <tr>
                <th>유튜브 아이디</th>
                <th>제목</th>
                <th>운동 부위</th>
                <th>채널 이름</th>
                <th>url</th>
                <th>조회수</th>
            </tr>
            <tr v-for="video in store.videoList" :key="video.id">
                <td>{{ video.youtubeId }}</td>
                <td>
                    <RouterLink :to="`/video/${video.youtubeId}`">{{ video.title }}</RouterLink>
                </td>
                <td>{{ video.fitPartName }}</td>
                <td>{{ video.channelName }}</td>
                <td>{{ video.url }}</td>
                <td>{{ video.viewCnt }}</td>
            </tr>
        </table> -->
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