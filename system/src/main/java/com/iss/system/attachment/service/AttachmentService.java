package com.iss.system.attachment.service;

import com.iss.system.attachment.entity.Attachment;
import com.orm.commons.service.BaseService;
import com.orm.commons.utils.MessageObject;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yuanhuangd on 2017/8/17.
 */
public interface AttachmentService extends BaseService<Attachment, String> {

    List<Attachment> fileUpload(MultipartHttpServletRequest request);
    
    MessageObject fileUpload(HttpServletRequest request,String filePath);
}
