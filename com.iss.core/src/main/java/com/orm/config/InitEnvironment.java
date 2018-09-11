package com.orm.config;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class InitEnvironment {
    private static InitEnvironment environment = null;
    private final static Logger log = LoggerFactory.getLogger(InitEnvironment.class);

    private static InitEnvironment getInitEnvironment() {

        return environment;
    }

    public static InitEnvironment getInitEnvironmentInstance() {
        return getInitEnvironment();
    }

    private String ignoreResources;// 需要忽略的文件或者路径
    private String unauthUrl;// 未认证的页面
    private String initPassword;

    private String initUsername;


    public String getIgnoreResources() {
        return ignoreResources;
    }

    public String getInitPassword() {
        return initPassword;
    }

    public String getInitUsername() {
        return initUsername;
    }

    public String getUnauthUrl() {
        return unauthUrl;
    }

    public void setUnauthUrl(String unauthUrl) {
        this.unauthUrl = unauthUrl;
    }

    public void init() {
        if (environment == null) {
            environment = SpringContextHolder.getBean(InitEnvironment.class);
        }
    }

    public void setIgnoreResources(String ignoreResources) {
        this.ignoreResources = ignoreResources;
    }

    public void setInitPassword(String initPassword) {
        this.initPassword = initPassword;
    }

    public void setInitUsername(String initUsername) {
        this.initUsername = initUsername;
    }
}
