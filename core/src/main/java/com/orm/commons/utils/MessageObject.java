package com.orm.commons.utils;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MessageObject {

	public interface ResponseCode {
		Integer code_100 = 100;
		/**
		 * 请求成功代码
		 */
		Integer code_200 = 200;
		/**
		 * 请求错误代码
		 */
		Integer code_403 = 403;

		/**
		 * 请求失败代码
		 */
		Integer code_404 = 404;
	}

	private String message;

	private Object object;
	private Integer resposecode;

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public String getJsonMapper(MessageObject message) {
		if (message != null) {
			return new JsonMapper().toJson(message);
		}
		return "";
	}

	public String getMessage() {
		return message;
	}

	public Integer getResposecode() {
		return resposecode;
	}

	public void setErrorMessage(String errorMessage) {
		this.message = errorMessage;
		setResposecode(ResponseCode.code_404);
	}

	public void setInforMessage(String inforMessage) {
		this.message = inforMessage;
		setResposecode(ResponseCode.code_200);
		if (StringUtils.isEmpty(inforMessage)){
			this.resposecode = null;
		}

	}

	public void setResposecode(Integer resposecode) {
		this.resposecode = resposecode;
	}

	public void getWriter(HttpServletResponse response,MessageObject messageObject) {
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(new JsonMapper().toJson(messageObject));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
