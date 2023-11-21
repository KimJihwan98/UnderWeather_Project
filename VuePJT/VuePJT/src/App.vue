<template>
  <HeaderNav :user="user" @logout="logout" />
  <div class="routers-back">
    <nav class="routers">
      <RouterLink to="/">Video</RouterLink> |
      <RouterLink to="/review">Review</RouterLink> |
      <RouterLink to="/login">LoginPage</RouterLink> |
      <RouterLink to="/login">LoginPage</RouterLink> |
    </nav>
  </div>

  <RouterView @login-user="loginUser" />
</template>

<script setup>
import { RouterLink, RouterView, useRouter } from "vue-router";
import { ref, onMounted } from "vue";
import HeaderNav from "@/components/common/HeaderNav.vue";
import axios from "axios";

const router = useRouter();
const user = ref(null);

onMounted(() => {
  const savedUser = localStorage.getItem("loginUser");
  if (savedUser) {
    user.value = JSON.parse(savedUser);
  }
});

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

      console.log('userList', res);
      let matchedUser = res.data.find(
        (u) => {
          return u.userId === loginUser.userId && u.password === loginUser.password
        }
      );


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
  font-family: Arial, Helvetica, sans-serif;
}

.text-center {
  text-align: center;
}

.container {
  margin: 0px 30px;
}
</style>
