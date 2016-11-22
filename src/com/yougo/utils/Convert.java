package com.yougo.utils;

import java.io.UnsupportedEncodingException;
/**
 * ±àÂë×ª»»
 * @author Alpha
 *
 */
public class Convert {
	public static String convert(String str) {
		try {
			str = new String(str.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}
}
