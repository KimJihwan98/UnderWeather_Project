<template>
    <div class="container">
      <h2>회원 가입</h2>
      <fieldset class="text-center">
        <label for="id">아이디</label>
        <input type="text" id="id" v-model="userId" class="view" /><br />
        <label for="password">비밀번호</label>
        <input
          type="password"
          id="password"
          v-model="password"
          class="view"
        /><br />
        <label for="name">이름</label>
        <input type="text" id="name" v-model="name" class="view" /><br />
        <button class="btn" @click="regist">등록</button>
      </fieldset>
    </div>
  </template>
  <script setup>
  import { ref } from "vue";
  import { useRouter } from "vue-router";
  
  const router = useRouter();
  const emit = defineEmits(["create-user"]);
  
  const userId = ref("");
  const password = ref("");
  const name = ref("");
  
  const regist = () => {
    if (
      userId.value === "" ||
      password.value === "" ||
      name.value === ""
    ) {
      alert("모든 내용을 입력해주세요");
      return;
    }
  
    const user = {
      userId: userId.value,
      password: password.value,
      name: name.value,
    };
  
    emit("create-user", user);
  };
  </script>
  