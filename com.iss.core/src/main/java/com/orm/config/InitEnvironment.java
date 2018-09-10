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

    private String loginUrl;//登录页面
    private String ignoreResources;// 需要忽略的文件或者路径
    private String unauthUrl;// 未认证的页面
    private String indexUrl;//首页
    private String initPassword;

    private String initUsername;
    private List<String> urls;

    public List<String> getUrls() {
        return urls;
    }

    public void setUrls(List<String> urls) {
        this.urls = urls;
    }

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
        log.info("环境正在初始化");
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

    public String getIndexUrl() {
        return indexUrl;
    }

    public void setIndexUrl(String indexUrl) {
        this.indexUrl = indexUrl;
    }

    public void setLoginUrl(String loginUrl) {
        this.loginUrl = loginUrl;
    }

    public String getLoginUrl() {
        return loginUrl;
    }
}
