<template>
  <div>
    <div class="nav-box">
      <el-menu :default-active="$route.path"
               router
               class="el-menu-demo"
               mode="horizontal"
               @select="handleSelect">
        <el-menu-item index="/">首页</el-menu-item>
        <el-submenu index>
          <template slot="title">商品分类</template>
          <el-menu-item v-for="item in classify"
                        :key="item.index"
                        index="">{{item.name}}</el-menu-item>
        </el-submenu>
        <el-menu-item index="/order">我的订单</el-menu-item>

        <el-menu-item index="/login">登录</el-menu-item>
        <el-menu-item index="/register">注册</el-menu-item>
        <el-menu-item index="/about">个人中心</el-menu-item>

      </el-menu>
    </div>
  </div>
</template>

<script>
import { getRequst } from '../../uilts/api'
export default {
  name: 'Nav',
  data () {
    return {
      classify: []
    }
  },
  created () {
    this.getClassify()
  },
  methods: {
    async getClassify () {
      await getRequst('/getClassify').then((res) => {
        this.classify = res
        console.log(res)
      })
    }
  }
}
</script>

<style lang="less">
@2rem: 2rem;
@base-size: 50;
.nav-box {
  width: ((1290 * @2rem) / @base-size);
  margin: 0 auto;
}
</style>
