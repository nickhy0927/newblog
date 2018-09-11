package com.iss.interceptor;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.iss.annotation.OperationLog;
import com.iss.init.UserSingleton;
import com.iss.system.log.entity.OperateLog;
import com.iss.system.log.service.OperateLogService;
import com.iss.system.user.entity.User;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.SysContants;

/**
 * 错误日志监控拦截器
 * @author Hyuan
 *
 */
public class ExceptionDispatcherFilter implements HandlerExceptionResolver {

	final private static Logger LOGGER = LoggerFactory.getLogger(ExceptionDispatcherFilter.class);
	
	@Autowired
	private OperateLogService operateLogService;

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) {
		ModelAndView view = null;
		MessageObject messageObject = MessageObject.getDefaultMessageObjectInstance();
		String uri = request.getRequestURI().toLowerCase();
		String packageMethodName;
		if (object instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) object;
			Method method = handlerMethod.getMethod();
			String name = method.getDeclaringClass().getName();
			packageMethodName = name + "." + method.getName();
			LOGGER.info(packageMethodName);
		}
		System.out.println("请求的uri地址是：" + uri);
		if (uri.lastIndexOf(".json") > 0) {
			exception.printStackTrace();
			messageObject.error("系统出现异常，操作失败");
			try {
				messageObject.returnData(response, messageObject);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("你发送的是.do的请求");
			System.out.println(exception.getMessage());
			exception.printStackTrace();
			messageObject.error("系统产生异常：" + exception.getMessage());
			view = new ModelAndView("/error/error500.jsp");
		}
		if (object instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) object;
			Method method = handlerMethod.getMethod();
			OperationLog log = method.getAnnotation(OperationLog.class);
			User user = UserSingleton.getContextUser(request);
			if(user != null) {
				OperateLog operateLog = new OperateLog();
				operateLog.setCreateTime(new Date());
				operateLog.setUserId(user.getId());
				operateLog.setOpName(user.getRealName());
				if (log != null) {
					operateLog.setMessage(log.operateDescribe());
				}
				operateLog.setException(exception.getMessage());
				operateLog.setOpTime(new Date());
				operateLog.setSolveStatus(SysContants.SolveStatus.SOLVING);
				try {
					operateLogService.save(operateLog);
				} catch (ServiceException e) {
					e.printStackTrace();
				}
			}
		}
		return view;
	}

}
