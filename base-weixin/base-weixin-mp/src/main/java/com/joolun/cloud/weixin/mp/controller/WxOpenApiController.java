package com.joolun.cloud.weixin.mp.controller;

import com.joolun.cloud.common.core.util.R;
import com.joolun.cloud.weixin.common.constant.WxReturnCode;
import com.joolun.cloud.weixin.mp.config.WxOpenConfiguration;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.open.bean.result.WxOpenAuthorizerInfoResult;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 开发平台API
 * @author JL
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/open/api")
public class WxOpenApiController {

	/**
	 * getAuthorizerInfo
	 * @param appId
	 * @return
	 */
    @GetMapping("/authorizer-info/{appId}")
	@PreAuthorize("@pms.hasPermission('wxmp_wxapp_index')")
    public R getAuthorizerInfo(@PathVariable("appId") String appId){
        try {
            WxOpenAuthorizerInfoResult wxOpenAuthorizerInfoResult = WxOpenConfiguration.getOpenService().getWxOpenComponentService().getAuthorizerInfo(appId);
//			WxOpenAuthorizerInfo wxOpenAuthorizerInfo = wxOpenAuthorizerInfoResult.getAuthorizerInfo();
			return R.ok(wxOpenAuthorizerInfoResult);
        } catch (WxErrorException e) {
			e.printStackTrace();
			log.error("getAuthorizerInfo：", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
        }
    }
}
