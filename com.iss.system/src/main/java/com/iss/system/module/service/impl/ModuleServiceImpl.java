package com.iss.system.module.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iss.system.module.dao.ModuleDao;
import com.iss.system.module.entity.Module;
import com.iss.system.module.service.ModuleService;
import com.orm.commons.service.impl.DefaultAbstractService;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
@Service
public class ModuleServiceImpl extends DefaultAbstractService<Module, String> implements ModuleService {

    @Autowired
    private ModuleDao moduleDao;

    public List<Module> getModulesByPid() {
        return moduleDao.getModulesByPid();
    }

    @Override
    public List<Module> queryMouleListByPid(String pid) {
        return moduleDao.queryMouleListByPid(pid);
    }
}
