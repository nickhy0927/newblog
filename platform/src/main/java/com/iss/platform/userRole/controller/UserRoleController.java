package com.iss.platform.userRole.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iss.platform.role.entity.Role;
import com.iss.platform.role.service.RoleService;
import com.iss.platform.user.entity.User;
import com.iss.platform.user.service.UserService;
import com.iss.platform.userRole.tree.TreeObj;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.PageSupport;
import com.orm.commons.utils.WebUtils;

/**
 * Created by yuanhuangd on 2017/7/31.
 */
@Controller
public class UserRoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/platform/user/role/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String queryUserRoleList() {

        return "/platform/userRole/user-role-list";
    }

    @RequestMapping(value = "/platform/user/role/list.json", method = {RequestMethod.GET, RequestMethod.POST})
    public void queryUserRoleList(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> requestToMap = WebUtils.getRequestToMap(request);
        Pageable pageSupport = PageSupport.getPageable(request, new Sort(Sort.Direction.DESC, "createTime"));
        try {
            requestToMap.put("disabled_eq", false);
            Page<User> users = userService.queryPageByMap(requestToMap, pageSupport);
            response.setContentType("text/html;charset=UTF-8");
            String json = "{\"total\":" + users.getNumber() + ",\"rows\":" + new JsonMapper().toJson(users.getContent()) + "}";
            response.getWriter().write(json);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServiceException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/platform/user/role/queryUserById.json", method = {RequestMethod.GET, RequestMethod.POST})
    public void queryUserById(HttpServletResponse response, HttpServletRequest request) {
        String userId = request.getParameter("userId");
        if (StringUtils.isNotEmpty(userId)) {
            try {
                User user = userService.get(userId);
                response.setContentType("text/html;charset=UTF-8");
                String json = "{\"total\":" + user.getRoles().size() + ",\"rows\":" + new JsonMapper().toJson(user.getRoles()) + "}";
                try {
                    response.getWriter().write(json);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (ServiceException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/platform/user/role/add", method = {RequestMethod.GET, RequestMethod.POST})
    public String add(HttpServletRequest request) {
        String userId = request.getParameter("id");
        List<TreeObj> trees = new ArrayList<>();
        if (StringUtils.isNotEmpty(userId)) {
            try {
                Map<String, Object> paramsMap = new HashMap<>();
                paramsMap.put("disabled_eq", false);
                paramsMap.put("id_ne", String.valueOf(1));
                List<Role> roles = roleService.queryByMap(paramsMap);
                for (Role role : roles) {
                    trees.add(new TreeObj(role));
                }
                request.setAttribute("json", new JsonMapper().toJson(trees));
                User user = userService.get(userId);
                request.setAttribute("user", user);
            } catch (ServiceException e) {
                e.printStackTrace();
            }
        }
        return "/platform/userRole/user-role-add";
    }

    @RequestMapping(value = "/platform/user/role/save", method = RequestMethod.POST)
    public void updateUser(HttpServletRequest request, HttpServletResponse response) {
        String userId = request.getParameter("userId");
        MessageObject message = new MessageObject();
        String ids = request.getParameter("ids");
        if (StringUtils.isNotEmpty(ids)) {
            if (StringUtils.isNotEmpty(userId)) {
                try {
                    List<Role> roles = new ArrayList<>();
                    User user = userService.get(userId);
                    String[] roleIds = ids.split(",");
                    for (String id : roleIds) {
                        roles.add(roleService.get(id));
                    }
                    user.setRoles(roles);
                    userService.save(user);
                    message.setInforMessage("角色权限赋值成功");
                } catch (ServiceException e) {
                    e.printStackTrace();
                    message.setInforMessage("角色权限赋值失败");
                } finally {
                    message.getWriter(response, message);
                }
            }
        }
    }
}
