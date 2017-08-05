package com.iss.platform.roleModule.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iss.platform.module.entity.Module;
import com.iss.platform.module.service.ModuleService;
import com.iss.platform.module.tree.ModuleTree;
import com.iss.platform.role.entity.Role;
import com.iss.platform.role.service.RoleService;
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

	@RequestMapping(value = "/platform/role/module/add", method = { RequestMethod.GET })
	public String add(HttpServletRequest request) {
		String id = request.getParameter("id");
		try {
			Role role = roleService.get(id);
			request.setAttribute("role", role);
			List<Module> list = role.getModules();
			List<ModuleTree> moduleTrees = new ArrayList<>();
			for (Iterator<Module> iterator = list.iterator(); iterator.hasNext();) {
				Module module = (Module) iterator.next();
				moduleTrees.add(new ModuleTree(module));
			}
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("id_ne", String.valueOf(1));
			paramMap.put("disabled_eq", Boolean.FALSE);
			List<Module> modules = moduleService.queryByMap(paramMap);
			List<ModuleTree> trees = new ArrayList<>();
			for (Module module : modules) {
				trees.add(new ModuleTree(module));
			}
			request.setAttribute("json", new JsonMapper().toJson(trees));
			request.setAttribute("moduleTrees", new JsonMapper().toJson(moduleTrees));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "platform/roleModule/role-module-add";
	}

	@RequestMapping(value = "/platform/role/module/save", method = { RequestMethod.POST })
	public void save(HttpServletRequest request, HttpServletResponse response) {
		String roleId = request.getParameter("roleId");
		MessageObject message = new MessageObject();
		try {
			Role role = roleService.get(roleId);
			String ids = request.getParameter("ids");
			if (role != null && StringUtils.isNotEmpty(ids)) {
				List<Module> modules = roleService.queryRolesByIds(ids);
				role.setModules(modules);
			}
			roleService.save(role);
			message.setInforMessage("角色权限赋值成功");
		} catch (ServiceException e) {
			e.printStackTrace();
			message.setInforMessage("角色权限赋值失败");
		} finally {
			message.getWriter(response, message);
		}
	}

}
