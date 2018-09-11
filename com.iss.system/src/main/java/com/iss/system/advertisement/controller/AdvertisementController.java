package com.iss.system.advertisement.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iss.init.EnvironmentServer;
import com.iss.listener.SingletonUser;
import com.iss.system.advertisement.entity.Advertisement;
import com.iss.system.advertisement.service.AdvertisementService;
import com.iss.system.attachment.entity.Attachment;
import com.iss.system.attachment.service.AttachmentService;
import com.iss.system.user.entity.User;
import com.iss.util.PageSupport;
import com.iss.util.PagerInfo;
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

	@RequestMapping(value = "/system/advertisement/advertisement-list.do", method = { RequestMethod.GET })
	public String list() {
		return "system/advertisement/advertisement-list";
	}

	@ResponseBody
	@RequestMapping(value = "/system/advertisement/advertisement-list.json", method = { RequestMethod.POST })
	public MessageObject list(HttpServletRequest request, PageSupport pageSupport) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		try {
			PagerInfo<Advertisement> pagerInfo = advertisementService.queryPagerInfoByMap(objectMap, pageSupport, new Sort(Sort.Direction.DESC, "createTime"));
			messageObject.ok("获取广告列表成功", pagerInfo);
		} catch (ServiceException e) {
			e.printStackTrace();
			messageObject.error("获取广告列表失败");
		}
		return messageObject;
	}

	@RequestMapping(value = "/system/advertisement/advertisement-add.do")
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

	@ResponseBody
	@RequestMapping(value = "/system/advertisement/save", method = RequestMethod.POST)
	public MessageObject save(HttpServletRequest request) {
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();
		try {
			String[] titles = request.getParameterValues("title");
			for (int i = 0; i < titles.length; i++) {
				String title = titles[i];
				Advertisement advertisement = new Advertisement();
				advertisement.setTitle(title);
				advertisement.setUrl(request.getParameter("url_" + (i + 1)));
				advertisement.setSort(StringUtils.isNotEmpty(request.getParameter("url_" + (i + 1)))
						? request.getParameter("sort_" + (i + 1))
						: 0 + "");
				String filePath = request.getParameter("myfiles_" + (i + 1));
				User user = SingletonUser.getContextUser(request);
				MessageObject messageObject = attachmentService.fileUpload(request, filePath, user.getId());
				Object object = messageObject.getObject();
				advertisement.setAttachment((Attachment) object);
				advertisement.setUser(SingletonUser.getContextUser(request));
				advertisementService.save(advertisement);
			}
			message.ok("添加广告成功", titles);
		} catch (ServiceException e) {
			e.printStackTrace();
			message.error("添加广告失败，请稍候再试");
		}
		return message;
	}
}
