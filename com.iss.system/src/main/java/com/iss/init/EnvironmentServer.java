package com.iss.init;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.iss.system.module.entity.Module;
import com.iss.system.role.entity.Role;
import com.iss.system.user.entity.User;
import com.iss.system.user.service.UserService;
import com.orm.commons.exception.ServiceException;
import com.orm.config.SpringContextHolder;

public class EnvironmentServer {

	private String nginxServer;

	private static Map<String, List<String>> allowUrlsMap = new HashMap<>();

	public static List<String> getAllowUrls(User user) throws ServiceException {
		List<String> allowUrls = new ArrayList<>();
		if (user != null && user.getRoles() == null && allowUrlsMap.get(user.getId()) == null) {
			UserService userService = SpringContextHolder.getBean(UserService.class);
			user = userService.get(user.getId());
			for (Role role : user.getRoles()) {
				List<Module> modules = role.getModules();
				for (Module module : modules) {
					String mUrl = module.getUrl();
					if (!mUrl.startsWith("#")) {
						allowUrls.add(mUrl);
					}
				}
			}
			allowUrls.add("/index");
			allowUrlsMap.put(user.getId(), allowUrls);
		} else if (user == null) {
			return new ArrayList<>();
		}
		return allowUrlsMap.get(user.getId());
	}

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
