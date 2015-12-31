package com.oemp.audi.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import tailorbird.util.date.Dator;
import tailorbird.util.security.DESor;
import tailorbird.util.web.Requestor;

import com.oemp.common.UtilTools;
import com.oemp.frame.util.ApplicationResources;

public final class EmailUtilReset {
	private static final String AUDI_USER_ACTIVATE_KEY = "AudiC1ub_@email!key%1*4";// 激活字符串密钥
	private static final String AUDI_USER_SPLIT = "-&-";

	public static final String AUDI_USER_FANSID = "fansId";
	public static final String AUDI_USER_Q3CREATIONID = "q3Reg";

	public static final String USER_EMAILVALID_YSE = "1";// 已激活
	public static final String USER_EMAILVALID_NO = "0";// 未激活

	public static final String USER_EMAILTYPE_NORMAL = "0";// 普通邮件
	public static final String USER_EMAILTYPE_Q3 = "1";// Q3邮件
	private static final String action = "user_resetUserPwd.action";

	/**
	 * 生成email参数
	 * 
	 * @param email
	 * @return
	 * @throws Exception
	 */
	public static String createParameter(String email, HttpServletRequest req,
			String flag) {
		DESor des;
		String par = "";
		try {
			des = new DESor(AUDI_USER_ACTIVATE_KEY);
			String fansId = (String) req.getSession().getAttribute("FANSID");
			par = email + AUDI_USER_SPLIT
			+ Dator.currentDate("yyyy-MM-dd HH:mm:ss");
			par = des.encrypt(par);// 加密
		} catch (Exception e) {
			e.printStackTrace();
		}
		return par;
	}

	/**
	 * 解密并返回String[0]=email;String[1]=发送时间
	 * 
	 * @param par
	 * @return
	 * @throws Exception
	 */
	public static String[] checkParIsValidity(String par) throws Exception {
		String[] result = new String[] {};
		DESor des = new DESor(AUDI_USER_ACTIVATE_KEY);
		par = des.decrypt(par);
		result = par.split(AUDI_USER_SPLIT);
		return result;
	}

	/**
	 * 发送邮件
	 * 
	 * @param to
	 *            收件邮箱集合
	 * @param subject
	 *            主题
	 * @param body
	 *            邮件内容
	 * @param flag
	 *            邮件类型
	 * @return 是否成功
	 */
	public static boolean sendEmail(String email, HttpServletRequest req, String flag, String username) {
		try {
			String subject = EmailUtilReset.getSubject();
			String activateUrl = getActivateUrl(email, req, flag);
			
			// 得到邮件内容
			String body = EmailUtilReset.getPwdBody(email, activateUrl, username);

			return sendEmail(email, subject, body);
		} catch (Exception e) {
			e.printStackTrace();
			CommonUtil.log.debug("发送邮件异常：" + e.getMessage());
			return false;
		}
	}

	public static boolean sendEmail(String email, String subject, String body) {
		try {
			// 以下变量为用户根据自己的情况设置
			//获取.properties文件的配置
			String host = ApplicationResources.getText("mail.host"); // 发送邮件服务器
			String user = ApplicationResources.getText("mail.user"); // 邮件服务器登录用户名
			String password = ApplicationResources.getText("mail.password"); // 邮件服务器登录密码
			String from = ApplicationResources.getText("mail.defaultemail"); // 发送人邮件地址
			String sendName = ApplicationResources.getText("mail.defaultname");// 发送人默认姓名
			String port = ApplicationResources.getText("mail.post");// 端口

			// 以下为发送程序，用户无需改动

			// 邮件初始化
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", port);// 端口号

			props.setProperty("mail.smtp.socketFactory.fallback", "false");
			props.setProperty("mail.smtp.socketFactory.port", port);
			props.setProperty("mail.smtp.starttls.enable", "true");
			// 获得session
			Session ssn = Session.getDefaultInstance(props, null);
			MimeMessage message = new MimeMessage(ssn);
			message.setSentDate(new Date());
			// 创建发件地址
			InternetAddress fromAddress = new InternetAddress(from, sendName,
					"utf-8");
			message.setFrom(fromAddress);
			// 创建收件地址集合
			InternetAddress toAddress = new InternetAddress(email);
			// 发送邮件
			message.addRecipient(Message.RecipientType.TO, toAddress);

			message.setSubject(subject, "utf-8");
			message.setText(body, "utf-8", "html");
			message.saveChanges();

			Transport transport = ssn.getTransport("smtp");
			transport.connect(host, user, password);
			transport.sendMessage(message, message
					.getRecipients(Message.RecipientType.TO));
			// transport.send(message);
			transport.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			CommonUtil.log.debug("发送邮件异常：" + e.getMessage());
			return false;
		}
	}

	public static String getSubject() {

		return "一汽-大众奥迪官方网站密码重置";
	}

	private static String getActivateUrl(String email, HttpServletRequest req,
			String flag) {
		String par = createParameter(email, req, flag);
		String domain = Requestor.getBasePath(req);
		return domain + action + "?par=" + par;
	}

	// 拼 密码重置邮件页面 
	//邮件中图片的绝对路径传测试和正式时需要做相应的修改
	public static String getPwdBody(String email, String url, String username) throws Exception {
		String basePath = "http://www1.audi.cn";
		Date date = new Date();
		String body = "<table width=\"643\" border=\"0\" align=\"center\"  cellspacing=\"0\" cellpadding=\"0\">"+
		"<tr>"+
		"  <td><img src=\"http://localhost:8080/audiweb/images/img_01.jpg\"/></td>"+
		" </tr>"+
		"<tr>"+
		"  <td><img src=\"http://localhost:8080/audiweb/images/img_02.jpg\"/></td>"+
		" </tr>"+
		"<tr>"+
		"  <td><img src=\"http://localhost:8080/audiweb/images/img_03.jpg\"/></td>"+
		"</tr>"+
		"<tr>"+
		"  <td style=\"padding-left:84px; color:#272727;\">"+
		"  	<p style=\"font:14px/1.8em '宋体',Helvetica,sans-serif;\">尊敬的" +
		username+
		"阁下:</p>"+
		"      <p style=\"font:14px/1.8em '宋体',Helvetica,sans-serif;\">感谢您申请成为一汽-大众奥迪官方网站注册用户！<br />您的登录账号：" +
		email+
		"</p>"+
		"	<p style=\"font:14px/1.8em '宋体',Helvetica,sans-serif;padding:18px 0 0;\">点击下方链接进行密码重置：</p>"+
	    "    <p>"+
	    "     	<a href=\"" +
	    url+
	    "\" style=\"color:#cc0033; font-family:'Verdana'\" target=\"_blank\">" +
	    url+
	    " </a>"+
	    "      </p>        "+
	    "     <p style=\"font:14px/1.8em '宋体',Helvetica,sans-serif;\">该链接将在24小时后失效，请及时更改您的密码，<br />以获悉更多奥迪精彩内容。</p>"+
	    "     <p style=\"font:12px/1.4em '宋体',Helvetica,sans-serif;\">"+
	    "     （如果链接无法正常打开，请复制到浏览器地址栏中）</p>"+
	    "     <p style=\"font:14px/1.8em '宋体',Helvetica,sans-serif;padding:20px 0 40px;\">此邮件为系统自动发出，请勿直接回复。<br />"+
	    "      如您并未在一汽-大众奥迪官方网站注册，"+
	    "       请忽略本邮件及以上<br>验证链接，该帐户将不会被激活，谢谢！<br />"+
	    "      感谢您对奥迪品牌的支持和关注！</p>"+
	    "  </td>"+
	    " </tr>"+
	    " <tr>"+
	    " 	<td style=\"text-align:right;padding-right:80px;\">"+
	    "  	<span style=\"font:14px/1.8em '宋体',Helvetica,sans-serif;\">一汽大众奥迪官方网站</span>"+
	    "      <a href = \"#\" style=\"color:#cc0033;font:14px/1.8em 'Verdana'; text-decoration:none;\" target=\"_blank\"> wwww.audi.cn</a>"+
	    "   </td>"+
	    " </tr>"+
	    " <tr>"+
	    "  	<td style=\"text-align:right;padding:0 80px 40px 0;font:14px/1.8em '宋体',Helvetica,sans-serif;\">"+
	    UtilTools.formatDate(date, "yyyy年MM月dd日 HH时mm分ss秒")+
	    "  </td>"+
	    " </tr>"+
	    "</table>";
		return body;

	}
}
