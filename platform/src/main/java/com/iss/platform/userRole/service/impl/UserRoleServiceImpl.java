package com.iss.platform.userRole.service.impl;

import org.springframework.stereotype.Service;

import com.iss.platform.user.entity.User;
import com.iss.platform.userRole.service.UserRoleService;
import com.orm.commons.service.impl.DefaultAbstractService;

/**
 * Created by yuanhuangd on 2017/7/31.
 */
@Service
public class UserRoleServiceImpl extends DefaultAbstractService<User, String> implements UserRoleService {

}
