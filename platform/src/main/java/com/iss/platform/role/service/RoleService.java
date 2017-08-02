package com.iss.platform.role.service;

import com.iss.platform.module.entity.Module;
import com.iss.platform.role.entity.Role;
import com.orm.commons.service.BaseService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public interface RoleService extends BaseService<Role, String> {

    Page<Role> queryPageByCriteria(Map<String, Object> paramMap, Pageable pageable);
    
    List<Module> queryRolesByIds(String ids);
}
