/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package com.joolun.cloud.common.sms.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;

/**
 * 短信模块配置
 *
 * @author
 */
@Data
@RefreshScope
@Configuration
@ConfigurationProperties(prefix = "sms.templates")
public class SmsTemplateProperties {

	/**
	 * #登录模块
	 */
	private String signName1 = "signName1";
	private String templateCode1 = "templateCode1";
	/**
	 * #绑定模块
	 */
	private String signName2 = "signName2";
	private String templateCode2 = "templateCode2";
	/**
	 * #解绑模块
	 */
	private String signName3 = "signName3";
	private String templateCode3 = "templateCode3";
	/**
	 * #盈联易单配用户下单成功提醒
	 */
	private String signName4 = "signName4";
	private String templateCode4 = "templateCode4";
	/**
	 * #盈联易单配商家入驻申请提醒
	 */
	private String signName5 = "signName5";
	private String templateCode5 = "templateCode5";
	/**
	 * #盈联易单配商家库存不足通知
	 */
	private String signName6 = "signName6";
	private String templateCode6 = "templateCode6";

}
