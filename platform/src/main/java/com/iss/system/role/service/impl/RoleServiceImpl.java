package com.iss.system.role.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Subqueries;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iss.system.module.entity.Module;
import com.iss.system.role.dao.RoleDao;
import com.iss.system.role.entity.Role;
import com.iss.system.role.service.RoleService;
import com.iss.system.user.entity.User;
import com.orm.commons.service.impl.DefaultAbstractService;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Service
public class RoleServiceImpl extends DefaultAbstractService<Role, String> implements RoleService {

	@Autowired
	private RoleDao roleDao;

	@Override
	public Page<Role> queryPageByCriteria(Map<String, Object> paramMap, Pageable pageable) {
		Criteria criteria = this.dao.createCriteria(paramMap);
		DetachedCriteria idsOnlyCriteria = DetachedCriteria.forClass(User.class);
		criteria.setProjection(Projections.distinct(Projections.id()));
		criteria.add(Subqueries.propertyIn("id", idsOnlyCriteria));
		return this.dao.queryByCriteria(criteria, pageable);
	}

	@Override
	public List<Module> queryRolesByIds(String ids) {
		String[] idStrings = ids.split(",");
		List<String> list = new ArrayList<>();
		for (String id : idStrings) {
			list.add(id);
		}
		return roleDao.queryRolesByIds(list);
	}
}
