package com.iss.index;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iss.system.module.dto.ModuleDto;
import com.iss.system.module.entity.Module;
import com.iss.system.module.service.ModuleService;

/**
 * Created by yuanhuangd on 2017/7/26.
 */
@Controller
public class IndexController {

    @Autowired
    private ModuleService moduleService;

    @RequestMapping(value = {"", "/", "index.do"})
    public ModelAndView index(HttpServletRequest request) {
        // 获得所有的菜单信息
        List<ModuleDto> moduleList = new ArrayList<>();
        List<Module> modules = moduleService.queryMouleListByPid(String.valueOf(1));
        for (Module module : modules) {
            moduleList.add(new ModuleDto(module, moduleService.queryMouleListByPid(module.getId())));
        }
        ModelAndView view = new ModelAndView("index");
        request.setAttribute("moduleList", moduleList);
        return view;
    }
}
