package com.iss.init;

import com.orm.config.SpringContextHolder;

public class EnvironmentServer {

	private String nginxServer;
	
	public String getNginxServer() {
		return nginxServer;
	}
	
	public void setNginxServer(String nginxServer) {
		this.nginxServer = nginxServer;
	}
	
	private EnvironmentServer() {
		
	}
	
	public static EnvironmentServer getEnvironmentServerInstance() {
		return SpringContextHolder.getBean(EnvironmentServer.class);
	}
}
