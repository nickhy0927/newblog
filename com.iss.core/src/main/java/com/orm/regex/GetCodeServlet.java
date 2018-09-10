package com.orm.regex;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

/**
 * @author HUANGYUAN
 *
 * @时间 2015年7月30日 下午3:04:39
 * @项目名称 fscloudmanage
 * @包名称 com.isoftstone.cms.syscore.regex
 * @描述 获得验证码
 */
public class GetCodeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String validateCode = req.getParameter("validateCode");
			HttpSession session = req.getSession();
			String result = "error";
			Object attribute = req.getSession().getAttribute(ValidateCode.CHECK_CODE);
			if (attribute == null) {
				attribute = session.getAttribute("code");
			}
			if (attribute != null) {
				System.out.println("redis_code:" + attribute.toString().toLowerCase());
				System.out.println("customer_code :" + validateCode);
				System.out.println("是否相等：" + validateCode.toLowerCase().equals(attribute.toString().toLowerCase()));
			}
			if (attribute != null && StringUtils.equals(attribute.toString().toLowerCase(), validateCode.toLowerCase())) {
				result = "success";
			}
			resp.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
