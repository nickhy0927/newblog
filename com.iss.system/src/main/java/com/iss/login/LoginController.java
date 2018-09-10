package com.iss.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iss.listener.SingletonUser;
import com.iss.system.user.entity.User;
import com.iss.system.user.service.UserService;
import com.iss.util.RandomString;

/**
 * Created by yuanhuangd on 2017/7/25.
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            User user = userService.findUserByLoginAndPassword(username, password);
            SingletonUser.setUser(request, user);
            return "redirect:index";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "账户或密码错误");
            return "login";
        }
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public ModelAndView login() {
        ModelAndView view = new ModelAndView("login");
        return view;
    }

    @RequestMapping(value = "/logout", method = {RequestMethod.GET})
    public String logout(HttpServletRequest request) {
        SingletonUser.removeUser(request);
        return "redirect:login?SESSION=" + RandomString.getUUID();
    }
}


