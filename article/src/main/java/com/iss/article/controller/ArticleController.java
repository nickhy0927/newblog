package com.iss.article.controller;

import com.iss.article.entity.Article;
import com.iss.article.service.ArticleService;
import com.iss.category.dto.CategoryTree;
import com.iss.category.entity.Category;
import com.iss.category.service.CategoryService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yuanhuangd on 2017/8/9.
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/content/article/add")
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
        return "content/article/article-add";
    }

    @RequestMapping(value = "/content/article/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request, HttpServletResponse response, Article article) {
        MessageObject message = new MessageObject();
        try {
            String pid = request.getParameter("pId");
            Category parent = categoryService.get(pid);
            article.setCategory(parent);
            articleService.save(article);
            message.setResposecode(MessageObject.ResponseCode.code_200);
            message.setInforMessage("添加文章成功");
        } catch (ServiceException e) {
            e.printStackTrace();
            message.setErrorMessage("添加文章异常，请稍候再试");
        } finally {
            message.getWriter(response, message);
        }
    }

    @RequestMapping(value = "/content/article/edit")
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
            request.setAttribute("acticle",articleService.get(id));
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "content/article/article-add";
    }

    @RequestMapping(value = "/content/article/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(HttpServletRequest request) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        try {
            objectMap.put("disabled_eq", Boolean.FALSE);
            ObjectTools<Article> tools = articleService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            request.setAttribute("tools", tools);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("objectMap", objectMap);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "content/article/article-list";
    }
    @RequestMapping(value = "/content/article/delete", method = RequestMethod.POST)
    public void delete(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        MessageObject messageObject = new MessageObject();
        try {
            if (StringUtils.isNotEmpty(id)) {
                Category category = categoryService.get(id);
                category.setDisabled(Boolean.TRUE);
                categoryService.save(category);
                messageObject.setInforMessage("分类删除成功");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.setErrorMessage("分类删除失败");
        } finally {
            messageObject.getWriter(response, messageObject);
        }
    }
}
