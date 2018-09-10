package com.orm.config;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 配置类
 * 
 * @author Curtain
 *
 */
public class Configuration {

	/**
	 * 获得一个编号
	 *
	 * @param prefix
	 * @param random
	 * @param length
	 * @return
	 */
	public static String getModuleNumber(String prefix, boolean random, int length) {
		StringBuffer buffer = new StringBuffer();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		if (random) {
			buffer.append(prefix).append(sdf.format(new Date()));
			if (length != 0) {
				buffer.append(getRandomNumber(length));
			} else {
				double ra = Math.random() * 100000000;
				int number = (int) ra;
				buffer.append(number);
			}
		}
		return buffer.toString();
	}

	private static String getRandomNumber(int length) {
		StringBuffer buffer = new StringBuffer();
		Random randoms = new Random();
		for (int i = 0; i < length; i++) {
			int nextInt = randoms.nextInt(5);
			buffer.append(nextInt);
		}
		return buffer.toString();
	}

	public static void main(String[] args) {
		System.out.println(getModuleNumber("NOTE", true, 0));
	}
}
