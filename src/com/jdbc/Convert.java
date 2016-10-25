package com.jdbc;

import java.io.UnsupportedEncodingException;

public class Convert {
	public static String convert(String str){		
		try {
			str = new String(str.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {	
			e.printStackTrace();
		}
		return str;
	}
}
