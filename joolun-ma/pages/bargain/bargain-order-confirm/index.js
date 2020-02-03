/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
const app = getApp()

Page({
  data: {
    orderConfirmData: [],
    salesPrice: 0,
    paymentPrice: 0,
    freightPrice: 0,
    userAddress: null,
    orderSubParm: {
      paymentType: '1'
    },
    loading: false
  },
  onShow() {

  },
  onLoad: function () {
    this.userAddressPage()
    // 本地获取参数信息
    let that = this
    wx.getStorage({
      key: 'param-orderConfirm',
      success: function (res) {
        let orderConfirmData = res.data
        let salesPrice = 0 //订单金额
        let freightPrice = 0 //运费
        orderConfirmData.forEach((orderConfirm, index) => {
          salesPrice = (Number(salesPrice) + orderConfirm.salesPrice * orderConfirm.quantity).toFixed(2)
          orderConfirm.paymentPrice = (orderConfirm.salesPrice * orderConfirm.quantity).toFixed(2)
          //计算运费
          let freightTemplat = orderConfirm.freightTemplat
          if (freightTemplat) {
            if (freightTemplat.type == '1') {//模板类型1、买家承担运费
              let quantity = orderConfirm.quantity
              if (freightTemplat.chargeType == '1') {//1、按件数；
                that.countFreight(orderConfirm, freightTemplat, quantity)
              } else if (freightTemplat.chargeType == '2') {//2、按重量
                let weight = orderConfirm.weight
                that.countFreight(orderConfirm, freightTemplat, (weight * quantity).toFixed(2))
              } else if (freightTemplat.chargeType == '3') {//3、按体积
                let volume = orderConfirm.volume
                that.countFreight(orderConfirm, freightTemplat, (volume * quantity).toFixed(2))
              }
            } else {
              orderConfirm.freightPrice = 0
            }
          } else {
            orderConfirm.freightPrice = 0
          }
          freightPrice = (Number(freightPrice) + Number(orderConfirm.freightPrice)).toFixed(2)
        })
        that.setData({
          orderConfirmData: orderConfirmData,
          salesPrice: salesPrice,
          freightPrice: freightPrice,
          paymentPrice: salesPrice
        })
      }
    })
  },
  //计算运费
  countFreight(orderConfirm, freightTemplat, quantity) {
    let firstNum = freightTemplat.firstNum
    let firstFreight = freightTemplat.firstFreight
    let continueNum = freightTemplat.continueNum
    let continueFreight = freightTemplat.continueFreight
    if (quantity <= firstNum) {//首件之内数量
      orderConfirm.freightPrice = firstFreight
    } else {//首件之外数量
      let num = quantity - firstNum
      orderConfirm.freightPrice = (Number(firstFreight) + Math.ceil(num / continueNum) * continueFreight).toFixed(2)
    }
  },
  //获取默认收货地址
  userAddressPage() {
    app.api.userAddressPage(
      {
        searchCount: false,
        current: 1,
        size: 1,
        isDefault: '1'
      })
      .then(res => {
        let records = res.data.records
        if (records && records.length > 0) {
          this.setData({
            userAddress: records[0]
          })
        }
      })
  },
  userMessageInput(e) {
    this.setData({
      [`orderSubParm.userMessage`]: e.detail.value
    })
  },
  //提交订单
  orderSub() {
    let userAddress = this.data.userAddress
    if (userAddress == null) {
      wx.showToast({
        title: '请选择收货地址',
        icon: 'none',
        duration: 2000
      })
      return
    }
    let that = this
    this.setData({
      loading: true
    })
    let orderSubParm = this.data.orderSubParm
    let orderConfirmData = this.data.orderConfirmData
    orderSubParm.skus = orderConfirmData
    orderSubParm.orderType = orderConfirmData[0].orderType
    orderSubParm.relationId = orderConfirmData[0].relationId
    app.api.orderSub(Object.assign(
      {},
      { userAddressId: userAddress.id },
      orderSubParm
    ))
      .then(res => {
        wx.redirectTo({
          url: '/pages/order/order-detail/index?callPay=true&id=' + res.data.id
        })
      }).catch(() => {
        this.setData({
          loading: false
        })
      })
  }
})