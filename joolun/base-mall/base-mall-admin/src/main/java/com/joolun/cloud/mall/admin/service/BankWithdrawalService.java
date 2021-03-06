/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package com.joolun.cloud.mall.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.joolun.cloud.mall.common.entity.BankWithdrawal;

/**
 * 银行提现表
 *
 * @author zq
 * @date 2020-08-21 10:41:42
 */
public interface BankWithdrawalService extends IService<BankWithdrawal> {

    boolean save1(BankWithdrawal bankWithdrawal);
//    /*
//    * 提现结果状态更改
//    * */
//	boolean updateDrawalStatus(BankWithdrawal bankWithdrawal);

	/*
	 * 提现审核结果状态更改
	 * */
	boolean drawalAuditResult(BankWithdrawal bankWithdrawal);
}
