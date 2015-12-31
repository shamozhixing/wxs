package com.oemp.audi.util;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

/**
 * 发送短信息
 * @author Administrator
 *
 */
public class SendMessageUtil {
	private static final String URL="http://sms.zxhcsd.com:8080/smsservice/smsservice.asmx/SendEx";
	private static final String UserId="6729F8E297";  		//用户编号
	private static final String Password="110510133.sk";			//密码
	private static final String SendTime="";					//计划发送时间
	private static final String SubNumber="";					//子号码
	private static final String BatchSendID="";				//群发标识
	private static final String BizType="16";					//业务代码
	private static final String WapURL="";					//Wap Push的URL地址
	
	/**
	 * 发送短信息
	 * @param DestNumber
	 * @param MsgContent
	 * @return
	 */
	public static String sendMsg(String DestNumber,String MsgContent) {
		String xml = "";
		HttpClient client = new HttpClient();
		PostMethod postMethod = new PostMethod(URL);
		postMethod.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");//在头文件中设置转码
		NameValuePair[] data={
				//用户编号(必填)，由代理商提供
				new NameValuePair("UserId", UserId),
				
				//密码(必填)，由代理商提供
				new NameValuePair("Password", Password),
				
				//短信内容(必填)
				new NameValuePair("MsgContent", MsgContent),
				
				//目标号码(必填)
				new NameValuePair("DestNumber", DestNumber),
				
				//计划发送时间
				new NameValuePair("SendTime", SendTime),
				
				//子号码
				new NameValuePair("SubNumber", SubNumber),
				
				//群发标识
				new NameValuePair("BatchSendID", BatchSendID),
				
				//业务代码(必填)
				new NameValuePair("BizType", BizType),
				
				//Wap Push的URL地址
				new NameValuePair("WapURL", WapURL)
		};
		postMethod.setRequestBody(data);
		try {
			int statusCode=client.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK) {
				xml = postMethod.getResponseBodyAsString(); // 返回值
			}
		} catch (HttpException e2) {
			e2.printStackTrace();
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		if(postMethod!=null){
			postMethod.releaseConnection();
		}
		return xml;
	}
	
	public static void main(String[] args) {
		String xml=SendMessageUtil.sendMsg("15313519980","cccc");
		System.out.println(xml);
	}

}
