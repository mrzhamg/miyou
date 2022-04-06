<template>
  <div class="home-box">
    <Banner />
    <Shangpin />
  </div>
</template>

<script>
import Banner from '../../components/banner.vue'
import Shangpin from '../../components/shangpin.vue'
export default {
  data () {
    return {
      name: '',
      password: '',
      num1: 0,
      num2: 0,
      sw: true
    }
  },
  components: {
    Banner,
    Shangpin
<<<<<<< HEAD:V1.4.7/MiYou-store/src/views/index/Home.vue
  },
  created () {
  },
  methods: {
  },
  mounted () {
=======
>>>>>>> 91d482ca329adbb28eb5deee5c966946c5794c41:V1.4.2/MiYou-store/src/views/index/Home.vue
  }
}
</script>

<style lang="less">
.home-box {
  background-color: #f4f4f4;
}
</style>
