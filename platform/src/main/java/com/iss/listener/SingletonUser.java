package com.iss.listener;

import com.iss.platform.user.entity.User;
import com.orm.commons.utils.JsonMapper;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by yuanhuangd on 2017/7/25.
 */	
@SuppressWarnings("serial")
public class SingletonUser extends HttpServlet {

    public static final String SITE_USER = "site_user";

    public static void setUser(HttpServletRequest request, User user) {
        HttpSession session = request.getSession();
        session.setAttribute(SITE_USER, new JsonMapper().toJson(user));
    }

    /**
     * 退出
     * @param request
     */
    public static void removeUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute(SITE_USER);
    }

    public static User getContextUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object o = session.getAttribute(SITE_USER);
        if (o != null)
            return new JsonMapper().fromJson(o.toString(), User.class);
        else
            return null;

    }


}
