package com.oemp.frame.util;

import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/** 日期处理
 *  @author cdy
 *
 */
public class DateUtil {
	public static final String[] months = { "一月", "二月", "三月", "四月", "五月", "六月",
		"七月", "八月", "九月", "十月", "十一月", "十二月", };

public static final String[] quarters = { "一季度", "二季度", "三季度", "四季度" };

public DateUtil() {
}

public static long getDay(Date date1, Date date2) {
	return (date1.getTime() - date2.getTime()) / (24L * 60 * 60 * 1000);
}

/**
 * 获取日期字符串。
 * 
 * <pre>
 *   日期字符串格式： yyyyMMdd
 *   其中：
 *       yyyy   表示4位年。
 *       MM     表示2位月。
 *       dd     表示2位日。
 * </pre>
 * 
 * @return String "yyyyMMdd"格式的日期字符串。
 */
public static String getDate() {
	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");

	return formatter.format(new Date());
}

/**
 * 获取当前年度字符串。
 * 
 * <pre>
 *   日期字符串格式： yyyy
 *   其中：
 *       yyyy   表示4位年。
 * </pre>
 * 
 * @return String "yyyy"格式的当前年度字符串。
 */
public static String getNowYear() {
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy");

	return formatter.format(new Date());
}

/**
 * 获取当前月度字符串。
 * 
 * <pre>
 *   日期字符串格式： MM
 *   其中：
 *       MM   表示4位年。
 * </pre>
 * 
 * @return String "yyyy"格式的当前月度字符串。
 */
public static String getNowMonth() {
	SimpleDateFormat formatter = new SimpleDateFormat("MM");

	return formatter.format(new Date());
}

/**
 * 获取当前月度字符串。
 * 
 * <pre>
 *   日期字符串格式： dd
 *   其中：
 *       dd   表示4位年。
 * </pre>
 * 
 * @return String "yyyy"格式的当前月度字符串。
 */
public static String getNowDay() {
	SimpleDateFormat formatter = new SimpleDateFormat("dd");

	return formatter.format(new Date());
}

/**
 * 获取日期字符串。
 * 
 * <pre>
 *   日期字符串格式： yyyyMMdd
 *   其中：
 *       yyyy   表示4位年。
 *       MM     表示2位月。
 *       dd     表示2位日。
 * </pre>
 * 
 * @param date
 *            需要转化的日期。
 * @return String "yyyyMMdd"格式的日期字符串。
 */
public static String getDate(Date date) {
	if (date == null)
		return "";
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	return formatter.format(date);
}

/**
 * 获取日期字符串。
 * 
 * <pre>
 *   日期字符串格式： yyyyMMdd
 *   其中：
 *       yyyy   表示4位年。
 *       MM     表示2位月。
 *       dd     表示2位日。
 * </pre>
 * 
 * @param date
 *            需要转化的日期。
 * @return String "yyyyMMdd"格式的日期字符串。
 */
/**
 * 将指定的日期字符串转化为日期对象
 * 
 * @param dateStr
 *            日期字符串
 * @return java.util.Date
 * @roseuid 3F39FE450385
 */
public static Date getDate(String dateStr) {
	if (isDate(dateStr)) { // 日期型
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date date = df.parse(dateStr);
			return date;
		} catch (Exception ex) {

			return null;
		} // end try - catch
	} else if (isDatetime(dateStr)) { // 日期时间型
		SimpleDateFormat df = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss.SSS");
		try {
			java.util.Date date = df.parse(dateStr);
			return date;
		} catch (Exception ex) {
			return null;
		} // end try - catch
	} // end if
	return null;
}

/**
 * 获取日期字符串。
 * 
 * <pre>
 *   日期字符串格式： yyyy-MM-dd
 *   其中：
 *       yyyy   表示4位年。
 *       MM     表示2位月。
 *       dd     表示2位日。
 * </pre>
 * 
 * @return String "yyyy-MM-dd"格式的日期字符串。
 */
public static String getHyphenDate() {
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	return formatter.format(new Date());
}

/**
 * 获取日期字符串。
 * 
 * <pre>
 *   日期字符串格式： yyyy-MM-dd
 *   其中：
 *       yyyy   表示4位年。
 *       MM     表示2位月。
 *       dd     表示2位日。
 * </pre>
 * 
 * @param date
 *            需要转化的日期。
 * @return String "yyyy-MM-dd"格式的日期字符串。
 */
public static String getHyphenDate(Date date) {
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	return formatter.format(date);
}

/**
 * 将"yyyyMMdd"格式的日期字符串转换为日期对象。
 * 
 * @param source
 *            日期字符串。
 * @return Date 日期对象。
 */
public static Date parsePlainDate(String source) {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	return sdf.parse(source, new ParsePosition(0));
}

/**
 * 将“yyyy-MM-dd”格式的日期字符串转换为日期对象。
 * 
 * @param source
 *            日期字符串。
 * @return Date 日期对象。
 */
public static Date parseHyphenDate(String source) {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	return sdf.parse(source, new ParsePosition(0));
}

/**
 * 将指定格式的日期字符串转换为日期对象。
 * 
 * @param source
 *            日期字符串。
 * @param pattern
 *            模式。
 * @return Date 日期对象。
 */
public static Date parseDate(String source, String pattern) {
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);

	return sdf.parse(source, new ParsePosition(0));
}

/**
 * 将“yyyy-MM-dd”格式的日期字符串转换为“yyyyMMdd”格式的日期字符串。
 * 
 * @param source
 *            日期字符串。
 * @return String "yyyymmdd"格式的日期字符串。
 */
public static String toPlainDate(String source) {
	Date date = parseHyphenDate(source);
	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");

	return formatter.format(date);
}

/**
 * 将“yyyyMMdd”格式的日期字符串转换为“yyyy-MM-dd”格式的日期字符串。
 * 
 * @param source
 *            日期字符串。
 * @return String "yyyy-MM-dd"格式的日期字符串。
 */
public static String toHyphenDate(String source) {
	Date date = parsePlainDate(source);
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	return formatter.format(date);
}

/**
 * 获取时间戳，将日期对象转换为时间戳类型。
 * 
 * @param date
 *            日期对象
 * @return Timestamp 时间戳
 */
public static Timestamp getTimestamp(Date date) {
	return new Timestamp(date.getTime());
}

/**
 * 获取时间戳，将当前日期转换为时间戳类型。
 * 
 * @return Timestamp 时间戳
 */
public static Timestamp getTimestamp() {
	return new Timestamp(new Date().getTime());
}

/**
 * 将“yyyyMMdd”格式的日期字符串转换为Timestamp类型的对象。
 * 
 * @param source
 *            日期字符串
 * @return Timestamp 时间戳
 */
public static Timestamp parseTimestamp(String source) {
	Date date = parsePlainDate(source);

	return getTimestamp(date);
}

/**
 * 将指定格式的日期字符串转换为Timestamp类型的对象。
 * 
 * @param source
 *            日期字符串
 * @param format
 *            日期格式
 * @return Timestamp 时间戳
 */
public static Timestamp parseTimestamp(String source, String format) {
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	return getTimestamp(sdf.parse(source, new ParsePosition(0)));
}

/**
 * 获得年度周期 <br>
 * Example:<br>
 * XJPDateUtil.getPeriodYear("20040229" , -1);<br>
 * XJPDateUtil.getPeriodYear("20040228" , -1);<br>
 * XJPDateUtil.getPeriodYear("20020230" , 2);<br>
 * 
 * @param source
 *            时间串
 * @param yearPeriod
 *            年度周期 -1代表本时间的上一年度,以次类推。
 * @return String 时间。
 */
public static String getPeriodYear(String source, int yearPeriod) {
	int p = Integer.parseInt(source.substring(0, 4)) + yearPeriod;
	String newYear = String.valueOf(p)
			+ source.substring(4, source.length());
	Date date = parsePlainDate(newYear);
	String s = getDate(date);
	int ny = Integer.parseInt(s);
	int sy = Integer.parseInt(newYear);

	while (ny > sy) {
		sy--;
		ny = Integer.parseInt(getDate(parsePlainDate(String.valueOf(sy))));
	}

	return String.valueOf(sy);
}

/**
 * 获取当前日期和时间
 * 
 * @return String
 */
public static String getCurrentDateStr() {
	Date date = new Date();
	String str = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	str = df.format(date);
	return str;
}

/**
 * 日期相加
 * 
 * @param day
 *            天数
 * @return 返回相加后的日期
 */
public static String addDate(int day) {
	java.util.Calendar c = java.util.Calendar.getInstance();

	c.setTimeInMillis(System.currentTimeMillis() + ((long) day) * 24 * 3600
			* 1000);
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
	return df.format(c.getTime());
}

public static Date addDate(Date date, int day) {
	java.util.Calendar c = Calendar.getInstance();
	c.setTime(date);

	c.add(Calendar.DATE, day);
	return c.getTime();
}

/**
 * 返回毫秒
 * 
 * @param date
 *            日期
 * @return 返回毫秒
 */
public static long getMillis(java.util.Date date) {
	java.util.Calendar c = java.util.Calendar.getInstance();
	c.setTime(date);
	return c.getTimeInMillis();
}

/**
 * 获取当前日期和时间 日期格式 例：yyyy-MM-dd hh:mm
 * 
 * @param format
 * @return String
 */
public static String getNowDate(String format) {
	Date date = new Date();
	String str = null;
	SimpleDateFormat df = new SimpleDateFormat(format);
	str = df.format(date);
	return str;
}

/**
 * 将strmon的日期减小一个月
 * 
 * @param mon
 * @return
 */
public static String getReduceMonDate(String strmon) {
	if (strmon != null && !strmon.equals("")) {
		Date mon = parseHyphenDate(strmon);
		Calendar ca = Calendar.getInstance();
		ca.setTime(mon);
		ca.add(Calendar.MONTH, -1);
		return getHyphenDate(ca.getTime());
	} else {
		return "";
	}
}

public static String getTimeStr(String dateStr) {
	Date date = getDate(dateStr);
	String str = null;
	SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
	str = df.format(date);
	return str;
}

public static String getTimeStr() {
	String str = "";
	SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
	str = df.format(new Date());
	return str;
}

public static String getTimeFormatStr(Date d, String formcat) {
	String str = null;
	SimpleDateFormat df = new SimpleDateFormat(formcat);
	str = df.format(d);
	return str;
}

public static boolean isDate(String str) {
	java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(
		"yyyy-MM-dd");
	try {
	    java.util.Date date = df.parse(str);
	    // 是否变形
	    String apple = df.format(date);
	    if (!apple.equals(str)) {
		return false;
	    }
	} catch (Exception ex) {
	    return false;
	} // end try - catch
	return true;
    }

    
    public static boolean isDatetime(String str) {

	java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(
		"yyyy-MM-dd HH:mm:ss.SSS");
	java.text.SimpleDateFormat df400 = new java.text.SimpleDateFormat(
		"yyyy-MM-dd-HH.mm.ss.SSS");
	// 补上点
	if (!str.endsWith(".") && str.length() == 19) {
	    str = str + ".";
	} // end if
	// 补充长度
	while (str.length() < 23) {
	    str = str + "0";
	} // end while
	try {
	    java.util.Date date = df.parse(str);
	    // 是否变形
	    String apple = df.format(date);
	    if (!apple.equals(str)) {
		return false;
	    }
	} catch (java.text.ParseException ex) {
	    try {
		java.util.Date date2 = df400.parse(str);
		// 是否变形
		String apple1 = df400.format(date2);
		if (!apple1.equals(str)) {
		    return false;
		}
	    } catch (java.text.ParseException exa) {
		
		return false;
	    }
	    return true;
	}
	return true;
    }
 /**
  * 获取当前时间Date类型
  */
public static Date getNowDate(){
	return new Date();
}
public static void main(String[] arg) {
	System.out.println(getTimeFormatStr(new Date(), "ss"));
	System.out.println(new Date());
	System.out
			.println(getDay(new Date(), parseHyphenDate("2008-04-14")) < 8);
	System.out.println(getDate("2008-09-09 " + getTimeStr() + ".000"));
}
}
