<template>
  <div class="container1">
    <div class="box">
      <fieldset class="text-center">
        <h3>리뷰 작성</h3>
        <input
          type="text"
          id="id"
          v-model="review.title"
          class="view"
          placeholder="제목"
        /><br />
        <input
          type="text"
          id="password"
          v-model="review.userId"
          class="view"
          placeholder="작성자 ID"
          height="200"
        /><br />
        <textarea
          type="text"
          id="name"
          v-model="review.content"
          class="view"
          placeholder="내용"
        /><br />

        <button class="btn" @click="regist">등록</button>
        <div class="tabb">
          <RouterLink
            class="nav-link"
            :class="reviewlist"
            :to="{ name: 'reviewList' }"
            >리뷰 목록</RouterLink
          >
        </div>
      </fieldset>
    </div>

    <hr />
    <div class="weather">
      <WeatherForecast />
    </div>
  </div>
  <div class="container">
    <div class="text-center"></div>

    <RouterView />
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useReviewStore } from "@/stores/review";
import { useRoute } from "vue-router";
import WeatherForecast from "@/components/weather/WeatherForecast.vue";

const route = useRoute();
const store = useReviewStore();

const review = ref({
  title: "",
  userId: "",
  content: "",
  youtubeId: `${route.params.youtubeId}`,
});

const createReview = function () {
  store.createReview(review.value);
};
</script>

<style scoped>
#name {
  height: 200px;
}
.tabb {
  padding: 0 0 0 380px;
}
h3 {
  color: white;
}
fieldset {
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 20px;
  width: 500px;
  margin-left: 250px;
}
.page {
  display: flex;
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
.box {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: auto;
}
.container1 {
  display: flex;
}

.nav-link {
  color: white;
  padding: 5 0 0 5;
}
</style>
