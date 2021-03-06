package com.iss.system.module.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iss.system.icon.entity.Icon;
import com.orm.commons.utils.IdEntity;

/**
 * Created by yuanhuangd on 2017/7/24.
 *
 * @desc 菜单实体
 * @see com.iss.system.module.entity.Module
 */
@Entity
@Table(name = "t_s_module")
public class Module extends IdEntity {
    private String name;
    private String url;
    private Module module;
    private String descs;
    private String alias;// 别名称
    private String shows;// 是否显示
    private Icon icon;// 图标

    public String getShows() {
        return shows;
    }

    public void setShows(String shows) {
        this.shows = shows;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "pid")
    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "icon_id")
    public Icon getIcon() {
        return icon;
    }

    public void setIcon(Icon icon) {
        this.icon = icon;
    }
}
