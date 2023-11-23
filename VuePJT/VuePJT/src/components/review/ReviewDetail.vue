<template>
  <div class="ha">
    <div class="reDe"><h2>리뷰 상세</h2></div>
    <hr />
    <fieldset class="reviewDe">
      <div class="card" style="width: 30rem">
        <div class="card-body">
          <!-- <div class="mb-3 d-flex justify-content-between align-items-center"> -->
          <div>
            <h4 class="card-title">
              {{ rstore.review.title }}
            </h4>
          </div>
          <div class="d-flex justify-content-center">
            <h6 class="card-subtitle mx-3 text-body-secondary">
              {{ rstore.review.userId }}
            </h6>
            <h6 class="card-subtitle text-body-secondary">
              {{ rstore.review.regDate }}
            </h6>
          </div>
          <!-- </div> -->
          <p class="card-text">
            {{ rstore.review.content }}
          </p>
          <div class="d-flex justify-content-center">
            <button class="btn" @click="moveUpdate">수정</button>
            <button class="btn" @click="deleteReview">삭제</button>
          </div>
        </div>
      </div>
    </fieldset>
  </div>
</template>

<script setup>
import { useRoute, useRouter } from "vue-router";
import { ref, onMounted } from "vue";
import { useReviewStore } from "@/stores/review";
import axios from "axios";
const route = useRoute();
const router = useRouter();
const rstore = useReviewStore();

onMounted(() => {
  rstore.getReview(route.params.rId);
});

const moveUpdate = function () {
  router.push({ name: `reviewUpdate` });
};

const deleteReview = function () {
  axios
    .delete(`http://localhost:8080/api/Review/${route.params.rId}`)
    .then(() => {
      alert("리뷰가 삭제 되었습니다.");
      router.push({ path: `/${route.params.youtubeId}` });
    })
    .catch(() => {});
};
</script>

<style scoped>
.reDe {
  color: white;
  display: flex;
  justify-content: center;
}
.ha {
  padding: 40px 50px 0 0;
  margin-left: 250px;
}
fieldset {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 150px 0 0 0;
}
.card {
  display: flex;
  align-items: center;
  justify-content: center;
}

.btn {
  background-color: #007bff;
  color: #fff;
  /* padding: 10px 15px; */
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  width: 80px;
}

.card-title {
  padding: 15px 0 15px 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.card-text {
  padding: 28px 0 15px 0;
}
</style>
