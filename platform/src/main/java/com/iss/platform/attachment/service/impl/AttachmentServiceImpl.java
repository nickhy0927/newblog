package com.iss.platform.attachment.service.impl;

import com.iss.platform.attachment.dao.Attachment;
import com.iss.platform.attachment.service.AttachmentService;
import com.orm.commons.service.impl.DefaultAbstractService;
import org.springframework.stereotype.Service;

/**
 * Created by yuanhuangd on 2017/8/17.
 */
@Service
public class AttachmentServiceImpl extends DefaultAbstractService<Attachment, String> implements AttachmentService {
}
