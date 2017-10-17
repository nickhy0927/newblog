package com.iss.pages.operate;

import java.io.File;
import java.lang.reflect.Field;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

public class ReadXml {

	private ReadXml() {
	}

	public static ReadXml getInstance() {
		return new ReadXml();
	}

	public String read() {
		Class<? extends ReadXml> clazz = this.getClass();
		ClassLoader loader = clazz.getClassLoader();
		URL url = loader.getResource("/entity.xml");
		return url.getPath();
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getItems() {
		String path = read();
		SAXReader reader = new SAXReader();
		List<Map<String, Object>> maps = Lists.newArrayList();
		try {
			Document document = reader.read(new File(path));
			Element element = document.getRootElement();
			List<Element> elements = element.elements();
			for (Element ele : elements) {
				Map<String, Object> map = Maps.newConcurrentMap();
				map.put("name", ele.attribute("name").getValue());
				map.put("directroy", ele.attribute("direcroy").getValue());
				maps.add(map);
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return maps;
	}

	public Map<String, Object> getProperties(Map<String, Object> parameterMap)
			throws ClassNotFoundException, NullPointerException, InstantiationException, IllegalAccessException {
		// 所有对象的集合
		Map<String, Object> maps = Maps.newConcurrentMap();
		if (parameterMap.get("entityPackage") == null) {
			throw new NullPointerException("实体包名不能为空，请重新输入包名");
		}
		String entityPackage = parameterMap.get("entityPackage").toString();
		// 根据包名获得实体
		Class<?> clazz = Class.forName(entityPackage);
		Object object = clazz.newInstance();
		String name = clazz.getSimpleName();
		name = name.replace(name.substring(0, 1), name.substring(0, 1).toLowerCase());
		// 获得实体里面的所有的属性
		Field[] fields = object.getClass().getDeclaredFields();
		Map<String, String> map = Maps.newConcurrentMap();
		// 新增
		if (parameterMap.get("add") != null) {
			StringBuffer buffer = createAddPage(fields);
			map.put("add", buffer.toString());
		}
		// 修改
		if (parameterMap.get("edit") != null) {
			StringBuffer buffer = createEditPage(name, fields);
			map.put("edit", buffer.toString());
		}
		// 列表
		if (parameterMap.get("list") != null) {
			for (Field field : fields) {
				
			}
		}
		maps.put("content", map);
		maps.put("name", name);
		return maps;
	}

	private StringBuffer createAddPage(Field[] fields) {
		StringBuffer buffer = new StringBuffer();
		StringBuffer sb = new StringBuffer();
		buffer.append("	<article class=\"page-container\">\r\n");
		buffer.append("		<form class=\"form form-horizontal\" id=\"form-article-add\">\r\n");
		for (Field field : fields) {
			sb.append("					" + field.getName() + ":{required: true,maxlength:100},\r\n");
			buffer.append("		<div class=\"row cl\">\r\n");
			buffer.append("			<label class=\"form-label col-xs-3 col-sm-2\">\r\n");
			buffer.append("				<span class=\"c-red\">*</span>\r\n");
			buffer.append("				" + field.getName() + "：\r\n");
			buffer.append("			</label>\r\n");
			buffer.append("			<div class=\"formControls col-xs-9 col-sm-10\">\r\n");
			buffer.append("				<input type=\"text\" class=\"input-text\" id=\"" + field.getName()
					+ "\" placeholder=\"请输入" + field.getName() + "\" id=\"name\" name=\"" + field.getName()
					+ "\">\r\n");
			buffer.append("			</div>\r\n");
			buffer.append("		</div>\r\n");
		}
		buffer.append("			<div class=\"row cl\" style=\"text-align: right;margin-right: 2px\">\r\n");
		buffer.append("				<button class=\"btn btn-success\" type=\"submit\">\r\n");
		buffer.append("					<i class=\"Hui-iconfont Hui-iconfont-save\"></i>\r\n");
		buffer.append("					&nbsp;保存\r\n");
		buffer.append("				</button>\r\n");
		buffer.append("			</div>\r\n");
		buffer.append("		</form>\r\n");
		buffer.append("	</article>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/lib/layer/2.4/layer.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/h-ui/js/H-ui.min.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/h-ui.admin/js/H-ui.admin.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/lib/jquery.validation/1.14.0/jquery.validate.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/lib/jquery.validation/1.14.0/validate-methods.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/lib/jquery.validation/1.14.0/messages_zh.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\">\r\n");
		buffer.append("		$(function () {\r\n");
        buffer.append("			$(\"#form-article-add\").validate({\r\n");
        buffer.append("				rules: {\r\n");
        buffer.append(sb.toString());
		buffer.append("				},\r\n");
		buffer.append("				onkeyup: false,\r\n");
		buffer.append("				focusCleanup: true,\r\n");
		buffer.append("				success: \"valid\",\r\n");
		buffer.append("				submitHandler: function (form) {\r\n");
		buffer.append("					$.openTip('确定保存吗？',false,function(d){\r\n");
		buffer.append("						$(d).dialog('close');\r\n");
		buffer.append("						$.openLoading('正在保存，请稍等...');\r\n");
		buffer.append("						jQuery.ajax({\r\n");
		buffer.append("							type: \"POST\",\r\n");
		buffer.append("							url: \"\",\r\n");
		buffer.append("							data: $(form).serialize(),\r\n");
		buffer.append("							error: function (XMLHttpRequest, error, errorThrown) {\r\n");
		buffer.append("								$.closeLoading();\r\n");
		buffer.append("								$.openTip('保存失败，请稍候再试...',true, function(dialogAlert) {\r\n");
		buffer.append("									$(dialogAlert).dialog( \"close\" );\r\n");
		buffer.append("									return ;\r\n");
		buffer.append("								});\r\n");
		buffer.append("							},\r\n");
		buffer.append("							success: function (response) {\r\n");
		buffer.append("								var data = eval(\"(\" + response + \")\");\r\n");
		buffer.append("								if (data.resposecode == 200) {\r\n");
		buffer.append("									$.openTip(data.message,true, function(dialogAlert) {\r\n");
		buffer.append("										$(dialogAlert).dialog( \"close\" );\r\n");
		buffer.append("										parent.window.location.href = '';\r\n");
		buffer.append("										var index = parent.layer.getFrameIndex(window.name);\r\n");
		buffer.append("										parent.layer.close(index);\r\n");
		buffer.append("									});\r\n");
		buffer.append("								} else {\r\n");
		buffer.append("									$.closeLoading();\r\n");
		buffer.append("									$.openTip(data.message,true, function(dialogAlert) {\r\n");
		buffer.append("										$(dialogAlert).dialog( \"close\" );\r\n");
		buffer.append("										return ;\r\n");
		buffer.append("									});\r\n");
		buffer.append("								}\r\n");
		buffer.append("							}\r\n");
		buffer.append("						});\r\n");
		buffer.append("					});\r\n");
		buffer.append("				}\r\n");
		buffer.append("			});\r\n");
		buffer.append("		});\r\n");
		buffer.append("	</script>\r\n");
		return buffer;
	}

	private StringBuffer createEditPage(String name, Field[] fields) {
		StringBuffer buffer = new StringBuffer();
		StringBuffer sb = new StringBuffer();
		buffer.append("	<article class=\"page-container\">\r\n");
		buffer.append("		<form class=\"form form-horizontal\" id=\"form-article-add\">\r\n");
		buffer.append("			<input type=\"text\" style=\"display:none\" value=\"${" + name + ".id}\" name=\"id\" id=\"id\"/>\r\n");
		for (Field field : fields) {
			sb.append("					" + field.getName() + ":{required: true,maxlength:100},\r\n");
			buffer.append("		<div class=\"row cl\">\r\n");
			buffer.append("			<label class=\"form-label col-xs-3 col-sm-2\">\r\n");
			buffer.append("				<span class=\"c-red\">*</span>\r\n");
			buffer.append("				" + field.getName() + "：\r\n");
			buffer.append("			</label>\r\n");
			buffer.append("			<div class=\"formControls col-xs-9 col-sm-10\">\r\n");
			buffer.append("				<input type=\"text\" class=\"input-text\" value=\"${" + name + "." + field.getName() + "}\" id=\"" + field.getName() + "\" placeholder=\"请输入" + field.getName() + "\" id=\"name\" name=\"" + field.getName() + "\">\r\n");
			buffer.append("			</div>\r\n");
			buffer.append("		</div>\r\n");
		}
		buffer.append("			<div class=\"row cl\" style=\"text-align: right;margin-right: 2px\">\r\n");
		buffer.append("				<button class=\"btn btn-success\" type=\"submit\">\r\n");
		buffer.append("					<i class=\"Hui-iconfont Hui-iconfont-save\"></i>\r\n");
		buffer.append("					&nbsp;保存\r\n");
		buffer.append("				</button>\r\n"); 
		buffer.append("			</div>\r\n");
		buffer.append("		</form>\r\n");
		buffer.append("	</article>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/lib/layer/2.4/layer.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/h-ui/js/H-ui.min.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/h-ui.admin/js/H-ui.admin.js\"></script>\r\n");
		buffer.append(" <script type=\"text/javascript\" src=\"${ctx}/static/admin/lib/jquery.validation/1.14.0/jquery.validate.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/lib/jquery.validation/1.14.0/validate-methods.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\" src=\"${ctx}/static/admin/lib/jquery.validation/1.14.0/messages_zh.js\"></script>\r\n");
		buffer.append("	<script type=\"text/javascript\">\r\n");
		buffer.append("		$(function () {\r\n");
        buffer.append("			$(\"#form-article-add\").validate({\r\n");
        buffer.append("				rules: {\r\n");
        buffer.append(sb.toString());
		buffer.append("				},");
		buffer.append("				onkeyup: false,\r\n");
		buffer.append("				focusCleanup: true,\r\n");
		buffer.append("				success: \"valid\",\r\n");
		buffer.append("				submitHandler: function (form) {\r\n");
		buffer.append("					$.openTip('确定保存吗？',false,function(d){\r\n");
		buffer.append("						$(d).dialog('close');\r\n");
		buffer.append("						$.openLoading('正在保存，请稍等...');\r\n");
		buffer.append("						jQuery.ajax({\r\n");
		buffer.append("							type: \"POST\",\r\n");
		buffer.append("							url: \"\",\r\n");
		buffer.append("							data: $(form).serialize(),\r\n");
		buffer.append("							error: function (XMLHttpRequest, error, errorThrown) {\r\n");
		buffer.append("								$.closeLoading();\r\n");
		buffer.append("								$.openTip('保存失败，请稍候再试...',true, function(dialogAlert) {\r\n");
		buffer.append("									$(dialogAlert).dialog( \"close\" );\r\n");
		buffer.append("									return ;\r\n");
		buffer.append("								});\r\n");
		buffer.append("							},\r\n");
		buffer.append("							success: function (response) {\r\n");
		buffer.append("								var data = eval(\"(\" + response + \")\");\r\n");
		buffer.append("								if (data.resposecode == 200) {\r\n");
		buffer.append("									$.openTip(data.message,true, function(dialogAlert) {\r\n");
		buffer.append("										$(dialogAlert).dialog( \"close\" );\r\n");
		buffer.append("										parent.window.location.href = '';\r\n");
		buffer.append("										var index = parent.layer.getFrameIndex(window.name);\r\n");
		buffer.append("										parent.layer.close(index);\r\n");
		buffer.append("									});\r\n");
		buffer.append("								} else {\r\n");
		buffer.append("									$.closeLoading();\r\n");
		buffer.append("									$.openTip(data.message,true, function(dialogAlert) {\r\n");
		buffer.append("										$(dialogAlert).dialog( \"close\" );\r\n");
		buffer.append("										return ;\r\n");
		buffer.append("									});\r\n");
		buffer.append("								}\r\n");
		buffer.append("							}\r\n");
		buffer.append("						});\r\n");
		buffer.append("					});\r\n");
		buffer.append("				}\r\n");
		buffer.append("			});\r\n");
		buffer.append("		});\r\n");
		buffer.append("	</script>\r\n");
		return buffer;
	}
}
