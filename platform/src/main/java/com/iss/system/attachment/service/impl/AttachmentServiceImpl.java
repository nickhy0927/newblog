package com.iss.system.attachment.service.impl;

import org.springframework.stereotype.Service;

import com.iss.system.attachment.entity.Attachment;
import com.iss.system.attachment.service.AttachmentService;
import com.orm.commons.service.impl.DefaultAbstractService;

/**
 * Created by yuanhuangd on 2017/8/17.
 */
@Service
public class AttachmentServiceImpl extends DefaultAbstractService<Attachment, String> implements AttachmentService {
}
