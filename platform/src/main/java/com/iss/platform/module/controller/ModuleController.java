package com.iss.platform.module.controller;

import com.iss.platform.icon.entity.Icon;
import com.iss.platform.icon.service.IconService;
import com.iss.platform.module.entity.Module;
import com.iss.platform.module.service.ModuleService;
import com.iss.platform.module.tree.ModuleTree;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;
import org.apache.commons.lang3.StringUtils;
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
public class ModuleController {

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private IconService iconService;

    @RequestMapping(value = "/module/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(HttpServletRequest request, Model model) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        try {
            objectMap.put("disable_eq",Boolean.FALSE);
            ObjectTools<Module> tools = moduleService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            model.addAttribute("tools", tools);
            model.addAttribute("currentPage", currentPage);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/module/module_list";
    }

    @RequestMapping(value = "/module/add")
    public String add(HttpServletRequest request) {
        Map<String, Object> paramsMap = new HashMap<>();
        List<ModuleTree> trees = new ArrayList<>();
        try {
            paramsMap.put("disabled_eq", Boolean.FALSE);
            List<Module> modules = moduleService.queryByMap(paramsMap);
            for (Module module : modules) {
                trees.add(new ModuleTree(module));
            }
            request.setAttribute("json", new JsonMapper().toJson(trees));
            paramsMap = new HashMap<>();
            paramsMap.put("disabled_eq", Boolean.FALSE);
            List<Icon> icons = iconService.queryByMap(paramsMap);
            request.setAttribute("icons", icons);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/module/module_add";
    }

    @RequestMapping(value = "/module/edit")
    public String edit(HttpServletRequest request) {
        String id = request.getParameter("id");
        Map<String, Object> paramsMap = new HashMap<>();
        List<ModuleTree> trees = new ArrayList<>();
        try {
            paramsMap.put("disabled_eq", Boolean.FALSE);
            List<Module> modules = moduleService.queryByMap(paramsMap);
            for (Module module : modules) {
                trees.add(new ModuleTree(module));
            }
            request.setAttribute("json", new JsonMapper().toJson(trees));
            Module module = moduleService.get(id);
            request.setAttribute("module", module);
            paramsMap = new HashMap<>();
            paramsMap.put("disabled_eq", Boolean.FALSE);
            List<Icon> icons = iconService.queryByMap(paramsMap);
            request.setAttribute("icons", icons);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/module/module_add";
    }

    @RequestMapping(value = "/module/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request, HttpServletResponse response, Module module) {
        MessageObject message = new MessageObject();
        message.setResposecode(MessageObject.ResponseCode.code_200);
        try {
            String pid = request.getParameter("pId");
            Module parent = moduleService.get(pid);
            module.setModule(parent);
            String iconId = request.getParameter("iconId");
            module.setIcon(iconService.get(iconId));
            moduleService.save(module);
            message.setInforMessage("添加菜单成功");
        } catch (ServiceException e) {
            e.printStackTrace();
            message.setErrorMessage("添加菜单异常，请稍候再试");
        } finally {
            message.getWriter(response, message);
        }
    }

    @RequestMapping(value = "/platform/role/delete", method = RequestMethod.POST)
    public void delete(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        MessageObject messageObject = new MessageObject();
        try {
            if (StringUtils.isNotEmpty(id)) {
                Module module = moduleService.get(id);
                module.setDisabled(Boolean.TRUE);
                moduleService.save(module);
                messageObject.setInforMessage("角色菜单成功");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.setErrorMessage("角色菜单失败");
        } finally {
            messageObject.getWriter(response, messageObject);
        }
    }
}
