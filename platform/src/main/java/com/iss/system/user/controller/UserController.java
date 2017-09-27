package com.iss.system.user.controller;

import java.io.IOException;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iss.system.user.entity.User;
import com.iss.system.user.service.UserService;
import com.orm.commons.encryption.MD5Encryption;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/system/user/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(HttpServletRequest request, Model model) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        objectMap.put("disabled_eq", Boolean.FALSE);
        try {
            ObjectTools<User> tools = userService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            model.addAttribute("tools", tools);
            model.addAttribute("currentPage", currentPage);
            model.addAttribute("objectMap", objectMap);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "system/user/user_list";
    }

    @RequestMapping(value = "/system/user/add")
    public String add() {
        return "system/user/user_add";
    }

    @RequestMapping(value = "/system/user/edit/{id}")
    public String edit(@PathVariable String id, HttpServletRequest request) {
        String uri = request.getRequestURI();
        String pattern = ".*/system/user/edit/.*";
        boolean isMatch = Pattern.matches(pattern, uri);
        System.out.println(isMatch);
        try {
            User user = userService.get(id);
            request.setAttribute("user", user);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "system/user/user_edit";
    }

    @RequestMapping(value = "/system/user/save", method = RequestMethod.POST)
    public void save(User user, HttpServletResponse response) {
        MessageObject message = new MessageObject();
        message.setResposecode(MessageObject.ResponseCode.code_200);
        try {
            user.setPassword(MD5Encryption.MD5(user.getPassword()));
            userService.save(user);
            message.setInforMessage("添加用户成功");
        } catch (ServiceException e) {
            e.printStackTrace();
            message.setErrorMessage("添加用户异常，请稍候再试");
        } finally {
            message.getWriter(response, message);
        }
    }

    @RequestMapping(value = "/user/query.json", method = {RequestMethod.POST, RequestMethod.GET})
    public void query(HttpServletResponse response) {
        MessageObject messageObject = new MessageObject();
        messageObject.setInforMessage("查询成功");
        messageObject.getWriter(response, messageObject);
    }

    @RequestMapping(value = "/system/user/checkLoginName.json", method = {RequestMethod.POST, RequestMethod.GET})
    public void checkLoginName(HttpServletResponse response, HttpServletRequest request) {
        String loginName = request.getParameter("loginName");
        User user = userService.findUserByLoginName(loginName);
        try {
            if (user != null) {
                response.getWriter().print(false);
            } else
                response.getWriter().print(true);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/system/user/delete", method = RequestMethod.POST)
    public void delete(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        MessageObject messageObject = new MessageObject();
        try {
            if (StringUtils.isNotEmpty(id)) {
                User user = userService.get(id);
                user.setDisabled(Boolean.TRUE);
                userService.save(user);
                messageObject.setInforMessage("角色用户成功");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.setErrorMessage("角色用户失败");
        } finally {
            messageObject.getWriter(response, messageObject);
        }
    }
}
