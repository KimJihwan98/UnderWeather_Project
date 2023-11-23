<template>
    <li>
      <img
        class="image"
        :src="`/assets/images/${sport}.png`"
      />
      <hr />
      <br />
    </li>
  </template>
  
  <script setup>
  import { useSportStore } from "@/stores/sport";
  import { useRouter } from "vue-router";
  
  const router = useRouter();
  const sstore = useSportStore();
  
  const props = defineProps({
    sport: String,
  });
  
  </script>
  
  <style scoped>
  .image {
    width: 100%;
    height: 100%;
  }
  </style>
  