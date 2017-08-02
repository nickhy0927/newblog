package com.iss.platform.role.controller;

import com.iss.platform.role.entity.Role;
import com.iss.platform.role.service.RoleService;
import com.iss.platform.userRole.tree.TreeObj;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Controller
@RequestMapping(value = "/platform")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/role/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(HttpServletRequest request, Model model) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        try {
            ObjectTools<Role> tools = roleService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            model.addAttribute("tools", tools);
            model.addAttribute("currentPage", currentPage);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/role/role_list";
    }

    @RequestMapping(value = "/role/add")
    public String add(HttpServletRequest request) {
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("disabled_eq", Boolean.FALSE);
        List<TreeObj> trees = new ArrayList<>();
        try {
            List<Role> roles = roleService.queryByMap(paramsMap);
            for (Role role : roles) {
                trees.add(new TreeObj(role));
            }
            request.setAttribute("json", new JsonMapper().toJson(trees));
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/role/role_add";
    }

    @RequestMapping(value = "/role/save", method = RequestMethod.POST)
    public void save(Role role, HttpServletResponse response, HttpServletRequest request) {
        MessageObject message = new MessageObject();
        try {
            String pid = request.getParameter("pId");
            Role r = roleService.get(pid);
            role.setRole(r);
            roleService.save(role);
            message.setInforMessage("添加角色成功");
        } catch (ServiceException e) {
            e.printStackTrace();
            message.setErrorMessage("添加角色失败");
        } finally {
            message.getWriter(response, message);
        }

    }
}
