package com.iss.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iss.article.entity.Article;
import com.iss.article.service.ArticleService;
import com.iss.category.dto.CategoryDto;
import com.iss.category.entity.Category;
import com.iss.category.service.CategoryService;
import com.iss.emuns.SysConstant;
import com.iss.init.EnvironmentServer;
import com.iss.system.advertisement.entity.Advertisement;
import com.iss.system.advertisement.service.AdvertisementService;
import com.orm.commons.exception.ServiceException;

@Controller
public class IndexController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private AdvertisementService advertisementService;

	@Autowired
	private ArticleService articleService;

	@RequestMapping(value = { "/", "/index" })
	public String index(Model model) {
		Map<String, Object> paramMap = new HashMap<>();
		try {
			List<CategoryDto> cates = new ArrayList<>();
			paramMap.put("category.id_eq", "1");
			List<Category> categories = categoryService.queryByMap(paramMap,new Sort(Sort.Direction.ASC, "sort"));
			for (Category category : categories) {
				paramMap.put("category.id_eq", category.getId());
				List<Category> list = categoryService.queryByMap(paramMap);
				cates.add(new CategoryDto(category, list));
			}
			model.addAttribute("categories", cates);
			paramMap = new HashMap<>();
			List<Advertisement> list = advertisementService.queryByMap(paramMap);
			model.addAttribute("ads", list);
			model.addAttribute("server", EnvironmentServer.getEnvironmentServerInstance().getNginxServer());
			paramMap = new HashMap<>();
			paramMap.put("groom_eq", SysConstant.isGroom.GROOM);
			List<Article> articles = articleService.queryByMap(paramMap);
			model.addAttribute("articles", articles);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "index";
	}
}
