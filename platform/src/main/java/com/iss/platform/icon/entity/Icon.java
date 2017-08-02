package com.iss.platform.icon.entity;

import com.orm.commons.utils.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by yuanhuangd on 2017/8/1.
 */
@Entity
@Table(name = "t_p_icon")
public class Icon extends IdEntity{
    private String name;// 图标名称
    private String className;// 图标样式

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
