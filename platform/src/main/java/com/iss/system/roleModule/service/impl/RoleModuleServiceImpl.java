package com.iss.system.roleModule.service.impl;

import org.springframework.stereotype.Service;

import com.iss.system.role.entity.Role;
import com.iss.system.roleModule.service.RoleModuleService;
import com.orm.commons.service.impl.DefaultAbstractService;

/**
 * Created by yuanhuangd on 2017/8/2.
 */
@Service
public class RoleModuleServiceImpl extends DefaultAbstractService<Role,String> implements RoleModuleService {
}
