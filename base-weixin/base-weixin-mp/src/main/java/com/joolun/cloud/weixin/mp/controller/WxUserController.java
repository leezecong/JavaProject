package com.joolun.cloud.weixin.mp.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.joolun.cloud.common.core.util.R;
import com.joolun.cloud.common.log.annotation.SysLog;
import com.joolun.cloud.weixin.common.constant.WxReturnCode;
import com.joolun.cloud.weixin.common.entity.WxUser;
import com.joolun.cloud.weixin.mp.service.WxUserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 微信用户
 *
 * @author JL
 * @date 2019-03-25 15:39:39
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/wxuser")
public class WxUserController {

	private final WxUserService wxUserService;

	/**
	* 分页查询
	* @param page 分页对象
	* @param wxUser 微信用户
	* @return
	*/
	@GetMapping("/page")
	@PreAuthorize("@pms.hasPermission('wxmp_wxuser_index')")
	public R getWxUserPage(Page page, WxUser wxUser,String tagId) {
		Wrapper<WxUser> queryWrapper;
		if(StringUtils.isNotBlank(tagId)){
			queryWrapper = new QueryWrapper<>(wxUser).like("tagid_list",tagId);
		}else{
			queryWrapper = new QueryWrapper<>(wxUser);
		}
		return R.ok(wxUserService.page(page,queryWrapper));
	}


	/**
	* 通过id查询微信用户
	* @param id id
	* @return R
	*/
	@GetMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('wxmp_wxuser_get')")
	public R getById(@PathVariable("id") String id){
	return R.ok(wxUserService.getById(id));
	}

	/**
	* 新增微信用户
	* @param wxUser 微信用户
	* @return R
	*/
	@SysLog("新增微信用户")
	@PostMapping
	@PreAuthorize("@pms.hasPermission('wxmp_wxuser_add')")
	public R save(@RequestBody WxUser wxUser){
	return R.ok(wxUserService.save(wxUser));
	}

	/**
	* 修改微信用户
	* @param wxUser 微信用户
	* @return R
	*/
	@SysLog("修改微信用户")
	@PutMapping
	@PreAuthorize("@pms.hasPermission('wxmp_wxuser_edit')")
	public R updateById(@RequestBody WxUser wxUser){
	return R.ok(wxUserService.updateById(wxUser));
	}

	/**
	* 通过id删除微信用户
	* @param id id
	* @return R
	*/
	@SysLog("删除微信用户")
	@DeleteMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('wxmp_wxuser_del')")
	public R removeById(@PathVariable String id){
    return R.ok(wxUserService.removeById(id));
  }

	@SysLog("同步微信用户")
	@PostMapping("/synchron")
	@PreAuthorize("@pms.hasPermission('wxmp_wxuser_synchro')")
	public R synchron(@RequestBody WxUser wxUser){
		try {
			wxUserService.synchroWxUser(wxUser.getAppId());
			return new R<>();
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("同步微信用户失败", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
		}
	}

	/**
	 * 修改微信用户备注
	 * @param wxUser
	 * @return
	 */
	@SysLog("修改微信用户备注")
	@PutMapping("/remark")
	@PreAuthorize("@pms.hasPermission('wxmp_wxuser_edit_remark')")
	public R remark(@RequestBody WxUser wxUser){
		try {
			return R.ok(wxUserService.updateRemark(wxUser));
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("修改微信用户备注失败", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
		}
	}

	/**
	 * 打标签
	 * @param data
	 * @return
	 */
	@PutMapping("/tagid-list")
	@PreAuthorize("@pms.hasPermission('wxmp_wxuser_tagging')")
	public R tagidList(@RequestBody JSONObject data){
		try {
			String appId = data.getString("appId");
			String taggingType = data.getString("taggingType");
			JSONArray tagIdsArray = data.getJSONArray("tagIds");
			JSONArray openIdsArray = data.getJSONArray("openIds");
			String[] openIds = openIdsArray.toArray(new String[0]);
			for(Object tagId : tagIdsArray){
				wxUserService.tagging(taggingType,appId,Long.valueOf(String.valueOf(tagId)),openIds);
			}
			return new R<>();
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("修改微信用户备注失败", e);
			return WxReturnCode.wxErrorExceptionHandler(e);
		}
	}
}
