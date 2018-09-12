package com.iss.system.log.service.impl;

import com.iss.system.log.entity.OperateLog;
import com.iss.system.log.service.OperateLogService;
import com.orm.commons.service.impl.DefaultAbstractService;
import org.springframework.stereotype.Service;

@Service
public class OperateLogServiceImpl extends DefaultAbstractService<OperateLog,String> implements OperateLogService {
}
