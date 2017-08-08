package com.iss.category.entity;

import com.orm.commons.utils.IdEntity;

import javax.persistence.*;

/**
 * Created by yuanhuangd on 2017/8/8.
 * 文章分类
 */
@Entity
@Table(name = "t_c_category")
public class Category extends IdEntity {

    private String name;

    private Boolean shows = Boolean.TRUE;
    private Category category;

    public Boolean getShows() {
        return shows;
    }

    public void setShows(Boolean shows) {
        this.shows = shows;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pid")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
