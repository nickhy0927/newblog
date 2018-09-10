package com.iss.system.user.service;

import com.iss.exception.AccountException;
import com.iss.exception.LockedException;
import com.iss.exception.PasswordException;
import com.iss.system.user.entity.User;
import com.orm.commons.service.BaseService;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public interface UserService extends BaseService<User, String> {

    User findUserByLoginName(String loginName);

    User isRootUser(String loginName,String password);

    User findUserByLoginAndPassword(String loginName,String password) throws LockedException, PasswordException, AccountException;
}
