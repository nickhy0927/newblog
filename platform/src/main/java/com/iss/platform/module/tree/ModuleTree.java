package com.iss.platform.module.tree;

import com.iss.platform.module.entity.Module;

/**
 * Created by yuanhuangd on 2017/7/28.
 */
public class ModuleTree {
    private String id;
    private String name;
    private String pId;
    private boolean isParent;

    public ModuleTree (Module module) {
        this.id = module.getId();
        this.name = module.getName();
        this.pId = module.getModule() != null ? module.getModule().getId() : "";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public boolean isParent() {
        return isParent;
    }

    public void setParent(boolean parent) {
        isParent = parent;
    }
}
