package com.joolun.cloud.weixin.mp.handler;

import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.stereotype.Component;
import java.util.Map;

/**
 * 卡券领取
 * @author JL
 */
@Component
public class UserGetCardHandler extends AbstractHandler {

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage,
                                    Map<String, Object> context, WxMpService wxMpService,
                                    WxSessionManager sessionManager) {

		//TODO 组装回复消息
        String content = "卡券【"+wxMessage.getUserCardCode()+"】领取成功";
		return null;
    }

}