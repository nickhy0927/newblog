package com.iss.system.module.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.iss.system.module.entity.Module;
import com.orm.commons.service.HyJpaRepostiory;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public interface ModuleDao extends HyJpaRepostiory<Module, String> {
    @Query("select m from Module m where m.module.id is NULL")
    List<Module> getModulesByPid();

    @Query("select m from Module m where m.module.id = ?1")
    List<Module> queryMouleListByPid(String pid);
}
