package com.iss.system.user.service.impl;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Subqueries;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iss.exception.AccountException;
import com.iss.exception.LockedException;
import com.iss.exception.PasswordException;
import com.iss.system.user.dao.UserDao;
import com.iss.system.user.entity.User;
import com.iss.system.user.service.UserService;
import com.orm.commons.encryption.MD5Encryption;
import com.orm.commons.service.impl.DefaultAbstractService;
import com.orm.config.InitEnvironment;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Service
public class UserServiceImpl extends DefaultAbstractService<User, String> implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findUserByLoginName(String loginName) {
        return userDao.findUserByLoginName(loginName);
    }

    @Override
    public User findUserByLoginAndPassword(String loginName, String password) throws LockedException, PasswordException, AccountException {
        User user = isRootUser(loginName, password);
        if (user == null) {
            user = findUserByLoginName(loginName);
            if (user != null) {
                if (user.getLocked())
                    throw new LockedException("账户已锁定，请隔两分钟再试");
                String s = user.getPassword();
                String s1 = MD5Encryption.MD5(password);
                if (s.equals(s1)) {
                    user.setRoles(null);
                    return user;
                } else
                    throw new PasswordException("输入的密码不正确");
            } else {
                throw new AccountException("登录账户不存在");
            }
        }
        return user;
    }

    public User isRootUser(String loginName, String password) {
        InitEnvironment environment = InitEnvironment.getInitEnvironmentInstance();
        if (StringUtils.isNotEmpty(environment.getInitUsername()) && environment.getInitUsername().equals(loginName)) {
            String ps = MD5Encryption.MD5(environment.getInitPassword());
            boolean bool = StringUtils.isNotEmpty(ps) && ps.equals(MD5Encryption.MD5(password));
            if (bool) {
                User user = new User();
                user.setLoginName(environment.getInitUsername());
                user.setRealName("管理员");
                user.setLocked(Boolean.FALSE);
                user.setDisabled(Boolean.FALSE);
                user.setId("1");
                return user;
            }
        }
        return null;
    }

    @Override
    public Page<User> queryPageByCriteria(Map<String, Object> paramMap, Pageable pageable) {
        Criteria criteria = this.dao.createCriteria(paramMap);
        DetachedCriteria idsOnlyCriteria = DetachedCriteria.forClass(User.class);
        criteria.setProjection(Projections.distinct(Projections.id()));
        criteria.add(Subqueries.propertyIn("id", idsOnlyCriteria));
        return this.dao.queryByCriteria(criteria, pageable);
    }
}
