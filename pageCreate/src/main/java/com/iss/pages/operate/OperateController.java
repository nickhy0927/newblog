package com.iss.pages.operate;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.WebUtils;

@Controller
public class OperateController {

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/execate.json", method = { RequestMethod.POST })
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> paramsToMap = WebUtils.getParamsToMap(request);
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();;
		try {
			Map<String, Object> maps = ReadXml.getInstance().getProperties(paramsToMap);
			Map<String, String> map = (Map<String, String>) maps.get("content");
			String add_content = map.get("add");
			if (paramsToMap.get("add") != null) {
				String object = paramsToMap.get("add").toString();
				createPage(add_content, paramsToMap, maps, object);
			}
			String edit_content = map.get("edit");
			if (paramsToMap.get("edit") != null) {
				String object = paramsToMap.get("edit").toString();
				createPage(edit_content, paramsToMap, maps, object);
			}
			messageObject.setInforMessage("创建页面成功");
		} catch (Exception e1) {
			e1.printStackTrace();
			messageObject.setInforMessage("创建页面失败");
		}

		try {
			messageObject.returnData(response, messageObject);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void createPage(String pageContent, Map<String, Object> paramsToMap, Map<String, Object> maps,
			String moduleName) throws IOException {
		String headerContent = "<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\r\n"
				+ "<%@ taglib prefix=\"pgs\" uri=\"http://www.commons.page\" %>\r\n"
				+ "<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>\r\n"
				+ "<c:set value=\"${pageContext.request.contextPath}\" var=\"ctx\" />\r\n";
		StringBuffer buffer = new StringBuffer();
		buffer.append(headerContent);// 添加头部信息

		buffer.append("<pgs:extends name=\"title\">标题</pgs:extends>\r\n");// 标题信息

		buffer.append("<pgs:extends name=\"javascript\">\r\n");// JavaScript部分
		buffer.append("	<script type=\"text/javascript\"></script>\r\n");
		buffer.append("</pgs:extends>\r\n");// JavaScript部分
		buffer.append("<pgs:extends name=\"body\">\r\n");// 内容部分
		buffer.append(pageContent);
		buffer.append("</pgs:extends>\r\n");// 内容部分结束
		String footerContent = "<jsp:include page=\"/parent_page/parent.jsp\"/>\r\n";
		buffer.append(footerContent);
		Object direcroy = paramsToMap.get("direcroy");
		String name = (String) maps.get("name");
		String folder = direcroy.toString() + File.separatorChar + name + File.separatorChar;
		File file = new File(folder);
		if (!file.exists()) {
			file.mkdirs();
		}
		String content = buffer.toString();
		byte[] bytes = content.getBytes();
		InputStream fin = new ByteArrayInputStream(bytes);
		FileUtils.copyInputStreamToFile(fin, new File(folder, name + "-" + moduleName + ".jsp"));
		
	}

	public static void main(String[] args) {
		System.out.println("用户的当前工作目录: " + System.getProperty("user.dir") + "\\src\\main\\webapp\\WEB-INF\\views");
	}
}
