package com.oemp.frame.util;

import java.net.InetAddress;
import java.util.Collection;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

/**
 * 常用工具方法
 * @author cdy
 *
 */
public class CmsUtils {
	/**
	 * 是否为空
	 * @param obj
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean isEmpty(Object obj){
		if(obj == null){
			return true;
		}
		if (obj instanceof String) {
			if (((String) obj).length() == 0) {
				return true;
			}
		} else if (obj instanceof Collection) {
			if (((Collection) obj).size() == 0) {
				return true;
			}
		} else if (obj instanceof Map) {
			if (((Map) obj).size() == 0) {
				return true;
			}
		}
		return false;
	}
	/** 
	 * 过滤 SQL 查询条件
	 * @param str
	 * @return
	 */
	public static String SqlReplace(String str){
		if(str==null){
			return "";
		}
		return str.replaceAll("'", "''");
	}
	/*
	 * 获取随机数
	 */
	public static String getRandomNumber(int count) {
		StringBuffer sb = new StringBuffer();
		String base = "0123456789";
		Random random = new Random();
		for (int i = 0; i < count; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}
	/*
	 * 获取随机字符
	 */
	public static String getRandomCode(int count) {
		StringBuffer sb = new StringBuffer();
		String base = "23456789abcdefghigkmnpqrstuvwxyz";
		Random random = new Random();
		for (int i = 0; i < count; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}
	/** 
	 * 校验手机号码
	 * @param mobile
	 * @return
	 */
	public static boolean isMobile(String mobile){
		if(isEmpty(mobile)){
			return false;
		}
		String regEx="[1]{1}[3,4,5,8,6]{1}[0-9]{9}";		
		return Pattern.compile(regEx).matcher(mobile).find();
	}
	/** 获得IP地址 */
	public static String getIp(HttpServletRequest request){
		String ip=request.getRemoteAddr();//IP
	    try{
			if(ip.equals("127.0.0.1")){
				InetAddress inet = InetAddress.getLocalHost();
				ip=inet.getHostAddress();
		    }
	    }catch(Exception e){
	    	
	    	return "";
	    }
	    return ip;
	}
}
