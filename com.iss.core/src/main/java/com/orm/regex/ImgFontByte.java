package com.orm.regex;

import java.awt.Font;
import java.io.ByteArrayInputStream;

/**
 *
 * @描述
 * @author HUANGYUAN 2015年8月4日 上午10:32:39
 *
 */
public class ImgFontByte {
	public Font getFont(int fontHeight) {
		try {
			Font baseFont = Font.createFont(Font.TRUETYPE_FONT, new ByteArrayInputStream(hex2byte(getFontByteStr())));
			return baseFont.deriveFont(Font.BOLD, fontHeight);
		} catch (Exception e) {
			return new Font("Arial", Font.BOLD, fontHeight);
		}
	}

	private String getFontByteStr() {
		return null;
	}

	private byte[] hex2byte(String str) {
		if (str == null) {
			return null;
		}
		str = str.trim();
		int len = str.length();
		if (len == 0 || len % 2 == 1) {
			return null;
		}

		byte[] b = new byte[len / 2];
		try {
			for (int i = 0; i < str.length(); i += 2) {
				b[i / 2] = (byte) Integer.decode("0x" + str.substring(i, i + 2)).intValue();
			}
			return b;
		} catch (Exception e) {
			return null;
		}
	}
}