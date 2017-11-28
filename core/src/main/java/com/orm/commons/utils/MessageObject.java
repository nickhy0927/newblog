package com.orm.commons.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class MessageObject {
	private int responseCode;
	private String responseMessage;
	private Object object;

	private static MessageObject messageObject = new MessageObject();

	private MessageObject() {
	}

	public void clear() {
		if (messageObject != null) {
			messageObject.object = null;
			messageObject.responseCode = 0;
			messageObject.responseMessage = null;
		}
	}

	public static MessageObject getDefaultMessageObjectInstance() {
		return new MessageObject();
	}

	public void setInforMessage(String message) {
		this.responseCode = ResponseCode.SUCCESS;
		this.responseMessage = message;
	}

	public void setErrorMessage(String message) {
		this.responseCode = ResponseCode.FAILIAR;
		this.responseMessage = message;
	}

	public int getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(int responseCode) {
		if (responseCode == ResponseCode.SUCCESS) {
			this.responseMessage = ResponseMessage.SAVE_SUCCESS_MESSAGE;
		} else
			this.responseMessage = ResponseMessage.SAVE_FAILIAR_MESSAGE;
		this.responseCode = responseCode;
	}

	public String getResponseMessage() {
		return responseMessage;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public static class ResponseCode {
		public static int SUCCESS = 200;
		public static int FAILIAR = 403;
	}

	public static class ResponseMessage {
		public static String SAVE_SUCCESS_MESSAGE = "信息保存成功";
		public static String SAVE_FAILIAR_MESSAGE = "信息保存失败";
		public static String EDIT_SUCCESS_MESSAGE = "信息编辑成功";
		public static String EDIT_FAILIAR_MESSAGE = "信息编辑失败";
		public static String DELETE_SUCCESS_MESSAGE = "信息删除成功";
		public static String DELETE_FAILIAR_MESSAGE = "信息删除失败";
		public static String LIST_SUCCESS_MESSAGE = "获取列表信息成功";
		public static String LIST_FAILIAR_MESSAGE = "获取列表信息失败";
	}

	public void returnData(HttpServletResponse response, MessageObject messageObject) throws IOException {
		// 这句话的意思，是让浏览器用utf8来解析返回的数据
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		// 这句话的意思，是告诉servlet用UTF-8转码，而不是用默认的ISO8859
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		String json = new JsonMapper().toJson(messageObject);
		writer.write(json);
		if (writer != null) {
			writer.flush();
			writer.close();
		}
	}
}
