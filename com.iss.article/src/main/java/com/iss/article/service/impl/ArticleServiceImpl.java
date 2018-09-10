package com.iss.article.service.impl;

import com.iss.article.entity.Article;
import com.iss.article.service.ArticleService;
import com.orm.commons.service.impl.DefaultAbstractService;
import org.springframework.stereotype.Service;

/**
 * Created by yuanhuangd on 2017/8/9.
 */
@Service
public class ArticleServiceImpl extends DefaultAbstractService<Article,String> implements ArticleService{
}
