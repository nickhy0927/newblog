package com.iss.praise.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iss.article.entity.Article;
import com.iss.system.user.entity.User;
import com.orm.commons.utils.IdEntity;

/**
 * Created by yuanhuangd on 2017/8/8.
 * 点赞
 */
@Entity
@Table(name = "t_c_praise")
public class Praise extends IdEntity{
    private User user;
    private Article article;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "article_id")
    public Article getArticle() {
        return article;
    }


    public void setArticle(Article article) {
        this.article = article;
    }
}
