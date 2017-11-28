package com.iss.system.advertisement.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iss.init.EnvironmentServer;
import com.iss.listener.SingletonUser;
import com.iss.system.advertisement.entity.Advertisement;
import com.iss.system.advertisement.service.AdvertisementService;
import com.iss.system.attachment.entity.Attachment;
import com.iss.system.attachment.service.AttachmentService;
import com.iss.system.user.entity.User;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.Pager;
import com.orm.commons.utils.WebUtils;

/**
 * Created by yuanhuangd on 2017/9/29.
 */
@Controller
@Scope("prototype")
public class AdvertisementController {

	@Autowired
	private AttachmentService attachmentService;

	@Autowired
	private AdvertisementService advertisementService;

	@RequestMapping(value = "/system/advertisement/list", method = { RequestMethod.POST, RequestMethod.GET })
	public String list(HttpServletRequest request, Model model) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		String currentPage = request.getParameter("currentPage");
		try {
			ObjectTools<Advertisement> tools = advertisementService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"), new Pager(6));
			model.addAttribute("tools", tools);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("server", EnvironmentServer.getEnvironmentServerInstance().getNginxServer());
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "system/advertisement/advertisement-list";
	}

	@RequestMapping(value = "/system/advertisement/add")
	public String add() {
		return "system/advertisement/advertisement-add";
	}

	@RequestMapping(value = "/system/advertisement/edit")
	public String edit(HttpServletRequest request, Model model) {
		try {
			String id = request.getParameter("id");
			Advertisement advertisement = advertisementService.get(id);
			model.addAttribute("advertisement", advertisement);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "system/advertisement/advertisement-add";
	}

	@RequestMapping(value = "/system/advertisement/save", method = RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response) {
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();
		try {
			String[] titles = request.getParameterValues("title");
			for (int i = 0; i < titles.length; i++) {
				String title = titles[i];
				Advertisement advertisement = new Advertisement();
				advertisement.setTitle(title);
				advertisement.setUrl(request.getParameter("url_" + (i + 1)));
				advertisement.setSort(StringUtils.isNotEmpty(request.getParameter("url_" + (i + 1))) ? request.getParameter("sort_" + (i + 1)) : 0 + "");
				String filePath = request.getParameter("myfiles_" + (i + 1));
				User user = SingletonUser.getContextUser(request);
				MessageObject messageObject = attachmentService.fileUpload(request, filePath,user.getId());
				Object object = messageObject.getObject();
				advertisement.setAttachment((Attachment) object);
				advertisement.setUser(SingletonUser.getContextUser(request));
				advertisementService.save(advertisement);
			}
			message.setInforMessage("添加广告成功");
		} catch (ServiceException e) {
			message.setResponseCode(MessageObject.ResponseCode.FAILIAR);
			e.printStackTrace();
			message.setErrorMessage("添加广告失败，请稍候再试");
		} finally {
			try {
				message.returnData(response, message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
