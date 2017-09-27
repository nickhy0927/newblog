package com.iss.system.user.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.iss.system.user.entity.User;
import com.orm.commons.service.HyJpaRepostiory;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Repository
public interface UserDao extends HyJpaRepostiory<User,String>{

    @Query("select u from User u where u.loginName = ?1")
    User findUserByLoginName(String loginName);
}
