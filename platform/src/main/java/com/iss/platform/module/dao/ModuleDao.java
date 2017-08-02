package com.iss.platform.module.dao;

import com.iss.platform.module.entity.Module;
import com.orm.commons.service.HyJpaRepostiory;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by yuanhuangd on 2017/7/24.
 */
public interface ModuleDao extends HyJpaRepostiory<Module, String> {
    @Query("select m from Module m where m.module.id is NULL")
    List<Module> getModulesByPid();

    @Query("select m from Module m where m.module.id = ?1")
    List<Module> queryMouleListByPid(String pid);
}
