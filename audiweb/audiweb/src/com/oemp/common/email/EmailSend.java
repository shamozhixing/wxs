/**
 *@Company ogilvy
 *@author wake 
 *@Created on 2009-4-1
 */
package com.oemp.common.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


import com.oemp.common.email.EmailBean;
import com.oemp.frame.util.ApplicationResources;


public class EmailSend {

	private String host;

	private String user;

	private String password;

	private String issmtp;

	private static String defaultemail;
	
	private static String defaultname;
	
	
	//private static SendEmailLog sel = new SendEmailLog();
	
	static Session session = null;
	
	public EmailSend() {
		try {
			if(session==null){
				host = ApplicationResources.getText("mail.host");
				user = ApplicationResources.getText("mail.user");
				password = ApplicationResources.getText("mail.password");
				issmtp = ApplicationResources.getText("mail.issmtp");
				defaultemail = ApplicationResources.getText("mail.defaultemail");
				defaultname = ApplicationResources.getText("mail.defaultname");
				init();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	public void init(){
		boolean sessionDebug = false;
		Properties props = System.getProperties();
		props.put("mail.smtp.host", this.host);
		props.put("mail.transport.protocal", "SMTP");
		
		Authenticator sa = null;

		if (this.issmtp.equals("true")) {
			sa = new PasswordAuthenticator(this.user, this.password);
			props.put("mail.smtp.auth", "true");
		}
		session = Session.getInstance(props, sa);
		session.setDebug(sessionDebug);
	}

	public boolean send(EmailBean eb) {
        try {
            Message msg = new MimeMessage(session);
            
			String formmail = eb.getFrom();
			if (formmail == null || formmail.trim().equals("null")) {
				formmail = defaultemail;
			}
			String formname = eb.getFromname();
			if(formname==null || formname.trim().length()==0){
				formname = defaultname;
			}
			
			msg.setFrom(new InternetAddress(formmail,formname));
			
			if (eb.getTt() != null && eb.getTt().trim().length() > 0) {
				try {
					msg.setRecipient(Message.RecipientType.TO, new InternetAddress(eb.getTo(), eb.getTt()));
				} catch (Exception ee) {
					ee.printStackTrace();
				}
			}else{
				msg.setRecipients(Message.RecipientType.TO, (Address[])InternetAddress.parse(eb.getTo()));
			}
			/*if (eb.getTt() != null && eb.getTt().trim().length() > 0) {
				try {
					msg.setRecipient(Message.RecipientType.CC, new InternetAddress(eb.getTt()));
				} catch (Exception ee) {
					ee.printStackTrace();
				}
			}*/

            msg.setSubject(eb.getTitle());
			msg.setSentDate(new Date());
			
			if(eb.getSendtype()==0){
				Multipart mp = new MimeMultipart();
				MimeBodyPart bp = new MimeBodyPart();
				bp.setContent(eb.getContent(), "text/html;charset=UTF-8");
				mp.addBodyPart(bp);
				msg.setContent(mp);
			}
			else{
				msg.setText(eb.getContent());
			}
			
//			Multipart mp = new MimeMultipart();
//			if (mp != null) {
//				MimeBodyPart bp = new MimeBodyPart();
//				bp.setContent(eb.getContent(), "text/html;charset=gb2312");
//				mp.addBodyPart(bp);
//				msg.setContent(mp);
//			} else {
//				
//			}
			Transport.send(msg);
			//sel = new SendEmailLog();
			//sel.writeLine(new Date()+","+formmail+","+eb.getTo());
			return true;
        }
        catch (MessagingException e) {
            System.out.println("email1:"+eb.getTo() + ":" + eb.getTt() + ":" + eb.getContent());
            e.printStackTrace();
        }
        catch (Exception e) {
        	System.out.println("email2:"+eb.getTo());
            e.printStackTrace();
        }
        
        return false;
	}
	
	public static void main(String[] str){
		EmailBean eb = new EmailBean();
		eb.setTitle("test");
		eb.setTo("chendeyun_hunan@hotmail.com");
		eb.setContent("test");
		new EmailSend().send(eb);
	}
}
