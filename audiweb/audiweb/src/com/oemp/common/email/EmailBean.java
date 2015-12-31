/**
 *@Company ogilvy
 *@author wake 
 *@Created on 2009-4-1
 */
package com.oemp.common.email;

public class EmailBean {
	
	//发件人邮箱
	private String from;
	//发件人名称
	private String fromname;
	//收件人
	private String to;
	//抄送人
	private String tt;
	//邮件标题
	private String title;
	//邮件内容
	private String content;
	//邮件发送方式 0,html 1,文本
	private int sendtype = 0;
	
	private String charset = "GB2312";
	
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getTt() {
		return tt;
	}
	public void setTt(String tt) {
		this.tt = tt;
	}
	public int getSendtype() {
		return sendtype;
	}
	public void setSendtype(int sendtype) {
		this.sendtype = sendtype;
	}
	public String getFromname() {
		return fromname;
	}
	public void setFromname(String fromname) {
		this.fromname = fromname;
	}
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	
	
}
