package com.iss.pages.operate;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OperateController {

	private static final String userDir = System.getProperty("user.dir") + "\\src\\main\\webapp\\WEB-INF\\views";

	@RequestMapping(value = "/execate")
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String headerContent = "<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\r\n"
				+ "<%@ taglib prefix=\"pgs\" uri=\"http://www.commons.page\" %>\r\n"
				+ "<%@taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>\r\n"
				+ "<c:set value=\"${pageContext.request.contextPath}\" var=\"ctx\" />\r\n";
		StringBuffer buffer = new StringBuffer();
		buffer.append(headerContent);// 添加头部信息

		buffer.append("<psg:extends name=\"title\">标题</psg:extends>\r\n");// 标题信息

		buffer.append("<psg:extends name=\"javascript\">\r\n");// JavaScript部分
		buffer.append("		<script type=\"text/javascript\"></script>\r\n");
		buffer.append("</psg:extends>\r\n");// JavaScript部分
		buffer.append("<psg:extends name=\"body\">\r\n");// 内容部分

		buffer.append("</psg:extends>\r\n");// 内容部分结束
		String footerContent = "<jsp:include page=\"/parent_page/parent.jsp\"/>\r\n";
		buffer.append(footerContent);

		String content = buffer.toString();

		try {
			List<Map<String,List<Map<String,Object>>>> maps = ReadXml.getInstance().getProperties();
			for (Map<String, List<Map<String, Object>>> map : maps) {
				List<Map<String, Object>> list = map.get("add");
				
			}
			System.out.println(maps.toString());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.getWriter().write(content);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// File file = new File();

	}

	public static void main(String[] args) {
		System.out.println("用户的当前工作目录: " + System.getProperty("user.dir") + "\\src\\main\\webapp\\WEB-INF\\views");
	}
}
