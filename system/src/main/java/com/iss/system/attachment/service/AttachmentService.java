package com.iss.system.attachment.service;

import com.iss.system.attachment.entity.Attachment;
import com.orm.commons.service.BaseService;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

/**
 * Created by yuanhuangd on 2017/8/17.
 */
public interface AttachmentService extends BaseService<Attachment, String> {

    List<Attachment> fileUpload(MultipartHttpServletRequest request);
}
