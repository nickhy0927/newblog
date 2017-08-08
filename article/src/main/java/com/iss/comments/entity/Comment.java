package com.iss.comments.entity;

import com.iss.article.entity.Article;
import com.iss.platform.user.entity.User;
import com.orm.commons.utils.IdEntity;

import javax.persistence.*;

/**
 * Created by yuanhuangd on 2017/8/8.
 * 描述：评论
 */
@Entity
@Table(name = "t_c_comment")
public class Comment extends IdEntity{
    private String content;// 评论内容
    private Article article;
    private User user;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "article_id")
    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
