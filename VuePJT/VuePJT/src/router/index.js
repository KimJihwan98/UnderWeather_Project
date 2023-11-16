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
      path: "/:id",
      name: "videoDetail",
      component: VideoDetail
    },
    {
      path: '/review',
      name: 'review',
      component: ReviewView
    },
    {
      path: '/review/:vid/:id',
      name: 'reviewDetail',
      component: ReviewDetail
    },
    {
      path: '/review/:vid/:id/update',
      name: 'reviewUpdate',
      component: ReviewUpdate
    },
    {
      path: '/review/:vid/create',
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