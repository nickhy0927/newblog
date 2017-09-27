package com.iss.system.module.dto;

import java.util.List;

import com.iss.system.module.entity.Module;

/**
 * Created by yuanhuangd on 2017/8/1.
 */
public class ModuleDto {
    private Module module;
    private List<Module> modules;

    public ModuleDto(Module module,List<Module> modules) {
        this.module = module;
        this.modules = modules;
    }
    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public List<Module> getModules() {
        return modules;
    }

    public void setModules(List<Module> modules) {
        this.modules = modules;
    }
}
