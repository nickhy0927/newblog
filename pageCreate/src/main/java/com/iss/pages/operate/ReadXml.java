package com.iss.pages.operate;

import java.io.File;
import java.lang.reflect.Field;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Attribute;
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
	public List<Map<String, List<Map<String, Object>>>> getProperties() throws DocumentException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		String path = read();
		// 所有对象的集合
		List<Map<String, List<Map<String, Object>>>> maps = Lists.newArrayList();
		SAXReader reader = new SAXReader();
		// 读取文件 转换成Document
		Document document = reader.read(new File(path));
		Element element = document.getRootElement();
		
		// 一个对象的所有页面(新增，修改，列表的所有字段)
		Map<String, List<Map<String, Object>>> objList = Maps.newConcurrentMap();
		
		List<Element> elements = element.elements();
		for (Element ele : elements) {
			Map<String, String> properties = new HashMap<>();
			System.out.println(ele.getName());
			// 获取包名
			Attribute attribute = ele.attribute("entityPackage");
			if (attribute == null) {
				throw new NullPointerException("需要创建的实体类完整的包名称不能为空...");
			}
			// 根据包名获得实体
			Class<?> clazz = Class.forName(attribute.getStringValue());
			Object object = clazz.newInstance();
			// 获得实体里面的所有的属性
			Field[] fields = object.getClass().getDeclaredFields();
			for (Field field : fields) {
				System.err.println(field.getName());
				properties.put(field.getName(), "");
			}
			
			List<Attribute> attributes = ele.attributes();
			for (Attribute attr : attributes) {
				System.out.println(attr.getName() + " = " + attr.getValue());
			}
		}
		maps.add(objList);
		return maps;
	}
}
