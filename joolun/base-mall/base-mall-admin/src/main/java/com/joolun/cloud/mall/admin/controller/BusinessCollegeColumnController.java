/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package com.joolun.cloud.mall.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.joolun.cloud.common.core.util.R;
import com.joolun.cloud.common.log.annotation.SysLog;
import com.joolun.cloud.mall.common.entity.BusinessCollegeColumn;
import com.joolun.cloud.mall.admin.service.BusinessCollegeColumnService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 商学院专栏表
 *
 * @author zq
 * @date 2020-11-03 16:07:16
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/businesscollegecolumn")
@Api(value = "businesscollegecolumn", tags = "商学院专栏表管理")
public class BusinessCollegeColumnController {

    private final BusinessCollegeColumnService businessCollegeColumnService;

    /**
     * 分页列表
     * @param page 分页对象
     * @param businessCollegeColumn 商学院专栏表
     * @return
     */
    @ApiOperation(value = "分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ato.hasAuthority('mall:businesscollegecolumn:index')")
    public R getPage(Page page, BusinessCollegeColumn businessCollegeColumn) {
        return R.ok(businessCollegeColumnService.page(page, Wrappers.query(businessCollegeColumn)));
    }

    /**
     * 商学院专栏表查询
     * @param id
     * @return R
     */
    @ApiOperation(value = "商学院专栏表查询")
    @GetMapping("/{id}")
    @PreAuthorize("@ato.hasAuthority('mall:businesscollegecolumn:get')")
    public R getById(@PathVariable("id") String id) {
        return R.ok(businessCollegeColumnService.getById(id));
    }

    /**
     * 商学院专栏表新增
     * @param businessCollegeColumn 商学院专栏表
     * @return R
     */
    @ApiOperation(value = "商学院专栏表新增")
    @SysLog("新增商学院专栏表")
    @PostMapping
    @PreAuthorize("@ato.hasAuthority('mall:businesscollegecolumn:add')")
    public R save(@RequestBody BusinessCollegeColumn businessCollegeColumn) {
        return R.ok(businessCollegeColumnService.save(businessCollegeColumn));
    }

    /**
     * 商学院专栏表修改
     * @param businessCollegeColumn 商学院专栏表
     * @return R
     */
    @ApiOperation(value = "商学院专栏表修改")
    @SysLog("修改商学院专栏表")
    @PutMapping
    @PreAuthorize("@ato.hasAuthority('mall:businesscollegecolumn:edit')")
    public R updateById(@RequestBody BusinessCollegeColumn businessCollegeColumn) {
        return R.ok(businessCollegeColumnService.updateById(businessCollegeColumn));
    }

    /**
     * 商学院专栏表删除
     * @param id
     * @return R
     */
    @ApiOperation(value = "商学院专栏表删除")
    @SysLog("删除商学院专栏表")
    @DeleteMapping("/{id}")
    @PreAuthorize("@ato.hasAuthority('mall:businesscollegecolumn:del')")
    public R removeById(@PathVariable String id) {
        return R.ok(businessCollegeColumnService.removeById(id));
    }

}
