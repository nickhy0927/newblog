package com.iss.system.module.service;

import java.util.List;

import com.iss.system.module.entity.Module;
import com.orm.commons.service.BaseService;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public interface ModuleService extends BaseService<Module, String> {
    List<Module> getModulesByPid();

    List<Module> queryMouleListByPid(String pid);
}
