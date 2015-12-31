package com.oemp.audi.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oemp.cms.interceptions.AdminInterceptor;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.ApplicationResources;
import com.oemp.frame.util.CmsConstants;
import com.oemp.frame.util.CmsUtils;

public class CommonUtil {
	/**奥迪一分类*/
	public static final Long audionetype=Long.parseLong(ApplicationResources.getText("audionetype"));
	/**登录用户*/
	public static final String WEB_USER = "AUDI_WEB_USER";
	/**后台下载地址*/
	public static final String SAVEURL = CmsConstants.CONTENT_PATH + "/admin/uploadfiles/";
	/**2013品牌*/
	public static final Long brandid=Long.parseLong(ApplicationResources.getText("brandid2013"));
	
	/**省*/
	public static final Long provinceid=Long.parseLong(ApplicationResources.getText("provinceid"));
	/**js下载地址*/
	public static final String downJsPath="/admin/js/";
	
	/**奥迪第一分类*/
	/**
	 * 是否空字符串，非空返回原字符
	 * @param str
	 * @return
	 */
	public static String getCellString(Object obj){
		if(CmsUtils.isEmpty(obj)){
			return "";
		}
		String objStr="";
		if(obj instanceof String){
			objStr=CmsUtils.isEmpty(obj)?"":obj.toString();
		}
		else if(obj instanceof Date){
			objStr=UtilTools.formatDate((Date)obj);
		}else{
			objStr=obj.toString();
		}
		return  objStr;
	}
	/**
	 * 判断性别
	 * @param g
	 * @return
	 */
	public static String getGender(Object g){
		if(CmsUtils.isEmpty(g)){
			return "";
		}else{
			return g.toString().equals("1")?"男":"女";
		}
	}
	/**
	 * 是否
	 * @param f
	 * @return
	 */
	public static String yesOrNo(Object f){
		if(CmsUtils.isEmpty(f)){
			return "";
		}else{
			return f.toString().equals("1")?"是":"否";
		}
	}
	/**
	 * 获取long数据
	 * @param obj
	 * @return
	 */
	public static Long parseLong(Object obj){
		if(CmsUtils.isEmpty(obj) || CmsUtils.isEmpty(obj.toString())){
			return null;
		}
		else{
			return Long.parseLong(obj.toString());
		}
	}
	
	/**生成js文件*/
	public static String write(String fileName, String fileContent) {
		try {
			   File f = new File(fileName);
			   if (!f.exists()) {
			    f.createNewFile();
			   }
			   OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(f),"utf-8");
			   BufferedWriter writer=new BufferedWriter(write);   
			   writer.write(fileContent);
			   writer.close();
			   
			} catch (Exception e) {
			  e.printStackTrace();
			  throw new RuntimeException();
		  }
		return fileContent;
	}
	public static final Logger log = LoggerFactory
	.getLogger(AdminInterceptor.class);
	
}
