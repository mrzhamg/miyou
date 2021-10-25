<template>
  <div class="app-box">
    <MYtop></MYtop>
    <Nav></Nav>
    <div class="view">
      <div>
        <router-view />
      </div>
    </div>

  </div>

</template>

<script>
import MYtop from '../../components/my_top.vue'
import Nav from '../../components/nav.vue'
export default {
  name: 'Index',
  data () {
    return {
      activeIndex: '1',
      activeIndex2: '1'
    }
  },
  components: {
    MYtop,
    Nav
  },
  methods: {
    handleSelect (key, keyPath) {
      // console.log(key, keyPath)
    }
  }
}
</script>

<style lang="less">
@base-size: 50;
@2rem: 2rem;
.app-box {
  // background-color: #42b983;
  .view {
    width: 100%;
    margin: 0 auto;
    & > div {
      width: ((1290 * @2rem) / @base-size);
      margin: 0 auto;
    }
  }
  #nav {
    // padding: 30px;

    a {
      font-weight: bold;
      color: #2c3e50;

      &.router-link-exact-active {
        color: #42b983;
      }
    }
  }
}
</style>
