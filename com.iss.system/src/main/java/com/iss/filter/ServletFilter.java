package com.iss.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.AntPathMatcher;

import com.iss.listener.SingletonUser;
import com.iss.system.user.entity.User;
import com.orm.config.InitEnvironment;

/**
 * Created by yuanhuangd on 2017/7/26.
 */
public class ServletFilter implements Filter {

    private static final Logger LOGGER = LoggerFactory.getLogger(ServletFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String requestUri = req.getRequestURI();
        User user = SingletonUser.getContextUser(req);
        LOGGER.info("正在请求的url是：" + requestUri);
        InitEnvironment environment = InitEnvironment.getInitEnvironmentInstance();
        String contextPath = req.getContextPath();
        String url = requestUri.substring(contextPath.length());
        List<String> urls = environment.getUrls();
        if (user == null) {
        	for (String u : urls) {
        		AntPathMatcher matcher = new AntPathMatcher();
            	boolean match = matcher.match(u, url);
            	if (match) {
            		chain.doFilter(req, resp);
				} else {
					resp.sendRedirect("login?SESSIONID=" + req.getSession().getId().toUpperCase());
                    return;
				}
			}
        }
        chain.doFilter(req, response);
    }

    @Override
    public void destroy() {

    }
}
