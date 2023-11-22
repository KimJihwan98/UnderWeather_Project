import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'
import router from '@/router'

export const useSportStore = defineStore('sport', () => {
  const sportList = ref([])
  const getSportList = function(sports) {
    sportList.value = [...sports];
  }


  


  return {sportList, getSportList}
})
