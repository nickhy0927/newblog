package com.iss.platform.icon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iss.platform.icon.entity.Icon;
import com.iss.platform.icon.service.IconService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;

/**
 * Created by yuanhuangd on 2017/8/1.
 */
@Controller
public class IconController {

    @Autowired
    private IconService iconService;

    @RequestMapping(value = "/platform/icon/list", method = {RequestMethod.POST, RequestMethod.GET})
    public String list(HttpServletRequest request, Model model) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        try {
            ObjectTools<Icon> tools = iconService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            model.addAttribute("tools", tools);
            model.addAttribute("currentPage", currentPage);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/icon/icon-list";
    }

    @RequestMapping(value = "/platform/icon/add")
    public String add() {
        return "platform/icon/icon-add";
    }

    @RequestMapping(value = "/platform/icon/edit")
    public String edit(HttpServletRequest request, Model model) {
        try {
            String id = request.getParameter("id");
            Icon icon = iconService.get(id);
            model.addAttribute("icon", icon);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/icon/icon-add";
    }

    @RequestMapping(value = "/platform/icon/save", method = RequestMethod.POST)
    public void save(HttpServletResponse response, Icon icon) {
        MessageObject message = new MessageObject();
        message.setResposecode(MessageObject.ResponseCode.code_200);
        try {
            iconService.save(icon);
            message.setInforMessage("添加图标成功");
        } catch (ServiceException e) {
            e.printStackTrace();
            message.setErrorMessage("添加菜单图标，请稍候再试");
        } finally {
            message.getWriter(response, message);
        }
    }
}
