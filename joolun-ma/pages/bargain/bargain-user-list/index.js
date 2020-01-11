/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
const util = require('../../../utils/util.js')
const app = getApp()

Page({
  data: {
    page: {
      searchCount: false,
      current: 1,
      size: 10,
      ascs: '',//升序字段
      descs: 'create_time'
    },
    parameter: {
      
    },
    loadmore: true,
    bargainUserList: []
  },
  onShow() {
    
  },
  onLoad: function (options) {
    app.initPage()
      .then(res => {
        this.bargainUserPage()
      })
  },
  bargainUserPage() {
    app.api.bargainUserPage(Object.assign(
      {},
      this.data.page,
      util.filterForm(this.data.parameter)
    ))
      .then(res => {
        let bargainUserList = res.data.records
        this.setData({
          bargainUserList: [...this.data.bargainUserList, ...bargainUserList]
        })
        if (bargainUserList.length < this.data.page.size) {
          this.setData({
            loadmore: false
          })
        }
      })
  },
  onReachBottom() {
    if (this.data.loadmore) {
      this.setData({
        ['page.current']: this.data.page.current + 1
      })
      this.bargainUserPage()
    }
  },
  refresh(){
    this.setData({
      loadmore: true,
      bargainUserList: [],
      ['page.current']: 1
    })
    this.bargainUserPage()
  },
  onPullDownRefresh() {
    // 显示顶部刷新图标
    wx.showNavigationBarLoading()
    this.refresh()
    // 隐藏导航栏加载框
    wx.hideNavigationBarLoading()
    // 停止下拉动作
    wx.stopPullDownRefresh()
  }
})