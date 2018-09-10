package com.iss.platform.member.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iss.article.entity.Article;
import com.iss.platform.attachment.entity.MemberAttachment;
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
	private MemberAttachment attachment;// 用户图像
	private List<MemberAttachment> pictureList;// 用户相册
	private List<MemberAttachment> attachmentList;// 用户附件
	
	private List<Article> articleList;// 用户发布的文章

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "t_p_member_article", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "article_id"))
	public List<Article> getArticleList() {
		return articleList;
	}
	
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pic_id")
	public MemberAttachment getAttachment() {
		return attachment;
	}

	public void setAttachment(MemberAttachment attachment) {
		this.attachment = attachment;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "t_p_member_pic", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "attach_id"))
	public List<MemberAttachment> getPictureList() {
		return pictureList;
	}

	public void setPictureList(List<MemberAttachment> pictureList) {
		this.pictureList = pictureList;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "t_p_member_file", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "attach_id"))
	public List<MemberAttachment> getAttachmentList() {
		return attachmentList;
	}

	public void setAttachmentList(List<MemberAttachment> attachmentList) {
		this.attachmentList = attachmentList;
	}

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
