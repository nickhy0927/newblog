package com.orm.commons.utils;

import java.util.HashMap;

/**
 * @author Curtain 存放配置参数
 */
public class MyConfig {
	public static HashMap<String, Object> config = new HashMap<String, Object>();

	public static MyConfig myconfig;

	public static HashMap<String, Object> getConfig() {
		return config;
	}

	public static MyConfig getInstance() {
		if (myconfig == null) {
			myconfig = new MyConfig();
		}
		return myconfig;
	}

	public static void setConfig(HashMap<String, Object> config) {

		MyConfig.config = config;
	}

	private MyConfig() {
	}

	public HashMap<String, Object> addKeyTValue(String name, String value) {
		MyConfig.config.put(name, value);
		return MyConfig.config;
	}
}
