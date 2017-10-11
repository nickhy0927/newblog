package com.iss.interceptor;

import com.iss.listener.SingletonUser;
import com.iss.system.user.entity.User;
import com.orm.config.InitEnvironment;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by yuanhuangd on 2017/7/25.
 */
public class SpringHandlerInterceptor extends HandlerInterceptorAdapter {

    /**
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作 可在modelAndView中加入数据，比如当前时间
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

    }

    /**
     * 在业务处理器处理请求之前被调用 如果返回false 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
     * 如果返回true 执行下一个拦截器,直到所有的拦截器都执行完毕 再执行被拦截的Controller 然后进入拦截器链,
     * 从最后一个拦截器往回执行所有的postHandle() 接着再从最后一个拦截器往回执行所有的afterCompletion()
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestUri = request.getRequestURI();
        User user = SingletonUser.getContextUser(request);
        InitEnvironment environment = InitEnvironment.getInitEnvironmentInstance();
        String contextPath = request.getContextPath();
        String url = requestUri.substring(contextPath.length());
        List<String> urls = environment.getUrls();
        System.out.println("requestUri" + requestUri);
        return true;
    }
}