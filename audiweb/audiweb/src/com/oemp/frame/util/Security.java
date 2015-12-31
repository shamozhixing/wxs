package com.oemp.frame.util;

import java.io.UnsupportedEncodingException;
import java.security.*;

/** 安全-->加密解密 */
public class Security {

	/**
	 * 字符串加密方法。传入一个字符串，返回经过SHA-1加密后的一个字符串
	 * 
	 * @param strInput
	 * @return
	 */
	public static String encryptSHA(String strInput) {
		String strOutput = new String("");
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(strInput.getBytes("iso-8859-1"));
			byte b[] = md.digest();
			for (int i = 0; i < b.length; i++) {
				char[] digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8',
						'9', 'A', 'B', 'C', 'D', 'E', 'F' };
				char[] ob = new char[2];
				ob[0] = digit[(b[i] >>> 4) & 0X0F];
				ob[1] = digit[b[i] & 0X0F];
				strOutput += new String(ob);
			}
		} catch (NoSuchAlgorithmException ex) {
			ex.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return strOutput;
	}

	/**
	 * 字符串加密方法。传入一个字符串，返回经过MD5加密后的一个字符串
	 * 
	 * @param strInput
	 * @return
	 */
	public static String encryptMD5(String strInput) {
		StringBuffer buf = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(strInput.getBytes());
			byte b[] = md.digest();
			buf = new StringBuffer(b.length * 2);
			for (int i = 0; i < b.length; i++) {
				if (((int) b[i] & 0xff) < 0x10) { // & 0xff转换无符号整型
					buf.append("0");
				}
				// buf.append(Long.toString((int) b[i] & 0xff,
				// 16));//转换16进制,下方法同
				buf.append(Long.toHexString((int) b[i] & 0xff));
			}
		} catch (NoSuchAlgorithmException ex) {
			ex.printStackTrace();
		}
		return buf.toString();
	}

	public static void main(String[] args) {
		String test = "J28374";
		System.out.print(encryptMD5(test));
	}
}
