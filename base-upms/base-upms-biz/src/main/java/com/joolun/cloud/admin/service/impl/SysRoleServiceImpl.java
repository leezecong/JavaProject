package com.joolun.cloud.admin.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.joolun.cloud.admin.api.entity.SysRole;
import com.joolun.cloud.admin.api.entity.SysRoleMenu;
import com.joolun.cloud.admin.mapper.SysRoleMapper;
import com.joolun.cloud.admin.mapper.SysRoleMenuMapper;
import com.joolun.cloud.admin.service.SysRoleService;
import lombok.AllArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.joolun.cloud.common.core.constant.CacheConstants;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author
 */
@Service
@AllArgsConstructor
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
	private SysRoleMenuMapper sysRoleMenuMapper;

	/**
	 * 通过用户ID，查询角色信息
	 *
	 * @param userId
	 * @return
	 */
	@Override
	public List findRolesByUserId(Integer userId) {
		return baseMapper.listRolesByUserId(userId);
	}

	/**
	 * 通过角色ID，删除角色,并清空角色菜单缓存
	 *
	 * @param id
	 * @return
	 */
	@Override
	@CacheEvict(value = CacheConstants.CLIENT_DETAILS_KEY, allEntries = true)
	@Transactional(rollbackFor = Exception.class)
	public Boolean removeRoleById(Integer id) {
		sysRoleMenuMapper.delete(Wrappers
			.<SysRoleMenu>update().lambda()
			.eq(SysRoleMenu::getRoleId, id));
		return this.removeById(id);
	}
}