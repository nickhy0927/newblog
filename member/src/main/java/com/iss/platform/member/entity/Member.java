package com.iss.platform.member.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.orm.commons.utils.IdEntity;

/**
 * 
 * @see com.iss.platform.member.entity.Member 会员
 */
@Entity
@Table(name = "t_p_member")
public class Member extends IdEntity {
	private String loginName;// 登录账户
	private String alisa;// 别名
	private String password;// 密码

	private char sex;// 性别

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getAlisa() {
		return alisa;
	}

	public void setAlisa(String alisa) {
		this.alisa = alisa;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

}
