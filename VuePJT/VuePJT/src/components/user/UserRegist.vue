<template>
  <div class="container">
    <fieldset class="text-center">
      <h3>회원 가입</h3>
      <input
        type="text"
        id="id"
        v-model="userId"
        class="view"
        placeholder="아이디"
      /><br />
      <input
        type="password"
        id="password"
        v-model="password"
        class="view"
        placeholder="비밀번호"
      /><br />
      <input
        type="text"
        id="name"
        v-model="name"
        class="view"
        placeholder="이름"
      /><br />
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
  if (userId.value === "" || password.value === "" || name.value === "") {
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
<style scoped>
.container {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left: 95px;
  padding: 150px 0 0 0;
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

.btn:hover {
  background-color: #0056b3;
}
h3 {
  color: white;
  padding: 15px 0 0 0;
}
fieldset {
  border: 1px solid #ccc;
  border-radius: 8px;
  width: 500px;
}
</style>
