package com.oemp.common;

//import static com.oemp.frame.action.BaseAction.log;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oemp.cms.bean.CmsLog;


public class UtilTools {
	private static final Logger log = LoggerFactory.getLogger(UtilTools.class);
	/**
	 * 获取系统日志信息
	 * @param cmlFunction：模块名称:eg:用户管理
	 * @param cmlType:操作类型，eg:"ADD"
	 * @param cmlDesc:日志描述信息
	 * @param cmlUser:操作人
	 * @return
	 */
	public static CmsLog buildLog(String cmlFunction,String cmlType,String cmlDesc,String cmlUser){
		CmsLog log=new CmsLog();
		log.setCmlTime(UtilTools.getCurrrentDate1());
		log.setCmlFunction(cmlFunction);
		log.setCmlType(cmlType);
		log.setCmlDesc(cmlDesc);
		log.setCmlUser(cmlUser);
		return log;
	}


	/**
	 * 将Java对象系列化为Json资料格式<br>
	 * 
	 * @param pObject
	 *            传入的Java对象
	 * @return
	 */
	public static final String encodeObject2Json(Object pObject) {
		return encodeObject2Json(pObject,"MM/dd/yyyy HH:mm:ss");
	}

	/**
	 * 
	 * 将含有日期时间格式的Java对象系列化为Json资料格式
	 * Json-Lib在处理日期时间格式时需要实现其JsonValueProcessor接口,所以在这里提供一个重载的方法对含有
	 * 日期时间格式的Java对象进行序列化
	 * 
	 * @param pObject
	 * 传入的Java对象
	 * @return
	 */
	public static final String encodeObject2Json(Object pObject,String pFormatString) {
		String jsonString = "[]";
		if (null == pObject) {
			// log.warn("传入的Java对象为空,不能将其序列化为Json资料格式.请检查!");
		} else {
			JsonConfig cfg = new JsonConfig();
			cfg.registerJsonValueProcessor(java.sql.Timestamp.class,new JsonValueProcessorImpl(pFormatString));
			cfg.registerJsonValueProcessor(java.util.Date.class,new JsonValueProcessorImpl(pFormatString));
			cfg.registerJsonValueProcessor(java.sql.Date.class,new JsonValueProcessorImpl(pFormatString));
			
			if (pObject instanceof ArrayList) {
				JSONArray jsonArray = JSONArray.fromObject(pObject, cfg);
				jsonString = jsonArray.toString();
			} else {
				JSONObject jsonObject = JSONObject.fromObject(pObject, cfg);
				jsonString = jsonObject.toString();
			}
		}
		if(log.isDebugEnabled()) log.debug(jsonString);
		return jsonString;
	}

	/**
	 * /** 分页工具类
	 * 
	 * @param start
	 * @param limit
	 * @param list
	 * @return
	 */
	public static List queryForPage(int start, int limit, List list) {
		int size = start + limit <= list.size() ? start + limit : list.size();
		ArrayList arry = new ArrayList();
		for (int i = start; i < size; i++) {
			Object dto = (Object) list.get(i);
			arry.add(dto);
		}
		return arry;
	}
	
	/**
	 * 
	 * @return
	 * @description 获取系统当前时间
	 * @version 1.0
	 * @author 
	 * @update 2012-6-1 下午11:33:14
	 */
	public static String getCurrrentDate()
	{
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		return date;
	}
	
	/**
	 * 
	 * @return
	 * @description 获取系统当前时间
	 * @version 1.0
	 * @author 
	 * @update 2012-6-1 下午11:33:14
	 */
	public static Date getCurrrentDate1()
	{
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

		SimpleDateFormat fa = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date faDate = null;
		try {
			faDate = fa.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return faDate;
	}
	/**
	 * yyyy-MM-dd
	 */
	public static final String YYYYMMDD="yyyy-MM-dd";
	/**
	 * 将字符串转化为时间
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static Date formatDateByStr(String dateStr,String pattern)
	{
		Date returnDate = null;
		if(null!= dateStr && !"".equals(dateStr))
		{
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			try {
				returnDate = sdf.parse(dateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return returnDate;
			
	}
	
	
	/**
	 * 
	 * @return
	 * @description 格式化日期格式
	 * @version 1.0
	 * @author 
	 * @update 2012-6-2
	 */
	public static String formatDate(Date date)
	{
		String returnDate = null;
		if(null!= date && !"".equals(date))
		{
			SimpleDateFormat fa = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			returnDate = fa.format(date);
		}
		return returnDate;
			
	}
	
	/**
	 * 格式化日期格式
	 * @param date：时间
	 * @param pattern:要修改的样式
	 * @return
	 */
	//格式
	public static final String yyyyMMddHHmmss="yyyyMMddHHmmss";
	public static String formatDate(Date date,String pattern)
	{
		String returnDate = null;
		if(null!= date && !"".equals(date))
		{
			SimpleDateFormat fa = new SimpleDateFormat(pattern);
			returnDate = fa.format(date);
		}
		return returnDate;
			
	}
	
	/**
	 * 将对象转化为json字符串
	 * 其中如果对象中包含有对象请使用此方法
	 * @param object
	 * @return
	 */
	public static final String getJsonForObject(Object object){
		try {
			String serializeStr= JSONUtil.serialize(object);
			String replace=",\"type\":\"date\"}";
			String newChar=",\"type\":\"string\"}";
			return serializeStr.replace(replace, newChar);
			//return serializeStr;
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 *去除string中的空格、回车、换行、制表符 
	 */
	public static String replaceBlank(String str){
		String s="";
		if(str!=null){
			Pattern p=Pattern.compile("\\s*|\t|\r|\n");
			Matcher m=p.matcher(str);
			s=m.replaceAll("");
		}
		return s;
	}
	
	/**
	 *去除string中的空格、回车、换行、制表符 
	 */
	public static String replaceholder(String string,String...params){
		for (int i = 0; i < params.length; i++) {
			string = string.replace("{"+i+"}", params[i]);
		}
		return string;
	}
}
