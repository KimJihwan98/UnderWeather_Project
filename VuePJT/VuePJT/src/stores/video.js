import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'
import router from '@/router'

const REST_VIDEO_API = `http://localhost:8080/api/Video`;

export const useVideoStore = defineStore('video', () => {
  const videoList = ref([])
  const getVideoList = function() {
    axios.get(`${REST_VIDEO_API}/interest`)
      .then((response) => {
        videoList.value = response.data
      })
  }

  const video = ref({})
  const getVideo = function(youtubeId) {
    axios.get(`${REST_VIDEO_API}/interest`)
      .then((res) => {
        let matchedVideo = res.data.find(
          (v) => {
            return v.youtubeId === youtubeId
          }
        );

        if(matchedVideo) {
          video.value = matchedVideo;
        }
      })
  };

  // const video = ref({})
  // const getVideo = function (youtubeId) {
  //   axios.get(`${REST_VIDEO_API}/${youtubeId}`)
  //     .then((response) => {
  //     video.value = response.data
  //   })
  // }

  


  return { videoList, getVideoList, video, getVideo}
})
