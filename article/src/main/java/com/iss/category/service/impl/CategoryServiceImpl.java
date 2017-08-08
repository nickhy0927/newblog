package com.iss.category.service.impl;

import com.iss.category.entity.Category;
import com.iss.category.service.CategoryService;
import com.orm.commons.service.impl.DefaultAbstractService;
import org.springframework.stereotype.Service;

/**
 * Created by yuanhuangd on 2017/8/8.
 */
@Service
public class CategoryServiceImpl extends DefaultAbstractService<Category,String> implements CategoryService{
}
