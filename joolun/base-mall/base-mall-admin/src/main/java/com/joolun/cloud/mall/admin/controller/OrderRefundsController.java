/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package com.joolun.cloud.mall.admin.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.joolun.cloud.common.core.util.R;
import com.joolun.cloud.common.log.annotation.SysLog;
import com.joolun.cloud.mall.admin.service.OrderRefundsService;
import com.joolun.cloud.mall.common.entity.OrderRefunds;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 退款详情
 *
 * @author JL
 * @date 2019-11-14 16:35:25
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/orderrefunds")
@Api(value = "orderrefunds", tags = "退款详情管理")
public class OrderRefundsController {

    private final OrderRefundsService orderRefundsService;

    /**
     * 分页查询
     * @param page 分页对象
     * @param orderRefunds 退款详情
     * @return
     */
	@ApiOperation(value = "分页查询")
    @GetMapping("/page")
    @PreAuthorize("@ato.hasAuthority('mall:orderrefunds:index')")
    public R getOrderRefundsPage(Page page, OrderRefunds orderRefunds) {
        return R.ok(orderRefundsService.page1(page, orderRefunds));
    }

    /**
     * 通过id查询退款详情
     * @param id
     * @return R
     */
	@ApiOperation(value = "通过id查询退款详情")
    @GetMapping("/{id}")
    @PreAuthorize("@ato.hasAuthority('mall:orderrefunds:get')")
    public R getById(@PathVariable("id") String id) {
        return R.ok(orderRefundsService.getById(id));
    }

    /**
     * 新增退款详情
     * @param orderRefunds 退款详情
     * @return R
     */
	@ApiOperation(value = "新增退款详情")
    @SysLog("新增退款详情")
    @PostMapping
    @PreAuthorize("@ato.hasAuthority('mall:orderrefunds:add')")
    public R save(@RequestBody OrderRefunds orderRefunds) {
        return R.ok(orderRefundsService.save(orderRefunds));
    }

    /**
     * 修改退款详情
     * @param orderRefunds 退款详情
     * @return R
     */
	@ApiOperation(value = "修改退款详情")
    @SysLog("修改退款详情")
    @PutMapping
    @PreAuthorize("@ato.hasAuthority('mall:orderrefunds:edit')")
    public R updateById(@RequestBody OrderRefunds orderRefunds) {
        return R.ok(orderRefundsService.updateById(orderRefunds));
    }

    /**
     * 通过id删除退款详情
     * @param id
     * @return R
     */
	@ApiOperation(value = "通过id删除退款详情")
    @SysLog("删除退款详情")
    @DeleteMapping("/{id}")
    @PreAuthorize("@ato.hasAuthority('mall:orderrefunds:del')")
    public R removeById(@PathVariable String id) {
        return R.ok(orderRefundsService.removeById(id));
    }

	/**
	 * 操作退款
	 * @param orderRefunds 退款详情
	 * @return R
	 */
	@ApiOperation(value = "操作退款")
	@SysLog("操作退款")
	@PutMapping("/doOrderRefunds")
	@PreAuthorize("@ato.hasAuthority('mall:orderinfo:edit')")
	public R doOrderRefunds(@RequestBody OrderRefunds orderRefunds) {
		return R.ok(orderRefundsService.doOrderRefunds(orderRefunds));
	}
}
