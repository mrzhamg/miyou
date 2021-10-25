import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/index/index.vue'
import Home from '../views/index/Home.vue'
import About from '../views/index/About.vue'
import Login from '../views/index/Login.vue'
import Register from '../views/index/Register.vue'
import Shopping from '../views/index/Shopping.vue'
import Order from '../views/index/Order.vue'

import Goodes from '../views/index/Goodes.vue'
import Search from '../views/index/Search.vue'

// 商家页面
import StoreIndex from '../views/store/storeIndex.vue'
import StoreHome from '../views/store/Home.vue'
import ShopUpload from '../views/store/ShopUpload.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'index',
    component: Index,
    children: [{
      path: '/',
      name: 'Home',
      component: Home
    }, {
      path: '/about',
      name: 'About',
      component: About
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    }, {
      path: '/register',
      name: 'Register',
      component: Register
    }, {
      path: '/shopping',
      name: 'shopping',
      component: Shopping
    }, {
      path: '/order',
      name: 'Order',
      component: Order
    }, {
      path: '/goodes',
      name: 'Goodes',
      component: Goodes
    }, {
      path: '/getSearch',
      name: 'Search',
      component: Search
    }]
  }, {
    path: '/storeIndex',
    name: 'StoreIndex',
    component: StoreIndex,
    children: [{
      path: '/storehome',
      name: 'StoreHome',
      component: StoreHome
    }, {
      path: '/shopUpload',
      name: 'ShopUpload',
      component: ShopUpload
    }]
  }
]

const router = new VueRouter({
  routes
})
// 路由守卫
// router.beforeEach((to, from, next) => {
//   const token = sessionStorage.getItem('token')
//   // console.log(token)
//   if (token || to.path === '/login' || to.path === '/register'||to.path==='/storeIndex') {
//     next()
//   } else {
//     next('/login')
//   }
// })
export default router
