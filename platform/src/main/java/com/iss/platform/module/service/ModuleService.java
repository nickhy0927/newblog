package com.iss.platform.module.service;

import com.iss.platform.module.entity.Module;
import com.orm.commons.service.BaseService;

import java.util.List;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public interface ModuleService extends BaseService<Module, String> {
    List<Module> getModulesByPid();

    List<Module> queryMouleListByPid(String pid);
}
