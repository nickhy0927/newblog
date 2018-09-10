package com.iss.article.dao;

import com.iss.article.entity.Article;
import com.orm.commons.service.HyJpaRepostiory;

/**
 * Created by yuanhuangd on 2017/8/9.
 */
public interface ArticleDao extends HyJpaRepostiory<Article, String> {
}
