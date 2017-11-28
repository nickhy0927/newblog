package com.iss.category;

import com.iss.category.dto.CategoryDto;
import com.iss.category.entity.Category;
import com.iss.category.service.CategoryService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.MessageObject.ResponseCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/allow")
public class CategoryContoller {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/index.json")
    public void getIndexContent(HttpServletResponse response) {
        Map<String, Object> paramMap = new HashMap<>();
        MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();;
        try {
            List<CategoryDto> cates = new ArrayList<>();
            paramMap.put("category.id_eq", "1");
            List<Category> categories = categoryService.queryByMap(paramMap);
            for (Category category : categories) {
                paramMap.put("category.id_eq", category.getId());
                List<Category> list = categoryService.queryByMap(paramMap);
                cates.add(new CategoryDto(category, list));
            }
            messageObject.setInforMessage("获取栏目信息成功");
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("categories", cates);
            messageObject.setObject(resultMap);
        } catch (ServiceException e) {
            e.printStackTrace();
        } finally {
            try {
				messageObject.returnData(response, messageObject);
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
    }
}
