package com.iss.platform.attachment.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.orm.commons.utils.IdEntity;

/**
 * Created by yuanhuangd on 2017/8/17. 用户图像
 */
@Entity
@Table(name = "t_p_member_attach")
public class MemberAttachment extends IdEntity {

	private String fileName;// 图像名称
	private String filePath;// 图像路径
	private String fileSize;// 图像大小
	private String fileType;// 图像类型
	private String type;// 文件类型 1 图片 2 文件

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
}
