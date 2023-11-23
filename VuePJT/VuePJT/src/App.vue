<template>
    <div class="realmain" :style="{'background-image': `url(/assets/bgImgs/sunny.jpg)`,}">
      <HeaderNav :user="user" @logout="logout" />
      <div class="section">
        <RouterView @login-user="loginUser" />
      </div>
    </div>
</template>

<script setup>
import { RouterLink, RouterView, useRouter } from "vue-router";
import HeaderNav from "@/components/common/HeaderNav.vue";
import axios from "axios";
import { useWeatherStore } from "@/stores/weather";
import { ref, onMounted, watch } from "vue";

const wstore = useWeatherStore();
onMounted(() => {
  wstore.getNowWeather();
  const savedUser = localStorage.getItem("loginUser");
  if (savedUser) {
    user.value = JSON.parse(savedUser);
  }
});

const router = useRouter();
const user = ref(null);

const logout = () => {
  user.value = null;
  //빈칸
  localStorage.removeItem("loginUser");
  alert("로그아웃 되었습니다.");
  router.push("/");
};

const loginUser = (loginUser) => {
  // user 정보 요청 api 주소
  const API_URL = `http://localhost:8080/api/User/list`;

  // axios 요청
  axios
    .get(API_URL)
    .then((res) => {
      console.log("userList", res);
      let matchedUser = res.data.find((u) => {
        return (
          u.userId === loginUser.userId && u.password === loginUser.password
        );
      });

      if (matchedUser) {
        user.value = matchedUser;
        localStorage.setItem("loginUser", JSON.stringify(matchedUser));
        alert("로그인 성공");
        router.push("/");
      } else {
        alert("로그인 실패");
      }
    })
    .catch((err) => {
      console.log(err);
      alert("로그인 실패: 서버 에러");
    });
};
</script>

<style scoped>
@font-face {
  font-family: "BookkMyungjo-Bd";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/BookkMyungjo-Bd.woff2") format("woff2");
  font-weight: 700;
  font-style: normal;
}

.routers-back {
  background-color: rgb(18, 129, 233);
}

.routers {
  text-decoration: none;
  text-align: center;
  color: white;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  font-family: "BookkMyungjo-Bd";
}

.text-center {
  text-align: center;
}

.realmain {
  background-size: cover;
}

.container {
  margin: 0px 30px;
}

.section {
  padding: 0 0 0 200px;
  width: 80%;
}
</style>
