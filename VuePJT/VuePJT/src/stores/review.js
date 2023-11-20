import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import router from '@/router'
import axios from 'axios'

const REST_REVIEW_API = `http://localhost:8080/api/Review`
// http://localhost:8080/api/Review?youtubeId=gMaB-fG4u4g
export const useReviewStore = defineStore('review', () => {
  const reviewList = ref([])
  const getReviewList = function (youtubeId) {
    axios.get(`${REST_REVIEW_API}?youtubeId=${youtubeId}`)
      .then((response) => {
      reviewList.value = response.data;
      })
      console.log(reviewList);
  }

  //게시글 한개
  const review = ref({})
  const getReview = function (rId) {
    axios.get(`${REST_REVIEW_API}/${rId}`)
      .then((response) => {
      review.value = response.data
    })
  }

  //리뷰 등록
  const createReview = function (review) {
    axios({
      url: REST_REVIEW_API,
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      data: review,
    })
    .then((res) => {
        console.log(res)
        router.push({ path: `/${review.youtubeId}`})
      })
      .catch((err) => {
      console.log(err)
    })
  }

  const updateReview = function (youtubeId) {
    axios.put(REST_REVIEW_API, review.value)
      .then(() => {
        // console.log(res.data);
      router.push({path: `/${youtubeId}`})
    })
  }

  const searchReviewList = function (searchCondition) {
    axios.get(REST_REVIEW_API, {
      params: searchCondition
    })
      .then((res) => {
        reviewList.value = res.data
    })
  }








  return { reviewList, getReviewList, review, getReview, createReview, updateReview, searchReviewList}
})
