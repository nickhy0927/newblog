package com.iss.system.advertisement.controller;

import com.iss.system.advertisement.entity.Advertisement;
import com.iss.system.advertisement.service.AdvertisementService;
import com.iss.system.icon.entity.Icon;
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
import java.util.Map;

/**
 * Created by yuanhuangd on 2017/9/29.
 */
@Controller
@Scope("prototype")
public class AdvertisementController {

    @Autowired
    private AdvertisementService advertisementService;

    @RequestMapping(value = "/system/advertisement/list", method = {RequestMethod.POST, RequestMethod.GET})
    public String list(HttpServletRequest request, Model model) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        try {
            ObjectTools<Advertisement> tools = advertisementService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            model.addAttribute("tools", tools);
            model.addAttribute("currentPage", currentPage);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "system/advertisement/advertisement-list";
    }

    @RequestMapping(value = "/system/advertisement/add")
    public String add() {
        return "system/advertisement/advertisement-add";
    }

    @RequestMapping(value = "/system/advertisement/edit")
    public String edit(HttpServletRequest request, Model model) {
        try {
            String id = request.getParameter("id");
            Advertisement advertisement = advertisementService.get(id);
            model.addAttribute("advertisement", advertisement);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "system/advertisement/advertisement-add";
    }

    @RequestMapping(value = "/system/advertisement/save", method = RequestMethod.POST)
    public void save(HttpServletResponse response, Advertisement advertisement) {
        MessageObject message = new MessageObject();
        message.setResposecode(MessageObject.ResponseCode.code_200);
        try {
            advertisementService.save(advertisement);
            message.setInforMessage("添加广告成功");
        } catch (ServiceException e) {
            e.printStackTrace();
            message.setErrorMessage("添加广告失败，请稍候再试");
        } finally {
            message.getWriter(response, message);
        }
    }
}
