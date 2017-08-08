package com.iss.article.entity;

import com.iss.category.entity.Category;
import com.iss.platform.user.entity.User;
import com.orm.commons.utils.IdEntity;

import javax.persistence.*;

/**
 * Created by yuanhuangd on 2017/8/8.
 * 描述：文章
 */
@Entity
@Table(name = "t_c_article")
public class Article extends IdEntity{

    private String title;
    private String content;

    private User user;
    private Category category;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
