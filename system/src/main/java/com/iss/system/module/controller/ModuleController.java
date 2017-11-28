package com.iss.system.module.controller;

import java.io.IOException;
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
import com.orm.commons.utils.MessageObject.ResponseCode;
import com.orm.commons.utils.MessageObject.ResponseMessage;
import com.orm.commons.utils.ObjectIterable;
import com.orm.commons.utils.ObjectTools;
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

	@RequestMapping(value = "/system/module/menuList", method = { RequestMethod.GET })
	public String menuList() {
		return "system/module/module-list";
	}
	@RequestMapping(value = "/system/module/menuList", method = { RequestMethod.GET })
	public void menuList(HttpServletResponse response,HttpServletRequest request,PageSupport support) {
		Map<String, Object> objectMap = WebUtils.getParamsToMap(request);
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		try {
			PagerInfo<Module> pagerInfo = moduleService.queryPagerInfoByMap(objectMap , support, new Sort(Sort.Direction.DESC, "createTime"));
			messageObject.setResponseCode(ResponseCode.SUCCESS);
			messageObject.setResponseMessage(ResponseMessage.LIST_SUCCESS_MESSAGE);
			messageObject.setObject(pagerInfo);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/system/module/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(HttpServletRequest request, Map<String, Object> paramMap) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		String currentPage = request.getParameter("currentPage");
		try {
			objectMap.put("disabled_eq", Boolean.FALSE);
			objectMap.put("id_ne", String.valueOf(1));
			ObjectTools<Module> tools = moduleService.queryPageByMap(objectMap, currentPage,
					new Sort(Sort.Direction.DESC, "createTime"));
			request.setAttribute("tools", tools);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("objectMap", objectMap);

		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "system/module/module_list";
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

	@RequestMapping(value = "/system/module/save", method = RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response, Module module) {
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();
		message.setResponseCode(MessageObject.ResponseCode.SUCCESS);
		try {
			String pid = request.getParameter("pId");
			Module parent = moduleService.get(pid);
			module.setModule(parent);
			String iconId = request.getParameter("iconId");
			module.setIcon(iconService.get(iconId));
			moduleService.save(module);
			message.setResponseMessage(ResponseMessage.SAVE_SUCCESS_MESSAGE);
		} catch (ServiceException e) {
			e.printStackTrace();
			message.setResponseMessage(ResponseMessage.SAVE_FAILIAR_MESSAGE);
		} finally {
			try {
				message.returnData(response, message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/system/module/delete", method = RequestMethod.POST)
	public void delete(HttpServletRequest request, HttpServletResponse response) {
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
				messageObject.setResponseMessage("角色菜单成功");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			messageObject.setResponseCode(ResponseCode.FAILIAR);
			messageObject.setResponseMessage("角色菜单失败");
		} finally {
			try {
				messageObject.returnData(response, messageObject);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
