package com.iss.category.dto;

import com.iss.category.entity.Category;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by yuanhuangd on 2017/9/28.
 */
public class CategoryDto {

    private String name;
    private Boolean shows;
    private String id;// ID
    private Date updateTime;
    private Boolean disabled;
    private List<CategoryDto> children;

    public CategoryDto(Category category, List<Category> categories) {
        this.name = category.getName();
        this.shows = category.getShows();
        this.id = category.getId();// ID
        this.updateTime = category.getUpdateTime();
        this.disabled = category.getDisabled();
        if (categories.size() > 0) {
            List<CategoryDto> cates = new ArrayList<>();
            for (Category cate : categories) {
                cates.add(new CategoryDto(cate, new ArrayList<Category>()));
            }
            this.children = cates;
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getShows() {
        return shows;
    }

    public void setShows(Boolean shows) {
        this.shows = shows;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }

    public List<CategoryDto> getChildren() {
        return children;
    }

    public void setChildren(List<CategoryDto> children) {
        this.children = children;
    }
}
