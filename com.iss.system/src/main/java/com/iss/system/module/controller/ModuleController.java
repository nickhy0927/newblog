package com.iss.system.module.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value = "/system/module/moduleList.json", method = { RequestMethod.POST })
	public MessageObject moduleList(HttpServletRequest request,PageSupport support) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		objectMap.put("disabled_eq",Boolean.FALSE);
        objectMap.put("id_ne", String.valueOf(1));
		try {
			PagerInfo<Module> pagerInfo = moduleService.queryPagerInfoByMap(objectMap , support, new Sort(Sort.Direction.DESC, "createTime"));
			messageObject.setObject(pagerInfo);
			messageObject.ok("查询菜单信息成功", pagerInfo);
		} catch (ServiceException e) {
			e.printStackTrace();
			messageObject.error("查询菜单信息是吧");
		} 
		return messageObject;
	}

	@RequestMapping(value = "/system/module/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String moduleList(HttpServletRequest request, Map<String, Object> paramMap) {
		return "system/module/module-list";
	}

	@RequestMapping(value = "/system/module/add")
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
		return "system/module/module_add";
	}

	@RequestMapping(value = "/system/module/edit")
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
		return "system/module/module_add";
	}

	@RequestMapping(value = "/system/module/view")
	public String view(HttpServletRequest request) {
		String id = request.getParameter("id");
		try {
			Module module = moduleService.get(id);
			request.setAttribute("module", module);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "system/module/module_view";
	}

	@ResponseBody
	@RequestMapping(value = "/system/module/save", method = RequestMethod.POST)
	public MessageObject save(HttpServletRequest request, Module module) {
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		try {
			String pid = request.getParameter("pId");
			Module parent = moduleService.get(pid);
			module.setModule(parent);
			String iconId = request.getParameter("iconId");
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
	@RequestMapping(value = "/system/module/delete", method = RequestMethod.POST)
	public MessageObject delete(HttpServletRequest request, HttpServletResponse response) {
		String ids = request.getParameter("id");
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		try {
			if (StringUtils.isNotEmpty(ids)) {
				String[] strings = ids.split(",");
				List<Module> modules = Lists.newArrayList();
				for (int i = 0; i < strings.length; i++) {
					String id = strings[i];
					Module module = moduleService.get(id);
					module.setDisabled(Boolean.TRUE);
					modules.add(module);
				}
				moduleService.saveBatch(new ObjectIterable<Module>(modules));
				messageObject.ok("角色菜单成功", new ObjectIterable<Module>(modules));
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			messageObject.error("角色菜单失败");
		} 
		return messageObject;
	}
}
