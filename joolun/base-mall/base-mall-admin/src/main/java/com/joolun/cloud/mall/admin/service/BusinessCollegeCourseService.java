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
import com.joolun.cloud.mall.common.dto.CourseDetailDTO;
import com.joolun.cloud.mall.common.entity.BusinessCollegeCourse;

import java.util.List;

/**
 * 商学院课程表
 *
 * @author zq
 * @date 2020-11-03 16:22:39
 */
public interface BusinessCollegeCourseService extends IService<BusinessCollegeCourse> {
	 CourseDetailDTO courseDetail(String courseId,String userId);

	List<CourseDetailDTO> randomCourse(String id);
}
