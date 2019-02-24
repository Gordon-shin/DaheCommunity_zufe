package org.sc.util;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class EncryptTool {
	public static String encodeBase64(String str) {
			String a="a";
		Base64.Encoder encoder = Base64.getEncoder();
		//解决base64 中文乱码
		try {
			a = encoder.encodeToString(str.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return a;
	}
	public static String decodeBase64(String str) {
		Base64.Decoder decoder = Base64.getDecoder();
		return new String(decoder.decode(str));
	}
}
