package com.iss.tag;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PremissionTag extends SimpleTagSupport {

	private JspContext context;

	/**
	 * 传入pageContext
	 */
	@Override
	public void setJspContext(JspContext pc) {
		this.context = pc;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		PageContext pageContext = (PageContext) context;
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
        String ip = request.getRemoteHost();
        JspWriter out = pageContext.getOut();
        out.write("使用自定义标签输出客户的IP地址："+ip);
	}
}
