package com.iss.system.module.controller;

import com.google.common.collect.Lists;
import com.iss.system.icon.entity.Icon;
import com.iss.system.icon.service.IconService;
import com.iss.system.module.entity.Module;
import com.iss.system.module.service.ModuleService;
import com.iss.system.module.tree.ModuleTree;
import com.iss.util.PageSupport;
import com.iss.util.PagerInfo;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectIterable;
import com.orm.commons.utils.WebUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Controller
public class ModuleController {

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private IconService iconService;

    @ResponseBody
    @RequestMapping(value = "/system/module/module-list.json", method = {RequestMethod.POST})
    public MessageObject moduleList(HttpServletRequest request, PageSupport support) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
        objectMap.put("disabled_eq", Boolean.FALSE);
        objectMap.put("id_ne", String.valueOf(1));
        try {
            PagerInfo<Module> pagerInfo = moduleService.queryPagerInfoByMap(objectMap, support, new Sort(Sort.Direction.DESC, support.getOrder()));
            messageObject.setObject(pagerInfo);
            messageObject.ok("查询菜单信息成功", pagerInfo);
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.error("查询菜单信息失败");
        }
        return messageObject;
    }

    @RequestMapping(value = "/system/module/module-list.do", method = {RequestMethod.GET})
    public String moduleList() {
        return "system/module/module-list";
    }

    @RequestMapping(value = "/system/module/module-add.do", method = RequestMethod.GET)
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
        return "system/module/module-add";
    }

    @RequestMapping(value = "/system/module/module-edit/{id}.do")
    public String edit(Model model, @PathVariable(value = "id") String id) {
        Map<String, Object> paramsMap = new HashMap<>();
        List<ModuleTree> trees = new ArrayList<>();
        try {
            paramsMap.put("disabled_eq", Boolean.FALSE);
            List<Module> modules = moduleService.queryByMap(paramsMap);
            for (Module module : modules) {
                trees.add(new ModuleTree(module));
            }
            model.addAttribute("json", new JsonMapper().toJson(trees));
            Module module = moduleService.get(id);
            model.addAttribute("module", module);
            paramsMap = new HashMap<>();
            paramsMap.put("disabled_eq", Boolean.FALSE);
            List<Icon> icons = iconService.queryByMap(paramsMap);
            model.addAttribute("icons", icons);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "system/module/module-add";
    }

    @RequestMapping(value = "/system/module/module-view/{id}.do")
    public String view(Model model, @PathVariable(value = "id") String id) {
        try {
            model.addAttribute("module", moduleService.get(id));
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "system/module/module-view";
    }

    @ResponseBody
    @RequestMapping(value = "/system/module/module-save.json", method = RequestMethod.POST)
    public MessageObject save(@RequestParam String pId, Module module, @RequestParam String iconId) {
        MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
        try {
            Module parent = moduleService.get(pId);
            module.setModule(parent);
            module.setIcon(iconService.get(iconId));
            moduleService.save(module);
            messageObject.ok("保存菜单信息成功", module);
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.error("保存菜单信息失败");
        }
        return messageObject;
    }

    @ResponseBody
    @RequestMapping(value = "/system/module/module-delete.json", method = RequestMethod.POST)
    public MessageObject delete(@RequestParam String id) {
        MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
        try {
            if (StringUtils.isNotEmpty(id)) {
                String[] strings = id.split(",");
                List<Module> modules = Lists.newArrayList();
                for (String moduleId : strings) {
                    Module module = moduleService.get(moduleId);
                    module.setDisabled(Boolean.TRUE);
                    modules.add(module);
                }
                moduleService.saveBatch(new ObjectIterable<>(modules));
                messageObject.ok("角色菜单成功", new ObjectIterable<>(modules));
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.error("角色菜单失败");
        }
        return messageObject;
    }
}
