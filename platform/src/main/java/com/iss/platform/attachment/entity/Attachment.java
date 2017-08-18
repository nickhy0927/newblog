package com.iss.platform.attachment.entity;

import com.orm.commons.utils.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by yuanhuangd on 2017/8/17.
 * 用户图像
 */
@Entity
@Table(name = "t_p_picture")
public class Attachment extends IdEntity {

    private String fileName;// 图像名称
    private String filePath;// 图像路径
    private String fileSize;// 图像大小
    private String fileType;// 图像类型

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
