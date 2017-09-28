package com.iss.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iss.category.entity.Category;
import com.iss.category.service.CategoryService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.MessageObject.ResponseCode;

@Controller
@RequestMapping(value = "/allow")
public class CategoryContoller {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/index.json")
	public void getIndexContent(HttpServletResponse response) {
		Map<String, Object> paramMap = new HashMap<>();
		MessageObject messageObject = new MessageObject();
		try {
			List<Category> categories = categoryService.queryByMap(paramMap);
			messageObject.setInforMessage("获取栏目信息成功");
			messageObject.setResposecode(ResponseCode.code_200);
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("categories", categories);
			messageObject.setObject(resultMap);
		} catch (ServiceException e) {
			e.printStackTrace();
		} finally {
			messageObject.getWriter(response, messageObject);
		}
	}
}
