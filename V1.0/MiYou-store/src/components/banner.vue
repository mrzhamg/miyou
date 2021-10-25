<template>
  <div class="banner">
    <ul>
      <li>
        <a href="">
          <img :src="`http://localhost:8082`+bannerList[bannerList.length-1].img"
               alt="">
        </a>
      </li>
      <li v-for="item in bannerList"
          :key="item.index">
        <a href="#">
          <img :src="`http://localhost:8082`+item.img"
               alt="">
        </a>
      </li>
      <li>
        <a href="">
          <img :src="`http://localhost:8082`+bannerList[0].img"
               alt="">
        </a>
      </li>

    </ul>
    <div class="b-left"
         @click="leftBtn">
      <div></div>
    </div>
    <div class="b-right"
         @click="rightBtn">
      <div></div>
    </div>
    <!-- 焦点开始 -->
    <ul>
      <li>1</li>
      <li>2</li>
      <li>3</li>
      <li>4</li>
      <li>5</li>
    </ul>
    <!-- 焦点结束 -->
  </div>
</template>

<script>
import { getRequst } from '../../uilts/api'
export default {
  name: 'Banner',
  data () {
    return {
      bannerList: '',
      left_i: 1
    }
  },
  created () {
    this.getBanner()
  },
  methods: {
    // 获取banner
    async getBanner () {
      const bannerlist = await getRequst('/findBannerAll')
      this.bannerList = bannerlist
      console.log(bannerlist)
    },

    // 左边按钮
    leftBtn () {
      const lBtn = document.querySelector('.banner>ul:nth-child(1)')
      // this.left_i++
      // if (this.left_i <= 0) {
      //   this.left_i = (this.bannerList.length)
      //   lBtn.style.transition = ''
      //   lBtn.style.transform = `translateX(${-826 * this.left_i}px)`
      // } else {
      this.left_i--
      if (this.left_i <= -1) {
        this.left_i = (this.bannerList.length - 1)
        lBtn.style.transform = `translateX(${-826 * this.left_i}px)`
      } else {
        lBtn.style.transition = 'transform 0.5s'
        lBtn.style.transform = `translateX(${-826 * this.left_i}px)`
      }

      console.log(lBtn, this.left_i, -826 * this.left_i)
    },
    // 右边按钮
    rightBtn () {
      const lBtn = document.querySelector('.banner>ul:nth-child(1)')
      this.left_i++
      if (this.left_i >= (this.bannerList.length + 1)) {
        this.left_i = 1
        lBtn.style.transition = 'transform 0.5s'
        lBtn.style.transform = `translateX(${-826 * this.left_i}px)`
      } else {
        lBtn.style.transition = 'transform 0.5s'
        lBtn.style.transform = `translateX(${-826 * this.left_i}px)`
      }
      // if (this.left_i <= -(this.bannerList.length)) {
      //   this.left_i = 0
      // } else {
      //   this.left_i--
      // }
      // lBtn.style.transform = `translateX(${826 * this.left_i}px)`
      console.log('right', 1290 * this.left_i)
    }
  }
}
</script>

<style lang="less">
@base-size: 50;
@2rem: 2rem;
.banner {
  position: relative;
  margin: 0 auto;
  width: ((1290 * @2rem) / @base-size);
  height: ((600 * @2rem) / @base-size);
  overflow: hidden;
  background-color: aqua;
  &:hover .b-left {
    opacity: 1;
  }
  &:hover .b-right {
    opacity: 1;
  }
  ul:nth-child(1) {
    width: (((1290 * 5) * @2rem) / @base-size);
    height: 100%;
    display: flex;
    transform: translateX(-826px);
    // transition: transform 0.5s;
    background-color: rgb(21, 129, 223);
    li {
      width: ((1290 * @2rem) / @base-size);
      height: 100%;
      a {
        img {
          width: 100%;
          height: 100%;
        }
      }
    }
  }
  .b-left {
    position: absolute;
    left: 0;
    top: 50%;
    margin: -5% 0;
    width: ((50 * @2rem) / @base-size);
    height: ((80 * @2rem) / @base-size);
    background-color: rgb(250, 93, 45);
    border-top-right-radius: 35px;
    border-bottom-right-radius: 35px;
    z-index: 9999;
    display: flex;
    justify-content: center;
    align-items: center;
    // display: none;
    opacity: 0;
    &::before {
      content: "";
      display: inline-block;
      width: ((25 * @2rem) / @base-size);
      height: ((25 * @2rem) / @base-size);
      border-top: 3px solid white;
      border-left: 3px solid white;
      transform: rotate(-45deg);
      // background-color: #f4f4f4;
    }
  }
  .b-right {
    position: absolute;
    right: 0;
    top: 50%;
    margin: -5% 0;
    width: ((50 * @2rem) / @base-size);
    height: ((80 * @2rem) / @base-size);
    background-color: rgb(250, 93, 45);
    border-top-left-radius: 35px;
    border-bottom-left-radius: 35px;
    z-index: 9999;
    display: flex;
    justify-content: center;
    align-items: center;
    opacity: 0;
    &::before {
      content: "";
      display: inline-block;
      width: ((25 * @2rem) / @base-size);
      height: ((25 * @2rem) / @base-size);
      border-top: 3px solid white;
      border-left: 3px solid white;
      transform: rotate(135deg);
      // background-color: #f4f4f4;
    }
  }
}
</style>
