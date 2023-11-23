<template>
  <header class="header-nav">
      <div>
        <RouterLink to="/" class="logo">UnderWeather</RouterLink>
      </div>
  </header>
</template>

<script setup>
import { computed } from "vue";

const props = defineProps(["user"]);
const emits = defineEmits(["logout"]);

const getUser = computed(() => !!props.user);

const logout = () => {
  emits("logout");
};
</script>

<style>
@font-face {
  font-family: "BookkMyungjo-Bd";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/BookkMyungjo-Bd.woff2")
    format("woff2");
  font-weight: 700;
  font-style: normal;
}

header {
  height: 200px;
  display: flex;
  flex-direction: column;
  text-align: center;
  /* background-color: rgb(192, 197, 184); */
  line-height: 70px;
  padding: 0px 30px;
}

header a {
  margin: 10px;
  text-decoration: none;
  color: white;
}

.header-nav {
  display: flex;
  justify-content: center;
}

.logo {
  display: inline-block;
  font-size: 3rem;

  color: white;
  margin: auto;

  justify-content: center;
}
* {
  font-family: "BookkMyungjo-Bd";
}
</style>
