package com.iss.system.role.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.iss.system.module.entity.Module;
import com.iss.system.role.entity.Role;
import com.orm.commons.service.BaseService;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public interface RoleService extends BaseService<Role, String> {

    Page<Role> queryPageByCriteria(Map<String, Object> paramMap, Pageable pageable);
    
    List<Module> queryRolesByIds(String ids);
}
