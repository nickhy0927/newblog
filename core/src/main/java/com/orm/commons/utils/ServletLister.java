package com.orm.commons.utils;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ServletLister implements ServletContextListener {
	private static Logger logger = LoggerFactory.getLogger(ServletLister.class);

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent servletContext) {
		logger.info("ServletLister容器正在装载");
		try {
			MyConfig config = MyConfig.getInstance();// 存放配置信息，用Map实现
			Enumeration<String> parameters = servletContext.getServletContext().getInitParameterNames();
			while (parameters.hasMoreElements()) {
				String name = parameters.nextElement();
				// 相应的键值对存到map中
				config.addKeyTValue(name, servletContext.getServletContext().getInitParameter(name));
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		HashMap<String, Object> hashMap = MyConfig.getConfig();
		Object object = hashMap.get("upload");
		File file = new File(object.toString());
		file.setWritable(true, true);
		file.setReadable(true, true);
		if (!file.exists()) {
			file.mkdirs();
		}
		logger.info("文件目录为：" + file.getAbsolutePath());
		logger.info("ServletLister容器装载完成");
	}

}
