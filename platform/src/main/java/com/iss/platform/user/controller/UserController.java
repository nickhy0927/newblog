package com.iss.platform.user.controller;

import com.iss.platform.user.entity.User;
import com.iss.platform.user.service.UserService;
import com.orm.commons.encryption.MD5Encryption;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Controller
@Scope(value = "prototype")
@RequestMapping(value = "/platform")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(HttpServletRequest request, Model model) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        try {
            ObjectTools<User> tools = userService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            model.addAttribute("tools", tools);
            model.addAttribute("currentPage", currentPage);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/user/user_list";
    }

    @RequestMapping(value = "/user/add")
    public String add(HttpServletRequest request) {
        return "platform/user/user_add";
    }

    @RequestMapping(value = "/user/save", method = RequestMethod.POST)
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

    @RequestMapping(value = "/user/checkLoginName.json", method = {RequestMethod.POST, RequestMethod.GET})
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
}
