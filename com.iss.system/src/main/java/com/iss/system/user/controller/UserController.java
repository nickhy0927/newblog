package com.iss.system.user.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iss.system.user.entity.User;
import com.iss.system.user.service.UserService;
import com.iss.util.PageSupport;
import com.iss.util.PagerInfo;
import com.orm.commons.encryption.MD5Encryption;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectIterable;
import com.orm.commons.utils.WebUtils;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/system/user/list", method = { RequestMethod.GET })
	public String list() {
		return "system/user/user_list";
	}

	@ResponseBody
	@RequestMapping(value = "/system/user/list.json", method = { RequestMethod.POST })
	public MessageObject list(HttpServletRequest request, PageSupport support) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		objectMap.put("disabled_eq", Boolean.FALSE);
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		try {
			Sort sort = new Sort(Sort.Direction.DESC, "createTime");
			PagerInfo<User> pagerInfo = userService.queryPagerInfoByMap(objectMap, support, sort);
			messageObject.ok("查询用户列表成功", pagerInfo);
		} catch (ServiceException e) {
			e.printStackTrace();
			messageObject.error("查询用户列表失败");
		} 
		return messageObject;
	}

	@RequestMapping(value = "/system/user/add")
	public String add() {
		return "system/user/user_add";
	}

	@RequestMapping(value = "/system/user/edit")
	public String edit(HttpServletRequest request) {
		String id = request.getParameter("id");
		try {
			User user = userService.get(id);
			request.setAttribute("user", user);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "system/user/user_edit";
	}

	@ResponseBody
	@RequestMapping(value = "/system/user/save", method = RequestMethod.POST)
	public MessageObject save(User user, HttpServletResponse response) {
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();
		try {
			user.setPassword(MD5Encryption.MD5(user.getPassword()));
			user = userService.save(user);
			message.ok("添加用户成功", user);
		} catch (ServiceException e) {
			e.printStackTrace();
			message.error("添加用户异常，请稍候再试");
		} 
		return message;
	}

	@RequestMapping(value = "/system/user/checkLoginName.json", method = { RequestMethod.POST, RequestMethod.GET })
	public void checkLoginName(HttpServletResponse response, HttpServletRequest request) {
		String loginName = request.getParameter("loginName");
		User user = userService.findUserByLoginName(loginName);
		try {
			if (user != null) {
				response.getWriter().print(false);
			} else
				response.getWriter().print(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/system/user/delete", method = RequestMethod.POST)
	public MessageObject delete(@RequestParam String id) {
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		try {
			if (StringUtils.isNotEmpty(id)) {
				String[] ids = id.split(",");
				List<User> users = new ArrayList<>();
				for (int i = 0; i < ids.length; i++) {
					id = ids[i];
					User user = userService.get(id);
					user.setDisabled(Boolean.TRUE);
					users.add(user);
				}
				userService.saveBatch(new ObjectIterable<User>(users));
				messageObject.ok("删除用户成功", new ObjectIterable<User>(users));
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			messageObject.error("删除用户失败");
		}
		return messageObject;
	}
}
