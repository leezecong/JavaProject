package com.joolun.cloud.weixin.mp.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.joolun.cloud.common.core.util.R;
import com.joolun.cloud.common.log.annotation.SysLog;
import com.joolun.cloud.weixin.common.constant.WxReturnCode;
import com.joolun.cloud.weixin.mp.entity.WxUserTagsDict;
import com.joolun.cloud.weixin.mp.service.WxUserService;
import com.joolun.cloud.weixin.mp.config.WxMpConfiguration;
import com.joolun.cloud.weixin.common.entity.WxUser;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpUserTagService;
import me.chanjar.weixin.mp.bean.tag.WxUserTag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 微信用户标签
 *
 * @author JL
 * @date 2019-03-25 15:39:39
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/wxusertags")
public class WxUserTagsController {

	private final WxUserService wxUserService;

	/**
	* 获取微信用户标签
	* @return
	*/
	@GetMapping("/list")
	@PreAuthorize("@pms.hasPermission('wxmp_wxusertags_list')")
	public R getWxUserList(String appId) {
		WxMpUserTagService wxMpUserTagService = WxMpConfiguration.getMpService(appId).getUserTagService();
		try {
			List<WxUserTag> listWxUserTag =  wxMpUserTagService.tagGet();
			return R.ok(listWxUserTag);
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("获取微信用户标签失败", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
		}
	}

	/**
	 * 获取微信用户标签字典
	 * @param appId
	 * @return
	 */
	@GetMapping("/dict")
	@PreAuthorize("@pms.hasPermission('wxmp_wxusertags_list')")
	public R getWxUserTagsDict(String appId) {
		WxMpUserTagService wxMpUserTagService = WxMpConfiguration.getMpService(appId).getUserTagService();
		try {
			List<WxUserTag> listWxUserTag =  wxMpUserTagService.tagGet();
			List<WxUserTagsDict> listWxUserTagsDict = new ArrayList<>();
			WxUserTagsDict wxUserTagsDict;
			for(WxUserTag wxUserTag : listWxUserTag){
				wxUserTagsDict = new WxUserTagsDict();
				wxUserTagsDict.setLabel(wxUserTag.getName());
				wxUserTagsDict.setValue(wxUserTag.getId());
				listWxUserTagsDict.add(wxUserTagsDict);
			}
			return R.ok(listWxUserTagsDict);
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("获取微信用户标签字典失败", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
		}
	}

	/**
	 * 新增微信用户标签
	 * @return
	 */
	@SysLog("新增微信用户标签")
	@PostMapping
	@PreAuthorize("@pms.hasPermission('wxmp_wxusertags_add')")
	public R save(@RequestBody JSONObject data){
		String appId = data.getString("appId");
		String name = data.getString("name");
		WxMpUserTagService wxMpUserTagService = WxMpConfiguration.getMpService(appId).getUserTagService();
		try {
			return R.ok(wxMpUserTagService.tagCreate(name));
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("新增微信用户标签失败", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
		}
	}

	/**
	 * 修改微信用户标签
	 * @return
	 */
	@SysLog("修改微信用户标签")
	@PutMapping
	@PreAuthorize("@pms.hasPermission('wxmp_wxusertags_edit')")
	public R updateById(@RequestBody JSONObject data){
		String appId = data.getString("appId");
		Long id = data.getLong("id");
		String name = data.getString("name");
		WxMpUserTagService wxMpUserTagService = WxMpConfiguration.getMpService(appId).getUserTagService();
		try {
			return R.ok(wxMpUserTagService.tagUpdate(id,name));
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("修改微信用户标签失败", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
		}
	}

	/**
	 * 删除微信用户标签
	 * @param id
	 * @param appId
	 * @return
	 */
	@SysLog("删除微信用户标签")
	@DeleteMapping
	@PreAuthorize("@pms.hasPermission('wxmp_wxusertags_del')")
	public R removeById(Long id,String appId){
		List<WxUser> listWxUser = wxUserService.list(new QueryWrapper<WxUser>().eq("app_id", appId).like("tagid_list",id));
		if(listWxUser!=null && listWxUser.size()>0){
			return R.failed("该标签下有用户存在，无法删除");
		}
		WxMpUserTagService wxMpUserTagService = WxMpConfiguration.getMpService(appId).getUserTagService();
		try {
			return  R.ok(wxMpUserTagService.tagDelete(id));
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("删除微信用户标签失败", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
		}
	}
}
