<template>
  <div class="orders-box">
    <el-table :data="tableData" border style="width: 100%" :fit="true">
      <el-table-column fixed label="用户信息" min-width="90">
        <template slot-scope="scope">
          <p>
            <span>用户ID：{{scope.row.user.uid}}</span>
          </p>
          <p>
            用户昵称：
            <span>{{scope.row.user.name}}</span>
          </p>
          <p>用户电话：{{scope.row.user.phone}}</p>
        </template>
      </el-table-column>
      <el-table-column fixed label="下单日期" min-width="100">
        <template slot-scope="scope">
          <p>
            <span>{{scope.row.date}}</span>
          </p>
          <p>
            订单ID：
            <span>{{scope.row.oid}}</span>
          </p>
        </template>
      </el-table-column>
      <el-table-column fixed label="商品信息" min-width="150">
        <template slot-scope="scope">
          <div class="sp-xx">
            <div>
              <img :src="'http://localhost:8082/'+scope.row.imgurl" alt />
            </div>
            <div>
              <p>
                店铺：
                <span class="sp-g">{{scope.row.dpname}}</span>
              </p>
              <p>
                描述：
                <span class="sp-g">{{scope.row.goods_ms}}</span>
              </p>
              <p>
                单价：
                <span class="sp-g">{{scope.row.price}}</span>
              </p>
              <p>
                数量：
                <span class="sp-g">{{scope.row.num}}</span>
              </p>
              <p>
                总价：
                <span class="sp-r">{{scope.row.num*scope.row.price}}</span>
              </p>
            </div>
          </div>
        </template>
      </el-table-column>

      <el-table-column fixed label="收货地址" min-width="150">
        <template slot-scope="scope">
          <div class="address">
            <p>
              收件人：
              <span>{{scope.row.sjr_name}}</span>
            </p>
            <p>
              收件人电话：
              <span>{{scope.row.sjr_phone}}</span>
            </p>
            <p>
              收件地址：
              <span>{{scope.row.address}}</span>
            </p>
          </div>
        </template>
      </el-table-column>
      <el-table-column fixed label="快递单号">
        <template slot-scope="scope">
          <div class="kdd">
            <p>{{scope.row.kuaidi}}</p>
          </div>
        </template>
      </el-table-column>
      <el-table-column fixed label="状态" min-width="40">
        <template slot-scope="scope">
          <div>{{scope.row.isfahuo ? "已发货":"未发货"}}</div>
        </template>
      </el-table-column>
      <el-table-column fixed="right" label="操作" min-width="50">
        <template slot-scope="scope">
          <el-button v-if="!scope.row.isfahuo" type="text" @click="fahuo(scope.row.oid)">发货</el-button>
          <el-button type="text" @click="bianji(scope)">编辑</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 快递单表 -->
    <el-dialog title="填写快递单号" :visible.sync="dialogFormVisible1">
      <el-form>
        <el-form-item label="订单id" :label-width="formLabelWidth">
          <el-input v-model="oid" disabled></el-input>
        </el-form-item>
        <el-form-item label="快递单号" :label-width="formLabelWidth">
          <el-input v-model="kuaidiNO" placeholder="请输入快递单号"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible1 = false,kuaidiNO = ''">取 消</el-button>
        <el-button type="primary" @click="putKuiDiDan(oid,kuaidiNO)">确 定</el-button>
      </div>
    </el-dialog>
    <!-- 快递单表end -->

    <!-- 修改订单信息 -->
    <el-dialog title="修改订单信息" :visible.sync="dialogFormVisible2">
      <el-form :model="order" status-icon :rules="rules" ref="order" label-width="100px" class="demo-ruleForm">
        <el-form-item label="订单id" prop="oid" :rules="rules.oid">
          <el-input type="name" v-model="order.oid" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="收件人" prop="sjr_name" :rules="rules.name">
          <el-input type="name" v-model="order.sjr_name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="收件人电话" prop="sjr_phone" :rules="rules.phone">
          <el-input type="text" v-model="order.sjr_phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="收件地址" prop="address" :rules="rules.address">
          <el-input type="text" v-model.number="order.address"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('order')">提交</el-button>
          <el-button @click="resetForm('order')">重置</el-button>
          <el-button @click="dialogFormVisible2 = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <!-- 修改订单信息end -->
  </div>
</template>

<script>
import { getRequst, postRequst } from '../../../uilts/api'
export default {
  data () {
    return {
      formLabelWidth: '120px',
      tableData: [],
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      oid: '',
      kuaidiNO: '',
      order: {
        oid: '',
        sjr_name: '',
        sjr_phone: '',
        address: ''
      },
      rules: {
        name: [
          { required: true, message: '收件人不能为空！', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '收件人电话不能为空！', trigger: 'blur' }
        ],
        address: [
          { required: true, message: '收货地址不能为空！', trigger: 'blur' }
        ]
      }
    }
  },
  created () {
    this.getOrder()
  },
  methods: {
    // 获取订单信息
    async getOrder () {
      const sjtoken = sessionStorage.getItem('sjtoken')
      await getRequst('/getSjOrder', { sjtoken: sjtoken }).then((res) => {
        console.log(res)
        this.tableData = res
      })
    },

    async handleClick (row) {
      console.log(row.oid)
      await getRequst('/deleteOrder', { oid: row.oid }).then((res) => {
        if (res.code === 200) {
          location.reload()
        }
      })
    },
    fahuo (oid) {
      this.dialogFormVisible1 = true
      this.oid = oid
    },
    async putKuiDiDan (oid, kdd) {
      if (oid === '') {
        this.$message.error('订单id不能为空！！！')
      } else if (kdd === '') {
        this.$message.error('快递单号不能为空！！！')
      } else {
        const data = await postRequst('/updataIsFaHuo', { oid: oid, kuaidi: kdd })
        if (data.code === 200) {
          this.dialogFormVisible1 = false
          location.reload()
        }
      }
    },
    // 修改订单信息
    bianji (data) {
      this.dialogFormVisible2 = true
      this.order.oid = data.row.oid
      this.order.sjr_name = data.row.sjr_name
      this.order.sjr_phone = data.row.sjr_phone
      this.order.address = data.row.address
      console.log(this.order)
    },

    // 修改订单
    submitForm (formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          await postRequst('/updataOrder', this.order)
          this.dialogFormVisible2 = false
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    resetForm (formName) {
      this.$refs[formName].resetFields()
    }
  }
}
</script>

<style lang="less">
.orders-box {
  .sp-xx {
    display: flex;
    & > div:nth-child(1) {
      width: 100px;
      height: 100px;
      img {
        width: 100%;
        height: 100%;
      }
    }
    & > div:nth-child(2) {
      margin-left: 10px;
      p {
        .sp-g {
          font-weight: 700;
          color: gray;
        }
        .sp-r {
          font-weight: 700;
          color: red;
        }
      }
    }
  }
}
</style>
