package com.iss.platform.role.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.iss.platform.module.entity.Module;
import com.iss.platform.role.entity.Role;
import com.orm.commons.service.HyJpaRepostiory;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public interface RoleDao extends HyJpaRepostiory<Role, String> {

	@Query("select m from Module m where m.id in (?1)")
	List<Module> queryRolesByIds(List<String> ids);
}
