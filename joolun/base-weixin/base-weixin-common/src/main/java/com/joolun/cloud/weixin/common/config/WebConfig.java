package com.joolun.cloud.weixin.common.config;

import com.joolun.cloud.weixin.common.interceptor.ThirdSessionInterceptor;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * web配置
 */
@Configuration
@AllArgsConstructor
public class WebConfig implements WebMvcConfigurer {
	private final RedisTemplate redisTemplate;

	/**
	 * 拦截器
	 * @param registry
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		/**
		 * 进入ThirdSession拦截器
		 */
		registry.addInterceptor(new ThirdSessionInterceptor(redisTemplate))
				.addPathPatterns("/api/**")//拦截/api/**接口
				.excludePathPatterns("/api/ma/wxuser/login"
						,"/api/ma/orderinfo/notify-order"
						,"/api/ma/orderinfo/notify-logisticsr"
						,"/api/ma/orderrefunds/notify-refunds"
//						,"/api/ma/userinfo"
//						,"/api/ma/goodsspu/{id}"
//						,"/api/ma/goodsspuspec/tree"
//						,"/api/ma/couponinfo/page"
//						,"/api/ma/shoppingcart/count"
//						,"/api/ma/goodsappraises/page"
//						,"/api/ma/ensuregoods/listEnsureBySpuId"
				);//放行接口
	}
}
