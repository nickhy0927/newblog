package com.iss.system.userRole.tree;

import com.iss.system.role.entity.Role;

/**
 * Created by yuanhuangd on 2017/7/28.
 */
public class TreeObj {
    private String id;
    private String name;
    private String pId;
    private boolean isParent;

    public TreeObj(Role role) {
        this.id = role.getId();
        this.name = role.getRoleName();
        this.pId = role.getRole() != null ? role.getRole().getId() : "";
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
