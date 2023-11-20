import { createRouter, createWebHistory } from 'vue-router'
import VideoView from '@/views/VideoView.vue'
import VideoList from '@/components/video/VideoList.vue'
import VideoListItem from '@/components/video/VideoListItem.vue'
import VideoDetail from '@/components/video/videoDetail.vue'
import ReviewView from '@/views/ReviewView.vue'
import LoginForm from '@/components/LoginForm.vue'
import UserView from '@/views/UserView.vue'
import UserRegist from '@/components/user/UserRegist.vue'
import ReviewDetail from '@/components/review/ReviewDetail.vue'
import ReviewUpdate from '@/components/review/ReviewUpdate.vue'
import ReviewCreate from '@/components/review/ReviewCreate.vue'
import ReviewList from '@/components/review/ReviewList.vue'
import ProductList from '@/components/product/ProductList.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'video',
      component: VideoView,
      children: [
        {
          path: "",
          name: "videoList",
          component: VideoList
        },
        {
          path: "",
          name: "videoListItem",
          component: VideoListItem
        },
      ]
    },
    {
      path: "/:youtubeId",
      name: "videoDetail",
      component: VideoDetail,
      children: [
        {
          path: 'product',
          name: 'product',
          component: ProductList
        },
        {
          path: 'reviewlist',
          name: 'reviewList',
          component: ReviewList
        },
      ]
    },
    {
      path: '/review',
      name: 'review',
      component: ReviewView
    },
    {
      path: '/review/:youtubeId/:rId',
      name: 'reviewDetail',
      component: ReviewDetail
    },
    {
      path: '/review/:youtubeId/:rId/update',
      name: 'reviewUpdate',
      component: ReviewUpdate
    },
    {
      path: '/review/:youtubeId/create',
      name: 'reviewCreate',
      component: ReviewCreate
    },
    {
      path: '/login',
      name: 'login',
      component: LoginForm
    },
    {
      path: "/user",
      name: 'user',
      component: UserView,
      children: [
        {
          path: "regist",
          name: "Regist",
          component: UserRegist,
        },
      ],
    },
    
  ],
});

export default router
