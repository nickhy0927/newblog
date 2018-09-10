package com.iss.platform.attachment.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iss.init.EnvironmentServer;
import com.iss.platform.attachment.entity.MemberAttachment;
import com.iss.platform.attachment.service.MemberAttachmentService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.Pager;
import com.orm.commons.utils.WebUtils;

@Controller
public class MemberAttachmentController {

	@Autowired
	private MemberAttachmentService memberAttachmentService;

	@RequestMapping(value = "/member/attachment/list", method = { RequestMethod.POST, RequestMethod.GET })
	public String list(HttpServletRequest request, Model model) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		String currentPage = request.getParameter("currentPage");
		try {
			ObjectTools<MemberAttachment> tools = memberAttachmentService.queryPageByMap(objectMap, currentPage,
					new Sort(Sort.Direction.DESC, "createTime"), new Pager(6));
			model.addAttribute("tools", tools);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("server", EnvironmentServer.getEnvironmentServerInstance().getNginxServer());
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "member/attachment/attachment-list";
	}

	@RequestMapping(value = "/member/attachment/add")
	public String add() {
		return "member/attachment/attachment-add";
	}

	@RequestMapping(value = "/member/attachment/edit")
	public String edit(HttpServletRequest request, Model model) {
		try {
			String id = request.getParameter("id");
			MemberAttachment memberAttachment = memberAttachmentService.get(id);
			model.addAttribute("attachment", memberAttachment);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "member/attachment/attachment-add";
	}

	@RequestMapping(value = "/member/attachment/save", method = RequestMethod.POST)
	public MessageObject save(HttpServletRequest request, HttpServletResponse response) {
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		try {
			messageObject.ok("添加广告出成功", request);
		} catch (Exception e) {
			e.printStackTrace();
			messageObject.error("添加广告失败，请稍候再试");
		} 
		return messageObject;
	}
}
