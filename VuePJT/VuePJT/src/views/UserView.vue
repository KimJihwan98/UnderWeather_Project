<template>
    <div>
    <RouterView
      :user="user"
      @create-user="createUser"
    />
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";

const router = useRouter();
const user = ref([]);
 
const createUser = (user) => {
  const API_URL = `http://localhost:8080/api/signup`;
  axios({
    url: API_URL,
    method: "POST",
    params: {
      id: user.id,
      password: user.password,
      name: user.name,
    },
  })
    .then(() => {
      alert("등록 완료");
      router.push("/user");
    })
    .catch((err) => {
      console.log(err);
    });
};

</script>

<style>
.user-link {
  color: black;
}

.view {
  width: 80%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  color: #787878;
  font-size: medium;
}

label {
  display: inline-block;
  width: 130px;
}

.btn {
  width: 8%;
  background-color: #d0d3d0;
  color: rgb(80, 82, 79);
  padding: 14px 20px;
  margin: 8px;
  border: 1px solid #787878;
  border-radius: 4px;
  font-size: large;
  cursor: pointer;
}

/* 테이블 CSS */
.user-list {
  border-collapse: collapse;
  width: 100%;
  text-align: center;
  margin: auto;
}

.user-list td,
.user-list th {
  border: 1px solid black;
}
</style>
