package com.iss.category.controller;

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

import com.iss.category.dto.CategoryTree;
import com.iss.category.entity.Category;
import com.iss.category.service.CategoryService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;

/**
 * Created by yuanhuangd on 2017/8/8.
 */
@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/content/category/add")
	public String add(HttpServletRequest request) {
		Map<String, Object> paramsMap = new HashMap<>();
		List<CategoryTree> trees = new ArrayList<>();
		try {
			paramsMap.put("disabled_eq", Boolean.FALSE);
			List<Category> categories = categoryService.queryByMap(paramsMap);
			for (Category category : categories) {
				trees.add(new CategoryTree(category));
			}
			request.setAttribute("json", new JsonMapper().toJson(trees));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "content/category/category-add";
	}

	@ResponseBody
	@RequestMapping(value = "/content/category/save", method = RequestMethod.POST)
	public MessageObject save(HttpServletRequest request, HttpServletResponse response, Category category) {
		MessageObject message = MessageObject.getDefaultMessageObjectInstance();
		;
		try {
			String pid = request.getParameter("pId");
			Category parent = categoryService.get(pid);
			category.setCategory(parent);
			category = categoryService.save(category);
			message.ok("添加分类成功", category);
		} catch (ServiceException e) {
			e.printStackTrace();
			message.error("添加分类异常，请稍候再试");
		}
		return message;
	}

	@RequestMapping(value = "/content/category/edit")
	public String edit(HttpServletRequest request) {
		String id = request.getParameter("id");
		Map<String, Object> paramsMap = new HashMap<>();
		List<CategoryTree> trees = new ArrayList<>();
		try {
			paramsMap.put("disabled_eq", Boolean.FALSE);
			List<Category> categories = categoryService.queryByMap(paramsMap);
			for (Category category : categories) {
				trees.add(new CategoryTree(category));
			}
			request.setAttribute("json", new JsonMapper().toJson(trees));
			request.setAttribute("category", categoryService.get(id));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "content/category/category-add";
	}

	@RequestMapping(value = "/content/category/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(HttpServletRequest request) {
		Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
		String currentPage = request.getParameter("currentPage");
		try {
			objectMap.put("disabled_eq", Boolean.FALSE);
			objectMap.put("id_ne", String.valueOf(1));
			ObjectTools<Category> tools = categoryService.queryPageByMap(objectMap, currentPage,
					new Sort(Sort.Direction.DESC, "createTime"));
			request.setAttribute("tools", tools);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("objectMap", objectMap);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "content/category/category-list";
	}

	@ResponseBody
	@RequestMapping(value = "/content/category/delete", method = RequestMethod.POST)
	public MessageObject delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		try {
			if (StringUtils.isNotEmpty(id)) {
				Category category = categoryService.get(id);
				category.setDisabled(Boolean.TRUE);
				categoryService.save(category);
				messageObject.ok("分类删除成功", category);
			} else messageObject.error("分类删除失败");
		} catch (ServiceException e) {
			e.printStackTrace();
			messageObject.error("分类删除失败");
		} 
		return messageObject;
	}

}
