package com.iss.system.role.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iss.system.module.entity.Module;
import com.orm.commons.utils.IdEntity;

/**
 * Created by yuanhuangd on 2017/7/24.
 * 
 * @see com.iss.platform.role.entity.Role
 * @desc 角色实体
 */
@Entity
@Table(name = "t_s_role")
public class Role extends IdEntity {
	private String roleName;
	private String roleDesc;
	private Role role;
	private List<Module> modules;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "t_s_role_module", joinColumns = @JoinColumn(name = "role_id"), inverseJoinColumns = @JoinColumn(name = "module_id"))
	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pid")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
}
