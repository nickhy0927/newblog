package com.iss.tag;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang3.StringUtils;

import com.iss.listener.SingletonUser;
import com.iss.system.module.entity.Module;
import com.iss.system.role.entity.Role;
import com.iss.system.user.entity.User;
import com.iss.system.user.service.UserService;
import com.orm.commons.exception.ServiceException;
import com.orm.config.InitEnvironment;
import com.orm.config.SpringContextHolder;

@SuppressWarnings("serial")
public class PremissionTag extends BodyTagSupport {

    private String alias;

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    @Override
    public int doStartTag() throws JspException {
        InitEnvironment environment = InitEnvironment.getInitEnvironmentInstance();
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        //获取session中存放的权限
        User user = SingletonUser.getContextUser(request);
        if (StringUtils.equals(user.getLoginName(), environment.getInitUsername())) {
            return BodyTagSupport.EVAL_BODY_INCLUDE;
        } else {
            UserService userService = SpringContextHolder.getBean(UserService.class);
            List<String> alis = new ArrayList<>();
            if (user != null) {
                try {
                    user = userService.get(user.getId());
                    if (user != null) {
                        List<Role> roles = user.getRoles();
                        for (Role role : roles) {
                            List<Module> modules = role.getModules();
                            for (Module module : modules) {
                                alis.add(module.getAlias());
                            }
                        }
                    }
                    if (alis.contains(alias)) {
                        return BodyTagSupport.EVAL_BODY_INCLUDE;// 返回此则执行标签body中内容，SKIP_BODY则不执行
                    } else
                        return BodyTagSupport.SKIP_BODY;
                } catch (ServiceException e) {
                    e.printStackTrace();
                }
            }
        }

        return BodyTagSupport.SKIP_BODY;
    }
}
