<template>
    <div class="container-up">
      <h4>리뷰 수정</h4>
      <div class="form-floating mb-3">
        <input
          type="text"
          class="form-control"
          id="title"
          placeholder="제목"
          v-model="rstore.review.title"
        />
        <label for="title">Title</label>
      </div>
      <div class="form-floating mb-3">
        <input
          type="text"
          class="form-control"
          id="userId"
          placeholder="작성자"
          readonly
          v-model="rstore.review.userId"
        />
        <label for="userId">작성자</label>
      </div>
      <div class="form-floating mb-3">
        <textarea
          class="form-control"
          id="content"
          placeholder="내용"
          style="height: 200px"
          v-model="rstore.review.content"
        ></textarea>
        <label for="content">Content</label>
      </div>
      <div class="d-flex justify-content-end">
        <button class="btn btn-outline-success mx-3" @click="updateReview">
          수정
        </button>
        <button class="btn btn-outline-danger" @click="backButton">뒤로</button>
      </div>
    </div>
  </template>
  
  <script setup>
  import { useReviewStore } from "@/stores/review";
  import { useRouter, useRoute } from "vue-router";
  const rstore = useReviewStore();
  const router = useRouter();
  const route = useRoute();
  
  const updateReview = function () {
    alert("리뷰가 수정되었습니다.");
    rstore.updateReview(route.params.youtubeId);
  };
  const backButton = function () {
    router.go(-1);
    // router.back();
  };
  </script>
  
  <style scoped>
  .container-up {
    padding: 150px 0 0 190px;
  }
  h4 {
    color: white;
  }
  </style>