package com.iss.platform.attachment.service.impl;

import org.springframework.stereotype.Service;

import com.iss.platform.attachment.entity.MemberAttachment;
import com.iss.platform.attachment.service.MemberAttachmentService;
import com.orm.commons.service.impl.DefaultAbstractService;

/**
 * Created by yuanhuangd on 2017/8/17.
 */
@Service
public class MemberAttachmentServiceImpl extends DefaultAbstractService<MemberAttachment, String> implements MemberAttachmentService {
}
