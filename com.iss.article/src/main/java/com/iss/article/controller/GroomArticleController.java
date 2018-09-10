package com.iss.article.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iss.article.entity.Article;
import com.iss.article.service.ArticleService;
import com.iss.emuns.SysConstant;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;

@Controller
public class GroomArticleController {

	@Autowired
	private ArticleService articleService;

	@RequestMapping(value = "/content/article/groom/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(HttpServletRequest request) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		String currentPage = request.getParameter("currentPage");
		try {
			objectMap.put("disabled_eq", Boolean.FALSE);
			objectMap.put("approvalStatus_eq", SysConstant.ApprovalStatus.PASS);
			ObjectTools<Article> tools = articleService.queryPageByMap(objectMap, currentPage,
					new Sort(Sort.Direction.DESC, "createTime"));
			request.setAttribute("tools", tools);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("objectMap", objectMap);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "content/article/article-groom-list";
	}

	@ResponseBody
	@RequestMapping(value = "/content/article/groom/approval", method = { RequestMethod.POST })
	public MessageObject approval(HttpServletRequest request) {
		String id = request.getParameter("id");
		String groom = request.getParameter("groom");
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();;
		try {
			Article article = articleService.get(id);
			article.setGroom(Integer.valueOf(groom));
			articleService.save(article);
			message.ok("推荐成功", article);
		} catch (ServiceException e) {
			e.printStackTrace();
			message.error("推荐失败");
		} 
		return message;
	}
}
