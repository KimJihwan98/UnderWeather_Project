<template>


    <div class="container">

      <fieldset class="text-center">
        <h3>회원 가입</h3>
        <input type="text" id="id" v-model="userId" class="view" placeholder="아이디"  /><br />
        <input
          type="password"
          id="password"
          v-model="password"
          class="view"
          placeholder="비밀번호"
        /><br />
        <input type="text" id="name" v-model="name" class="view" placeholder="이름"/><br />
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
  <style scoped>
.container{
  width:500;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
}
.btn{
  background-color: #007bff;
  color: #fff;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

.btn:hover {
  background-color: #0056b3;
}
h3{

  color: white;
}
fieldset {
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 20px;
  width: 500px;
  margin-left: 250px;
}
.text-center{
  margin-left: 250px;

}
</style>
  