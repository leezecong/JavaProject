/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package com.joolun.cloud.mall.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.joolun.cloud.mall.common.enums.OrderInfoEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import io.swagger.annotations.ApiModel;

/**
 * 商城订单
 *
 * @author JL
 * @date 2019-09-10 15:21:22
 */
@Data
@TableName("order_info")
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "商城订单")
public class OrderInfo extends Model<OrderInfo> {
  private static final long serialVersionUID = 1L;

    /**
   * PK
   */
    @TableId(type = IdType.UUID)
    private String id;
    /**
   * 所属租户
   */
    private String tenantId;
    /**
   * 逻辑删除标记（0：显示；1：隐藏）
   */
    private String delFlag;
    /**
   * 创建时间
   */
    private LocalDateTime createTime;
    /**
   * 最后更新时间
   */
    private LocalDateTime updateTime;
	/**
	 * 应用ID
	 */
	private String appId;
    /**
   * 用户id
   */
    private String userId;
    /**
   * 订单单号
   */
    private String orderNo;
    /**
   * 销售总金额
   */
    private BigDecimal salesPrice;
    /**
   * 物流金额
   */
    private BigDecimal logisticsPrice;
    /**
   * 付款方式1、微信支付
   */
    private String paymentType;
    /**
   * 支付金额
   */
    private BigDecimal paymentPrice;
    /**
   * 付款时间
   */
    private LocalDateTime paymentTime;
    /**
   * 发货时间
   */
    private LocalDateTime deliveryTime;
    /**
   * 收货时间
   */
    private LocalDateTime receiverTime;
    /**
   * 成交时间
   */
    private LocalDateTime closingTime;
    /**
   * 备注
   */
    private String remark;
    /**
   * 状态0、待付款 1、待发货 2、待收货 3、已完成 4、已关闭
   */
    private String status;
	/**
	 * 状态0、待付款 1、待发货 2、待收货 3、已完成 4、已关闭
	 */
	@TableField(exist = false)
	private String statusDesc;

	public String getStatusDesc() {
		if(this.status == null){
			return null;
		}
		return OrderInfoEnum.valueOf(OrderInfoEnum.STATUS_PREFIX + "_" + this.status).getDesc();
	}

	/**
	 *买家留言
	 */
	private String userMessage;
	/**
	 * 物流id
	 */
	private String logisticsId;
	/**
	 * 支付交易ID
	 */
	private String transactionId;
	/**
	 * 订单详情
	 */
	@TableField(exist = false)
	private List<OrderItem> listOrderItem;
	/**
	 * 订单物流
	 */
	@TableField(exist = false)
	private OrderLogistics orderLogistics;
	/**
	 * 物流商家
	 */
	@TableField(exist = false)
	private String logistics;
	/**
	 * 物流单号
	 */
	@TableField(exist = false)
	private String logisticsNo;
}