/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码，并且可以商用（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package com.joolun.cloud.weixin.mp.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.joolun.cloud.weixin.common.constant.ConfigConstant;
import com.joolun.cloud.weixin.mp.handler.SubscribeHandler;
import com.joolun.cloud.weixin.mp.service.WxAppService;
import com.joolun.cloud.weixin.mp.service.WxUserService;
import com.joolun.cloud.weixin.mp.mapper.WxUserMapper;
import com.joolun.cloud.weixin.mp.config.WxMpConfiguration;
import com.joolun.cloud.weixin.common.entity.WxApp;
import com.joolun.cloud.weixin.common.entity.WxUser;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpUserService;
import me.chanjar.weixin.mp.api.WxMpUserTagService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import me.chanjar.weixin.mp.bean.result.WxMpUserList;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 微信用户
 *
 * @author JL
 * @date 2019-03-25 15:39:39
 */
@Slf4j
@Service
@AllArgsConstructor
public class WxUserServiceImpl extends ServiceImpl<WxUserMapper, WxUser> implements WxUserService {

	private final WxAppService wxAppService;

	@Override
	public WxUser getByOpenId(String appId, String openId){
		return this.baseMapper.selectOne(Wrappers.<WxUser>lambdaQuery()
				.eq(WxUser::getAppId, appId)
				.eq(WxUser::getOpenId,openId));
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean updateRemark(WxUser entity) throws WxErrorException {
		String id = entity.getId();
		String remark = entity.getRemark();
		String appId = entity.getAppId();
		String openId = entity.getOpenId();
		entity = new WxUser();
		entity.setId(id);
		entity.setRemark(remark);
		super.updateById(entity);
		WxMpUserService wxMpUserService = WxMpConfiguration.getMpService(appId).getUserService();
		wxMpUserService.userUpdateRemark(openId,remark);
		return true;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void tagging(String taggingType,String appId,Long tagId,String[] openIds) throws WxErrorException {
		WxMpUserTagService wxMpUserTagService = WxMpConfiguration.getMpService(appId).getUserTagService();
		WxUser wxUser;
		if("tagging".equals(taggingType)){
			for(String openId : openIds){
				wxUser = this.getByOpenId(appId, openId);
				Long[] tagidList = wxUser.getTagidList();
				List<Long> list = Arrays.asList(tagidList);
				list = new ArrayList<>(list);
				if(!list.contains(tagId)){
					list.add(tagId);
					tagidList = list.toArray(new Long[list.size()]);
					wxUser.setTagidList(tagidList);
					this.updateById(wxUser);
				}
			}
			wxMpUserTagService.batchTagging(tagId,openIds);
		}
		if("unTagging".equals(taggingType)){
			for(String openId : openIds){
				wxUser = this.getByOpenId(appId, openId);
				Long[] tagidList = wxUser.getTagidList();
				List<Long> list = Arrays.asList(tagidList);
				list = new ArrayList<>(list);
				if(list.contains(tagId)){
					list.remove(tagId);
					tagidList = list.toArray(new Long[list.size()]);
					wxUser.setTagidList(tagidList);
					this.updateById(wxUser);
				}
			}
			wxMpUserTagService.batchUntagging(tagId,openIds);
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void synchroWxUser(String appId) throws WxErrorException {
		//先将已关注的用户取关
		WxUser wxUser = new WxUser();
		wxUser.setSubscribe(ConfigConstant.SUBSCRIBE_TYPE_NO);
		this.baseMapper.update(wxUser, Wrappers.<WxUser>lambdaQuery()
				.eq(WxUser::getAppId, appId)
				.eq(WxUser::getSubscribe, ConfigConstant.SUBSCRIBE_TYPE_YES));
		String nextOpenid = null;
		WxMpUserService wxMpUserService = WxMpConfiguration.getMpService(appId).getUserService();
		WxApp wxApp = wxAppService.getById(appId);
		this.recursionGet(wxApp,wxMpUserService,nextOpenid);
	}

	/**
	 * 递归获取
	 * @param nextOpenid
	 */
	void recursionGet(WxApp wxApp,WxMpUserService wxMpUserService,String nextOpenid) throws WxErrorException {
		WxMpUserList userList = wxMpUserService.userList(nextOpenid);
		List<WxUser> listWxUser = new ArrayList<>();
		WxUser wxUser;
		for(String openid : userList.getOpenids()){
			WxMpUser userWxInfo = wxMpUserService.userInfo(openid, null);
			wxUser = this.getByOpenId(wxApp.getId(),openid);
			if(wxUser == null){//用户未存在
				wxUser = new WxUser();
				wxUser.setSubscribeNum(1);
			}
			SubscribeHandler.setWxUserValue(wxApp,wxUser,userWxInfo);
			listWxUser.add(wxUser);
		}
		this.saveOrUpdateBatch(listWxUser);
		if(nextOpenid!=null && userList.getCount()<=10000){
			this.recursionGet(wxApp,wxMpUserService,userList.getNextOpenid());
		}
	}
}