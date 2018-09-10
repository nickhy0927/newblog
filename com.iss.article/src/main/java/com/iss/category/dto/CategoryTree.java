package com.iss.category.dto;

import com.iss.category.entity.Category;

/**
 * Created by yuanhuangd on 2017/8/8.
 */
public class CategoryTree {
    private String pId;
    private String name;
    private String id;

    public CategoryTree(Category category) {
        this.id = category.getId();
        this.name = category.getName();
        this.pId = category.getCategory() != null ? category.getCategory().getId() : null;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
