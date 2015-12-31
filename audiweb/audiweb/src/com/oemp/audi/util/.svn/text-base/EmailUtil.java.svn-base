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

public final class EmailUtil {
	private static final String AUDI_USER_ACTIVATE_KEY = "AudiC1ub_@email!key%1*4";// 激活字符串密钥
	private static final String AUDI_USER_SPLIT = "-&-";

	public static final String AUDI_USER_FANSID = "fansId";
	public static final String AUDI_USER_Q3CREATIONID = "q3Reg";

	public static final String USER_EMAILVALID_YSE = "1";// 已激活
	public static final String USER_EMAILVALID_NO = "0";// 未激活

	public static final String USER_EMAILTYPE_NORMAL = "0";// 普通邮件
	public static final String USER_EMAILTYPE_Q3 = "1";// Q3邮件

	public static final String USER_EMAIL_PARAM_NORMAL = "utm_source=mail&utm_medium=jh&utm_campaign=clubjh";
	public static final String USER_EMAIL_PARAM_Q3 = "utm_source=mail&utm_medium=jihuo&utm_campaign=q3";

	private static final String action = "userdoActivate.action";

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
			if (fansId != null && !fansId.equals("null") && !fansId.equals("")) {
				par = email + AUDI_USER_SPLIT
						+ Dator.currentDate("yyyy-MM-dd HH:mm:ss")
						+ AUDI_USER_SPLIT + AUDI_USER_FANSID + fansId;
			} else {
				par = email + AUDI_USER_SPLIT
						+ Dator.currentDate("yyyy-MM-dd HH:mm:ss");
			}

			// 根据邮件类型添加的内容 - 扩展Q3活动
			if (flag == EmailUtil.USER_EMAILTYPE_Q3) {
				par += AUDI_USER_SPLIT + AUDI_USER_Q3CREATIONID;
			}

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
	public static boolean sendEmail(String email, HttpServletRequest req,
			String flag) {
		try {
			String subject = EmailUtil.getSubject();
			String activateUrl = getActivateUrl(email, req, flag);
			
			// 得到邮件内容
			String body = EmailUtil.getBody(email, activateUrl, flag);

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
			String host = "mail.audi.cn"; // 发送邮件服务器
			String user = "careers@audi.cn"; // 邮件服务器登录用户名
			String password = "careermail"; // 邮件服务器登录密码
			String from = "careers@audi.cn"; // 发送人邮件地址
			String sendName = "AudiClub";
			/*
			 * String host = "mail.ogilvy.com.cn"; String user =
			 * "test@ogilvy.com.cn"; String password = "testmail!@#"; String
			 * from = "test@ogilvy.com.cn";
			 */
			String port = "25";

			// 以下为发送程序，用户无需改动

			// 邮件初始化
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", port);// 端口号

			// props.setProperty("mail.smtp.socketFactory.class",
			// "javax.net.ssl.SSLSocketFactory");
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
			// for (int i = 0; i < to.length; i++) {
			// toAddress[i] = new InternetAddress(to[i]);
			// }
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

		return "奥迪用户激活邮箱";
	}

	private static String getActivateUrl(String email, HttpServletRequest req,
			String flag) {
		String par = createParameter(email, req, flag);
		
		//根据活动类型  加入监控参数代码
		String param = "";
		if(flag == EmailUtil.USER_EMAILTYPE_Q3){
			param = EmailUtil.USER_EMAIL_PARAM_Q3;
		}else{
			param = EmailUtil.USER_EMAIL_PARAM_NORMAL;
		}
		
		String domain = Requestor.getBasePath(req);
		return domain + action + "?par=" + par + "&" + param;
	}

	public static String getBody(String email, String url, String flag)
			throws Exception {
		Date date = new Date();
		String body = "<p>	&nbsp;</p><table border='0' cellpadding='0' cellspacing='0' style='margin-left: 10px; ' width='620'>"
				+ "<tbody><tr><td style='font-size: 12px; line-height: 25px; padding-top: 10px; '><strong>尊敬的用户"
				+ email
				+ ",您好！"
				+ "</strong></td></tr><tr><td style='line-height: 18px; padding-top: 15px; font-size: 12px; '>"
				+ "感谢您于"
				// +
				// DateUtil.formatDate(UtilTools.getCurrrentDate1(),"yyyy年MM月dd日 hh时mm分ss秒")
				+ UtilTools.formatDate(date, "yyyy年MM月dd日 HH时mm分ss秒")
				+ "申请验证邮箱，点击以下链接，即可完成安全验证：<br />"
				+ "<a href='"
				+ url
				+ "' target='_blank'>" + url + "</a></td></tr>";
		if (flag == EmailUtil.USER_EMAILTYPE_Q3) {
			body += "<tr><td style='line-height: 20px; padding-top: 15px; font-size: 13px; '><strong>"
					+ "特别提示：完成认证后，请返回Q3活动网站我行我塑页面，使用注册的账号和密码保存潮流影片，赢取奥迪精美礼品！"
					+ "</strong><td/><tr>";
		}
		body += "<tr>"
				+ "<td style='line-height: 20px; padding-top: 15px; font-size: 12px; '>	"
				+ "为保障您的帐号安全，请在24小时内点击该链接，您也可以将链接复制到浏览器地址栏访问。<br />"
				+ "若您没有申请过验证邮箱 ，请您忽略此邮件，由此给您带来的不便请谅解。</td></tr></tbody></table>";
		return body;
	}

	public static String getPwdBody(String username, String email,
			String password) throws Exception {
		String basePath = "http://www1.audi.cn";
		StringBuffer sb = new StringBuffer();
		sb
				.append("<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<title>忘记密码</title>");
		sb
				.append("<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>");
		sb.append("</head>");

		sb
				.append("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' ");
		sb
				.append("<table style='background-image:url(http://www1.audi.cn/front/images_edm/bg.png)' width='100%'><tr><td>");
		sb
				.append("<table width='481' border='0' align='center' cellpadding='0' cellspacing='0'>");
		sb.append("  <tr>");
		sb
				.append("    <td><table width='481' border='0' cellspacing='0' cellpadding='0'>");
		sb.append("      <tr>");
		sb
				.append("        <td width='241'><img src='"
						+ basePath
						+ "/front/images_edm/new_logo_vw.gif' alt='一汽-大众' width='120' height='70'></td>");
		sb
				.append("        <td width='240' align='right'><img src='"
						+ basePath
						+ "/front/images_edm/audi_logo_new_cn.gif' alt='Audi' width='240' height='70'></td>");
		sb.append("      </tr>");
		sb.append("    </table>");
		sb
				.append("      <table width='481' border='0' cellspacing='0' cellpadding='0'>");
		sb.append("        <tr>");
		sb
				.append("          <td width='481'><img src='"
						+ basePath
						+ "/front/images_edm/fpasswd.jpg' alt='忘记密码' width='481' height='250'></td>");
		sb.append("        </tr>");
		sb.append("      </table>      ");
		sb.append("<br><br>");
		sb
				.append("<table width='393' border='0' align='center' cellpadding='0' cellspacing='0'>");
		sb.append("        <tr>");
		sb
				.append("          <td width='393' style='font-family:Arial, Helvetica, sans-serif; font-size: 12px; color: #3A3A3A; line-height: 18px;'>");

		sb.append("		  <strong>尊敬的：" + username);
		sb.append("            </strong>");
		sb.append("            <p>下面是您登录所需的电子邮件和密码，其中密码为新生成密码，请妥善保管。</p>");
		sb.append("            <p>电子邮件：" + email + "<br>");
		sb.append("              密　　码：" + password + "</p>");
		sb.append("            <p>您也可以通过点击下面的链接进入网站修改您的密码。<br>");
		sb
				.append("            <a href='"
						+ ApplicationResources.getText("mail.basePath")
						+ "' target='_blank' style='font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #3A3A3A;'>"
						+ ApplicationResources.getText("mail.basePath")
						+ "</a></p>");
		sb.append("            <p>感谢您对一汽-大众奥迪品牌的关注！</p>");
		sb
				.append("          <p align='right'>一汽-大众奥迪品牌<a href='http://www.audi.cn/' target='_blank' style='font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #3A3A3A;'>www.audi.cn</a></p>");
		sb.append("			</td>");
		sb.append("        </tr>");
		sb.append("      </table>");
		sb.append("	  <p>&nbsp;</p>");
		sb.append("    <p>&nbsp;</p></td>");
		sb.append("  </tr>");
		sb.append("</table>");
		sb.append("</td></tr></table>");
		sb.append("</body>");
		sb.append("</html>");

		return sb.toString();

		// b
		// =sendnewemail.send("一汽-大众奥迪品牌网站——您新的登录密码！",user.getEmail(),sb.toString(),"一汽-大众奥迪");

	}

	public static final void main(String[] m) {
	}
}
