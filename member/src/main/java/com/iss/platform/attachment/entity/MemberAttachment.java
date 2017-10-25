package com.iss.platform.attachment.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iss.platform.member.entity.Member;
import com.iss.system.attachment.entity.Attachment;
import com.orm.commons.utils.IdEntity;

/**
 * Created by yuanhuangd on 2017/8/17. 用户图像
 */
@Entity
@Table(name = "t_p_member_attach")
public class MemberAttachment extends IdEntity {

	private String type;// 文件类型 1 图片 2 文件
	
	private Member member;// 会员ID
	
	private Attachment attachment; // 会员相册
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "attach_id")
	public Attachment getAttachment() {
		return attachment;
	}
	
	public void setAttachment(Attachment attachment) {
		this.attachment = attachment;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
	public Member getMember() {
		return member;
	}
	
	public void setMember(Member member) {
		this.member = member;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
