package com.iss.system.roleModule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iss.system.module.entity.Module;
import com.iss.system.module.service.ModuleService;
import com.iss.system.module.tree.ModuleTree;
import com.iss.system.role.entity.Role;
import com.iss.system.role.service.RoleService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;

/**
 * Created by yuanhuangd on 2017/8/2.
 */
@Controller
public class RoleModuleController {

	@Autowired
	private RoleService roleService;

	@Autowired
	private ModuleService moduleService;

	@RequestMapping(value = "/system/role/module/add", method = { RequestMethod.GET })
	public String add(@RequestParam(value = "id") String id, Model model) {
		try {
			Role role = roleService.get(id);
			model.addAttribute("role", role);
			List<Module> list = role.getModules();
			List<ModuleTree> moduleTrees = new ArrayList<>();
			for (Iterator<Module> iterator = list.iterator(); iterator.hasNext();) {
				Module module = iterator.next();
				moduleTrees.add(new ModuleTree(module));
			}
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("id_ne", String.valueOf(1));
			paramMap.put("disabled_eq", Boolean.FALSE);
			List<Module> modules = moduleService.queryByMap(paramMap);
			List<ModuleTree> trees = new ArrayList<>();
			for (Module module : modules) 
				trees.add(new ModuleTree(module));
			model.addAttribute("json", new JsonMapper().toJson(trees));
			model.addAttribute("moduleTrees", new JsonMapper().toJson(moduleTrees));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "system/roleModule/role-module-add";
	}

	@ResponseBody
	@RequestMapping(value = "/system/role/module/save", method = { RequestMethod.POST })
	public MessageObject save(HttpServletRequest request, HttpServletResponse response) {
		String roleId = request.getParameter("roleId");
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();
		try {
			Role role = roleService.get(roleId);
			String ids = request.getParameter("ids");
			if (role != null && StringUtils.isNotEmpty(ids)) {
				List<Module> modules = roleService.queryRolesByIds(ids);
				role.setModules(modules);
			}
			role = roleService.save(role);
			message.ok("角色权限赋值成功", role);
		} catch (ServiceException e) {
			e.printStackTrace();
			message.error("角色权限赋值失败");
		}
		return message;
	}

}
