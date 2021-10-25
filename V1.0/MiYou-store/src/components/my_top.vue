<template>
  <div class="top-box">
    <div class="my-top">
      <div class="my-logo">
        <div><strong>蜜柚商城</strong></div>
      </div>
      <!-- 搜索框，购物车，登录状态 -->
      <div class="top-right">
        <div class="ss-shopping"><input type="text"
                 class="ss"
                 v-model="searchs"
                 placeholder="请输入搜索内容">
          <div>
            <router-link class="toSearch"
                         :to="'/getSearch?searchs='+this.searchs">
              <i style="color:#ffffff">&#xe63d;</i>
            </router-link>
          </div>
        </div>
        <div class="my-cat"
             @click="toCart"><i>&#xe74b;</i>购物车</div>
        <div class="login">
          <div v-show="!user.name">
            <div class="user-logo">
              <img src="../assets/logo.png"
                   alt="">
            </div>
            <p>未登录</p>
          </div>
          <div v-show="user.name">
            <div class="user-logo">
              <img :src="userimg"
                   alt="">
            </div>
            <p style="text-align:center">{{user.name}}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { getRequst } from '../../uilts/api'
export default {
  name: 'MYtop',
  data () {
    return {
      user: {},
      userimg: '',
      searchs: ''
    }
  },
  created () {
    this.getUser()
    this.getpic()
  },
  methods: {
    // 获取头像
    async getpic () {
      var userimg = await getRequst('/getpic')
      console.log('userimg=>', userimg)
      this.userimg = 'http://localhost:8082' + userimg.bid
    },
    async getUser () {
      await getRequst('/selectusername').then((res) => {
        // console.log(res)
        this.user = res.data.user
      })
    },
    toCart () {
      console.log('购物车')
      this.$router.push('/shopping')
    },
    // 搜索
    search () {
      console.log('搜索', this.searchs)
    }
  }

}
</script>

<style lang="less">
@base-size: 50;
@2rem: 2rem;
.my-top {
  width: ((1290 * @2rem) / @base-size);
  height: ((130 * @2rem) / @base-size);
  margin: 0 auto;
  display: flex;
  // background-color: #42b983;
  .my-logo {
    width: ((200 * @2rem) / @base-size);
    height: 100%;
    background-color: aliceblue;
    div {
      width: ((200 * @2rem) / @base-size);
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
  .top-right {
    flex: 1;
    display: flex;
    align-items: center;
    padding: 0 ((10 * @2rem) / @base-size);
    background-color: aliceblue;
    .ss-shopping {
      flex: 1;
      display: flex;
      height: ((50 * @2rem) / @base-size);
      border: 1px solid #fa0000;
      input {
        flex: 1;
        border-radius: 0;
        border: 0;
        padding: 0 ((15 * @2rem) / @base-size);
        &:focus {
          outline: none;
        }
      }
      div {
        width: ((60 * @2rem) / @base-size);

        background-color: #fa0000;
        .toSearch {
          display: flex;
          justify-content: center;
          align-items: center;
          width: 100%;
          height: 100%;
        }
      }
    }
    .my-cat {
      display: flex;
      justify-content: center;
      align-items: center;
      width: ((150 * @2rem) / @base-size);
      height: ((50 * @2rem) / @base-size);
      margin: 0 ((30 * @2rem) / @base-size);
      border: 1px solid gray;
    }
    .login {
      width: ((100 * @2rem) / @base-size);
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      // background-color: #fa0000;
      .user-logo {
        width: ((50 * @2rem) / @base-size);
        height: ((50 * @2rem) / @base-size);
        border-radius: 50%;
        background-color: white;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
        img {
          width: 100%;
          height: 100%;
        }
      }
      div {
        p {
          font-size: ((12 * @2rem) / @base-size);
        }
      }
    }
  }
  .el-menu-demo {
    width: 90%;
    background-color: #42b983;
  }
}
</style>
