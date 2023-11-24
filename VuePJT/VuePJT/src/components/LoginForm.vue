<template>
  <div class="login-container">
    <fieldset class="text-center">

      <h3>로그인</h3>
      <input
        type="text"
        id="id"
        v-model="userId"
        class="input-field"
        placeholder="아이디"
      /><br />

      <input
        type="password"
        id="password"
        v-model="password"
        class="input-field"
        placeholder="비밀번호"
      /><br />

      <button class="login-btn" @click="login">로그인</button>
    </fieldset>
  </div>
</template>

<script setup>
import { ref, defineEmits } from "vue";

const userId = ref("");
const password = ref("");
const emit = defineEmits(["login-user"]);

const login = () => {
  let user = {
    userId: userId.value,
    password: password.value,
  };
  emit("login-user", user);
};
</script>

<style scoped>
.login-container {
  display: flex;
  align-items: center;
  justify-content: center;
}

fieldset {
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 20px;
  width: 500px;
}

label {
  display: block;
  margin-bottom: 5px;
}

.input-field {
  width: 100%;
  padding: 8px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.login-btn {
  background-color: #007bff;
  color: #fff;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

.login-btn:hover {
  background-color: #0056b3;
}
.text-center {
  /* align-items: center;
  justify-content: center; */
  margin-left: 250px;

}
h3 {
  color: white;
}
</style>
