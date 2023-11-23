import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'
import router from '@/router'

const REST_VIDEO_API = `http://localhost:8080/api/Video`;

export const useVideoStore = defineStore('video', () => {
  const videoListGenre = ref([])
  const getVideoListGenre = function(genre) {
    axios.get(`${REST_VIDEO_API}/genre`)
      .then((response) => {
        console.log(response.data);
        videoListGenre.value = response.data;
      })
  }

  const videoListWeather = ref([])
  const getVideoListWeather = function(weather) {
    axios.get(`${REST_VIDEO_API}/read`)
      .then((response) => {
        videoListWeather.value = response.data.filter((v) => v.weather === weather.value);
      })
  }

  const video = ref({})
  const getVideo = function(youtubeId) {
    axios.get(`${REST_VIDEO_API}/read`)
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

  


  return { videoListGenre, getVideoListGenre, videoListWeather, getVideoListWeather, video, getVideo}
})
