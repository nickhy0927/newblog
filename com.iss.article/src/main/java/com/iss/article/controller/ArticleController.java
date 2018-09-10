package com.iss.article.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iss.article.entity.Article;
import com.iss.article.service.ArticleService;
import com.iss.category.dto.CategoryTree;
import com.iss.category.entity.Category;
import com.iss.category.service.CategoryService;
import com.iss.emuns.SysConstant;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.WebUtils;

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
            paramsMap.put("id_ne", String.valueOf(1));
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

    @ResponseBody
    @RequestMapping(value = "/content/article/save", method = RequestMethod.POST)
    public MessageObject save(Article article, String pId) {
        MessageObject message = MessageObject.getDefaultMessageObjectInstance();;
        try {
            Category parent = categoryService.get(pId);
            article.setCategory(parent);
            article = articleService.save(article);
            message.ok("添加文章成功", article);
        } catch (ServiceException e) {
            e.printStackTrace();
            message.error("添加文章异常，请稍候再试");
        } 
        return message;
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
            request.setAttribute("acticle", articleService.get(id));
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

    @ResponseBody
    @RequestMapping(value = "/content/article/delete", method = RequestMethod.POST)
    public MessageObject delete(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();;
        try {
            if (StringUtils.isNotEmpty(id)) {
                Category category = categoryService.get(id);
                category.setDisabled(Boolean.TRUE);
                category = categoryService.save(category);
                messageObject.ok("分类删除成功", category);
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            messageObject.error("分类删除失败");
        }
        return messageObject;
    }

    @RequestMapping(value = "/content/article/approvalList", method = {RequestMethod.GET, RequestMethod.POST})
    public String approvalList(HttpServletRequest request) {
        Map<String, Object> objectMap = WebUtils.getRequestToMap(request);
        String currentPage = request.getParameter("currentPage");
        try {
            objectMap.put("disabled_eq", Boolean.FALSE);
            objectMap.put("approvalStatus_eq", SysConstant.ApprovalStatus.DEFUALT);
            ObjectTools<Article> tools = articleService.queryPageByMap(objectMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            request.setAttribute("tools", tools);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("objectMap", objectMap);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "content/article/article-approval";
    }

    @ResponseBody
    @RequestMapping(value = "/content/article/approval", method = {RequestMethod.POST})
    public MessageObject approval(@RequestParam String id, @RequestParam Integer approvalStatus, HttpServletResponse response) {
        MessageObject message = MessageObject.getDefaultMessageObjectInstance();
        try {
            Article article = articleService.get(id);
            article.setApprovalStatus(approvalStatus);
            articleService.save(article);
            if (Integer.valueOf(approvalStatus) == SysConstant.ApprovalStatus.REFUSE)
                message.ok("审核通过", article);
            else
                message.error("审核拒绝");
        } catch (ServiceException e) {
            e.printStackTrace();
            message.error("审核失败");
        } 
        return message;
    }
}
