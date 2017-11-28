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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iss.system.user.entity.User;
import com.iss.system.user.service.UserService;
import com.orm.commons.encryption.MD5Encryption;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.MessageObject.ResponseCode;
import com.orm.commons.utils.ObjectIterable;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/system/user/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(HttpServletRequest request, Model model) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		String currentPage = request.getParameter("currentPage");
		objectMap.put("disabled_eq", Boolean.FALSE);
		try {
			ObjectTools<User> tools = userService.queryPageByMap(objectMap, currentPage,
					new Sort(Sort.Direction.DESC, "createTime"));
			model.addAttribute("tools", tools);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("objectMap", objectMap);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "system/user/user_list";
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

	@RequestMapping(value = "/system/user/save", method = RequestMethod.POST)
	public void save(User user, HttpServletResponse response) {
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();
		try {
			message.setResponseCode(MessageObject.ResponseCode.SUCCESS);
			user.setPassword(MD5Encryption.MD5(user.getPassword()));
			userService.save(user);
			message.setResponseMessage("添加用户成功");
		} catch (ServiceException e) {
			e.printStackTrace();
			message.setResponseCode(MessageObject.ResponseCode.FAILIAR);
			message.setResponseMessage("添加用户异常，请稍候再试");
		} finally {
			try {
				message.returnData(response, message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/user/query.json", method = { RequestMethod.POST, RequestMethod.GET })
	public void query(HttpServletResponse response) {
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		messageObject.setResponseMessage("查询成功");
		try {
			messageObject.returnData(response, messageObject);
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
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
				messageObject.setResponseCode(ResponseCode.SUCCESS);
				messageObject.setResponseMessage("删除用户成功");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			messageObject.setResponseCode(ResponseCode.FAILIAR);
			messageObject.setResponseMessage("删除用户失败");
		} finally {
			try {
				messageObject.returnData(response, messageObject);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
