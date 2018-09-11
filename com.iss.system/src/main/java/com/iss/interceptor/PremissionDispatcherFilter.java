package com.iss.interceptor;

import com.google.common.collect.Sets;
import com.iss.annotation.AccessUrlAlias;
import com.iss.init.UserSingleton;
import com.iss.system.user.entity.User;
import com.orm.commons.utils.MessageObject;
import com.orm.config.InitEnvironment;
import com.orm.config.SpringContextHolder;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Set;

/**
 * 权限拦截器
 *
 * @author Hyuan
 */
public class PremissionDispatcherFilter extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        UserSingleton.set(request, response);
        User user = UserSingleton.getContextUser(request);
        if (user == null) {
            return true;
        }
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            String[] menus = {};
            if (menus != null) {
                System.out.println(menus.length);
            } else menus = new String[0];
            Set<String> aliasList = Sets.newHashSet();
            for (String alias : menus) {
                aliasList.add(alias);
            }
            AccessUrlAlias access = method.getAnnotation(AccessUrlAlias.class);
            String uri = request.getRequestURI();
            StaticResources staticResources = StaticResources.getStaticResourcesInstance();
            List<String> urls = staticResources.getUrls();
            for (String url : urls) {
                if (uri.contains(url)) {
                    return true;
                }
            }
            InitEnvironment environment = SpringContextHolder.getBean(InitEnvironment.class);
            if (environment.getInitUsername().equals(user.getLoginName())) {
                return true;
            }
            if (uri.lastIndexOf(".json") > 0) {
                if (access != null) {
                    String alias = access.alias();
                    if (aliasList.contains(alias)) {
                        return true;
                    } else {
                        MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
                        messageObject.error("你没有操作权限访问，如需操作，请联系管理员");
                        messageObject.returnData(response, messageObject);
                        return false;
                    }
                }
            } else {
                if (access != null) {
                    String alias = access.alias();
                    if (aliasList.contains(alias)) {
                        return true;
                    } else {
                        request.setAttribute("url", uri);
                        request.getRequestDispatcher("/unauth.do").forward(request, response);
                        return false;
                    }
                }
            }
        }
        return true;
    }

}
