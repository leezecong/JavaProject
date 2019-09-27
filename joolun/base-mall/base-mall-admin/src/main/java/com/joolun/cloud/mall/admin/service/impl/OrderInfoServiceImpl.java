/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.joolun.com
 * 注意：
 * 本软件为www.joolun.com开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package com.joolun.cloud.mall.admin.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.joolun.cloud.common.core.util.LocalDateTimeUtil;
import com.joolun.cloud.common.data.tenant.TenantContextHolder;
import com.joolun.cloud.mall.admin.config.WxMallConfigProperties;
import com.joolun.cloud.mall.admin.mapper.GoodsSkuSpecValueMapper;
import com.joolun.cloud.mall.admin.service.*;
import com.joolun.cloud.mall.common.constant.MallConstants;
import com.joolun.cloud.mall.common.dto.PlaceOrderDTO;
import com.joolun.cloud.mall.common.entity.*;
import com.joolun.cloud.mall.admin.mapper.OrderInfoMapper;
import com.joolun.cloud.mall.common.enums.OrderLogisticsEnum;
import com.joolun.cloud.mall.common.enums.OrderInfoEnum;
import com.joolun.cloud.mall.common.util.Kuaidi100Util;
import com.joolun.cloud.mall.common.vo.GoodsSkuSpecValueVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * 商城订单
 *
 * @author JL
 * @date 2019-09-10 15:21:22
 */
@Slf4j
@Service
@AllArgsConstructor
public class OrderInfoServiceImpl extends ServiceImpl<OrderInfoMapper, OrderInfo> implements OrderInfoService {

	private final GoodsSkuService goodsSkuService;
	private final GoodsSpuService goodsSpuService;
	private final OrderItemService orderItemService;
	private final GoodsSkuSpecValueMapper goodsSkuSpecValueMapper;
	private final ShoppingCartService shoppingCartService;
	private final OrderLogisticsService orderLogisticsService;
	private final UserAddressService userAddressService;
	private final RedisTemplate<String, String> redisTemplate;
	private final WxMallConfigProperties wxMallConfigProperties;
	private final OrderLogisticsDetailService orderLogisticsDetailService;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean updateById(OrderInfo entity) {
		if(StrUtil.isNotBlank(entity.getLogistics()) && StrUtil.isNotBlank(entity.getLogisticsNo())){//发货。更新快递单号
			entity.setDeliveryTime(LocalDateTime.now());
			OrderLogistics orderLogistics = orderLogisticsService.getOne(Wrappers.<OrderLogistics>lambdaQuery()
					.eq(OrderLogistics::getId,entity.getLogisticsId()));
			//第一次发货调起收到倒计时
			boolean sendRedis = false;
			if(StrUtil.isBlank(orderLogistics.getLogistics()) && StrUtil.isBlank(orderLogistics.getLogisticsNo())){
				sendRedis = true;
			}
			orderLogistics.setLogistics(entity.getLogistics());
			orderLogistics.setLogisticsNo(entity.getLogisticsNo());
			orderLogistics.setStatus(OrderLogisticsEnum.STATUS_1.getValue());
			orderLogisticsService.updateById(orderLogistics);
			//订阅快递100
			String key = wxMallConfigProperties.getLogisticsKey();					//企业授权key
			String company = entity.getLogistics();			//快递公司编码
			String number = entity.getLogisticsNo();	//快递单号
			String phone = orderLogistics.getTelNum();					//手机号
			String callbackurl = StrUtil.format("{}{}{}",wxMallConfigProperties.getNotifyHost(),
					"/mall/api/ma/orderinfo/notify-logisticsr?tenantId="+orderLogistics.getTenantId()+"&logisticsId=",orderLogistics.getId());//回调地址
			String from = "";					//出发地城市
			String to = "";						//目的地城市
			String salt = "";					//加密串
			int resultv2 = 1;					//行政区域解析
			int autoCom = 0;					//单号智能识别
			int interCom = 0;					//开启国际版
			String departureCountry = "";		//出发国
			String departureCom = "";			//出发国快递公司编码
			String destinationCountry = "";		//目的国
			String destinationCom = "";			//目的国快递公司编码

			Kuaidi100Util kuaidi100Util = new Kuaidi100Util(key);
			String result = kuaidi100Util.subscribeData(company, number, from, to, callbackurl, salt, resultv2, autoCom, interCom, departureCountry, departureCom, destinationCountry, destinationCom, phone);
			JSONObject jSONObject = JSONUtil.parseObj(result);
			if(!(Boolean)jSONObject.get("result")){
				log.error("快递订阅失败：returnCode：{}；message：{}",jSONObject.get("returnCode"),jSONObject.get("message"));
				throw new RuntimeException(String.valueOf(jSONObject.get("message")));
			}
			if(sendRedis){
				//加入redis，7天后自动确认收货
				String keyRedis = String.valueOf(StrUtil.format("{}{}:{}",MallConstants.REDIS_ORDER_KEY_STATUS_2, TenantContextHolder.getTenantId(),entity.getId()));
				redisTemplate.opsForValue().set(keyRedis, entity.getOrderNo() , MallConstants.ORDER_TIME_OUT_2, TimeUnit.DAYS);//设置过期时间
			}
		}
		return super.updateById(entity);
	}

	@Override
	public IPage<OrderInfo> page(IPage<OrderInfo> page, Wrapper<OrderInfo> queryWrapper) {
		return baseMapper.selectPage1(page,queryWrapper.getEntity());
	}

	@Override
	public IPage<OrderInfo> page2(IPage<OrderInfo> page, OrderInfo orderInfo) {
		return baseMapper.selectPage2(page,orderInfo);
	}

	@Override
	public OrderInfo getById2(Serializable id) {
		return baseMapper.selectById2(id);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void orderCancel(OrderInfo orderInfo) {
		orderInfo.setStatus(OrderInfoEnum.STATUS_5.getValue());
		//回滚库存
		List<OrderItem> listOrderItem = orderItemService.list(Wrappers.<OrderItem>lambdaQuery()
				.eq(OrderItem::getOrderId,orderInfo.getId()));
		//！注意，这种库存操作会有并发问题，导致库存不准确。如对库存要求很精确，需单独新建库存表
		listOrderItem.forEach(orderItem -> {
			GoodsSku goodsSku = goodsSkuService.getById(orderItem.getSkuId());
			goodsSku.setStock(goodsSku.getStock() + orderItem.getQuantity());
			goodsSkuService.updateById(goodsSku);
		});
		baseMapper.updateById(orderInfo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void orderReceive(OrderInfo orderInfo) {
		orderInfo.setStatus(OrderInfoEnum.STATUS_3.getValue());
		orderInfo.setReceiverTime(LocalDateTime.now());
		baseMapper.updateById(orderInfo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean removeById(Serializable id) {
		orderItemService.remove(Wrappers.<OrderItem>lambdaQuery()
				.eq(OrderItem::getOrderId,id));//删除订单详情
		return super.removeById(id);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public OrderInfo orderSub(PlaceOrderDTO placeOrderDTO) {
		OrderInfo orderInfo = new OrderInfo();
		orderInfo.setAppId(placeOrderDTO.getAppId());
		orderInfo.setUserId(placeOrderDTO.getUserId());
		orderInfo.setPaymentType(placeOrderDTO.getPaymentType());
		orderInfo.setUserMessage(placeOrderDTO.getUserMessage());
		orderInfo.setStatus(OrderInfoEnum.STATUS_0.getValue());
		orderInfo.setOrderNo(IdUtil.getSnowflake(0,0).nextIdStr());
		orderInfo.setSalesPrice(new BigDecimal(0));
		orderInfo.setLogisticsPrice(new BigDecimal(0));
		List<OrderItem> listOrderItem = new ArrayList<>();
		List<GoodsSku> listGoodsSku = new ArrayList<>();
		placeOrderDTO.getSkus().forEach(placeOrderSkuDTO -> {//过滤
			GoodsSku goodsSku = goodsSkuService.getOne(Wrappers.<GoodsSku>lambdaQuery()
					.eq(GoodsSku::getSpuId,placeOrderSkuDTO.getSpuId())
					.eq(GoodsSku::getId,placeOrderSkuDTO.getSkuId())
					.ge(GoodsSku::getStock,placeOrderSkuDTO.getQuantity())
					.eq(GoodsSku::getEnable,Boolean.TRUE.toString()));
			if(goodsSku != null){
				GoodsSpu goodsSpu = goodsSpuService.getOne(Wrappers.<GoodsSpu>lambdaQuery()
						.eq(GoodsSpu::getId,goodsSku.getSpuId())
						.eq(GoodsSpu::getShelf, MallConstants.SPU_SHELF_0));
				if(goodsSpu != null){
					OrderItem orderItem = new OrderItem();
					orderItem.setOrderId(orderInfo.getId());
					orderItem.setSpuId(goodsSpu.getId());
					orderItem.setSkuId(goodsSku.getId());
					orderItem.setSpuName(goodsSpu.getName());
					orderItem.setPicUrl(StrUtil.isNotBlank(goodsSku.getPicUrl()) ? goodsSku.getPicUrl() : goodsSpu.getPicUrls()[0]);
					orderItem.setQuantity(placeOrderSkuDTO.getQuantity());
					orderItem.setSalesPrice(goodsSku.getSalesPrice());
					List<GoodsSkuSpecValueVO> listGoodsSkuSpecValue = goodsSkuSpecValueMapper.listGoodsSkuSpecValueVoBySkuId(goodsSku.getId());
					listGoodsSkuSpecValue.forEach(goodsSkuSpecValueVO -> {
						String specInfo = orderItem.getSpecInfo();
						specInfo = StrUtil.isNotBlank(specInfo) ? specInfo : "";
						orderItem.setSpecInfo(specInfo
								+ goodsSkuSpecValueVO.getSpecValueName()
								+  "，" );
					});
					String specInfo = orderItem.getSpecInfo();
					if(StrUtil.isNotBlank(specInfo)){
						orderItem.setSpecInfo(specInfo.substring(0,specInfo.length() - 1));
					}
					listOrderItem.add(orderItem);
					orderInfo.setSalesPrice(orderInfo.getSalesPrice().add(goodsSku.getSalesPrice().multiply(new BigDecimal(placeOrderSkuDTO.getQuantity()))));
					goodsSku.setStock(goodsSku.getStock() - placeOrderSkuDTO.getQuantity());
					listGoodsSku.add(goodsSku);
					shoppingCartService.remove(Wrappers.<ShoppingCart>lambdaQuery()
							.eq(ShoppingCart::getSpuId,goodsSpu.getId())
							.eq(ShoppingCart::getSkuId,goodsSku.getId())
							.eq(ShoppingCart::getUserId,placeOrderDTO.getUserId()));//删除购物车
				}
			}
		});
		if(listOrderItem.size() > 0 && listGoodsSku.size()>0){
			UserAddress userAddress = userAddressService.getById(placeOrderDTO.getUserAddressId());
			OrderLogistics orderLogistics = new OrderLogistics();
			orderLogistics.setPostalCode(userAddress.getPostalCode());
			orderLogistics.setUserName(userAddress.getUserName());
			orderLogistics.setTelNum(userAddress.getTelNum());
			orderLogistics.setAddress(userAddress.getProvinceName()+userAddress.getCityName()+userAddress.getCountyName()+userAddress.getDetailInfo());
			orderLogisticsService.save(orderLogistics);//新增订单物流
			orderInfo.setLogisticsId(orderLogistics.getId());
			orderInfo.setPaymentPrice(orderInfo.getSalesPrice().add(orderInfo.getLogisticsPrice()));
			super.save(orderInfo);//保存订单
			listOrderItem.forEach(orderItem -> orderItem.setOrderId(orderInfo.getId()));
			orderItemService.saveBatch(listOrderItem);//保存订单详情
			//！注意，这种库存操作会有并发问题，导致库存不准确。如对库存要求很精确，需单独新建库存表
			goodsSkuService.updateBatchById(listGoodsSku);//更新库存
			//加入redis，30分钟自动取消
			String keyRedis = String.valueOf(StrUtil.format("{}{}:{}",MallConstants.REDIS_ORDER_KEY_STATUS_0, TenantContextHolder.getTenantId(),orderInfo.getId()));
			redisTemplate.opsForValue().set(keyRedis, orderInfo.getOrderNo() , MallConstants.ORDER_TIME_OUT_0, TimeUnit.MINUTES);//设置过期时间
		}else{
			return null;
		}
		return orderInfo;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void notifyOrder(OrderInfo orderInfo) {
		orderInfo.setStatus(OrderInfoEnum.STATUS_1.getValue());
		baseMapper.updateById(orderInfo);//更新订单状态
		List<OrderItem> listOrderItem = orderItemService.list(Wrappers.<OrderItem>lambdaQuery()
				.eq(OrderItem::getOrderId,orderInfo.getId()));
		Map<String, List<OrderItem>> resultList = listOrderItem.stream().collect(Collectors.groupingBy(OrderItem::getSpuId));
		//更新销量
		for (String key : resultList.keySet()) {
			GoodsSpu goodsSpu = goodsSpuService.getById(key);
			resultList.get(key).forEach(orderItem -> {
				goodsSpu.setSaleNum(goodsSpu.getSaleNum()+orderItem.getQuantity());
			});
			goodsSpuService.updateById(goodsSpu);
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void notifyLogisticsr(String logisticsId, JSONObject jsonObject) {
		OrderLogistics orderLogistics = orderLogisticsService.getById(logisticsId);
		if(orderLogistics != null){
			String status = jsonObject.getStr("status");
			if("abort".equals(status)){//中止
				orderLogistics.setStatus(OrderLogisticsEnum.STATUS_ER.getValue());
				orderLogistics.setMessage(jsonObject.getStr("message"));
			}else{
				orderLogisticsDetailService.remove(Wrappers.<OrderLogisticsDetail>lambdaQuery()
						.eq(OrderLogisticsDetail::getLogisticsId,logisticsId));//先删除
				JSONObject jsonResult =(JSONObject) jsonObject.get("lastResult");
				orderLogistics.setStatus(jsonResult.getStr("state"));
				orderLogistics.setIsCheck(jsonResult.getStr("ischeck"));
				JSONArray jSONArray = jsonResult.getJSONArray("data");
				List<OrderLogisticsDetail> listOrderLogisticsDetail = new ArrayList<>();
				jSONArray.forEach(object -> {
					JSONObject jsonData = JSONUtil.parseObj(object);
					OrderLogisticsDetail orderLogisticsDetail = new OrderLogisticsDetail();
					orderLogisticsDetail.setLogisticsId(logisticsId);
					orderLogisticsDetail.setLogisticsTime(LocalDateTimeUtil.parse(jsonData.getStr("time")));
					orderLogisticsDetail.setLogisticsInformation(jsonData.getStr("context"));
					listOrderLogisticsDetail.add(orderLogisticsDetail);
				});
				orderLogisticsDetailService.saveBatch(listOrderLogisticsDetail);
				//获取最近一条物流信息
				Optional<OrderLogisticsDetail> orderLogisticsDetail = listOrderLogisticsDetail.stream().collect(Collectors.maxBy(Comparator.comparing(OrderLogisticsDetail::getLogisticsTime)));
				orderLogistics.setMessage(orderLogisticsDetail.get().getLogisticsInformation());
			}
			orderLogisticsService.updateById(orderLogistics);
		}
	}
}