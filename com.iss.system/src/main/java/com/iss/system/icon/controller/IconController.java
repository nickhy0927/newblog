package com.iss.system.icon.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.iss.system.icon.entity.Icon;
import com.iss.system.icon.service.IconService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectIterable;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;

/**
 * Created by yuanhuangd on 2017/8/1.
 */
@Controller
public class IconController {

    @Autowired
    private IconService iconService;

    @RequestMapping(value = "/system/icon/list", method = {RequestMethod.POST, RequestMethod.GET})
    public String list(HttpServletRequest request, Model model) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        objectMap.put("disabled_eq", false);
        try {
            ObjectTools<Icon> tools = iconService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            model.addAttribute("tools", tools);
            model.addAttribute("currentPage", currentPage);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "system/icon/icon-list";
    }

    @RequestMapping(value = "/system/icon/add")
    public String add() {
        return "system/icon/icon-add";
    }

    @RequestMapping(value = "/system/icon/edit")
    public String edit(@RequestParam(value = "id") String id, Model model) {
        try {
            Icon icon = iconService.get(id);
            model.addAttribute("icon", icon);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "system/icon/icon-add";
    }

    @ResponseBody
    @RequestMapping(value = "/system/icon/save", method = RequestMethod.POST)
    public MessageObject save(Icon icon) {
        MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
        try {
            icon = iconService.save(icon);
            messageObject.ok("添加图标成功", icon);
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.error("添加菜单图标失败，请稍候再试");
        } 
        return messageObject;
    }
    
    @ResponseBody
    @RequestMapping(value = "/system/icon/delete", method = RequestMethod.POST)
    public MessageObject delete(HttpServletRequest request) {
        String ids = request.getParameter("id");
        MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
        try {
            if (StringUtils.isNotEmpty(ids)) {
            	String[] strings = ids.split(",");
            	List<Icon> icons = Lists.newArrayList();
            	for (int i = 0; i < strings.length; i++) {
					String id = strings[i];
					Icon icon = iconService.get(id);
					icon.setDisabled(Boolean.TRUE);
					icons.add(icon);
				}
                iconService.saveBatch(new ObjectIterable<Icon>(icons));
                messageObject.ok("图标删除成功", new ObjectIterable<Icon>(icons));
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.error("图标删除失败");
        } 
        return messageObject;
    }
}
