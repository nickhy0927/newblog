package com.iss.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface OperationLog {
	
	/**
	 * 操作日志描述信息
	 * @return
	 */
	String operateDescribe();
	
	/**
	 * 操作日志方法名称
	 * @return
	 */
	String operateMethod() default "";
}
