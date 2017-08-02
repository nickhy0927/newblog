package com.iss.platform.user.dao;

import com.iss.platform.user.entity.User;
import com.orm.commons.service.HyJpaRepostiory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Repository
public interface UserDao extends HyJpaRepostiory<User,String>{

    @Query("select u from User u where u.loginName = ?1")
    User findUserByLoginName(String loginName);
}
