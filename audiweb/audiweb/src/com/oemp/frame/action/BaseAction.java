package com.oemp.frame.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oemp.frame.session.CmsSession;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public abstract class BaseAction extends ActionSupport {
	

	private static final Logger log = LoggerFactory.getLogger(BaseAction.class);

	/**
	 * 直接输出内容的简便函数.
	 */
	protected String render(String text, String contentType) {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType(contentType);
			response.getWriter().write(text);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 直接输出字符串.
	 */
	protected String renderText(String text) {
		return render(text, "text/plain;charset=UTF-8");
	}

	/*protected String renderJson(String text) {
		return renderText(text);
	}*/
	
	public String renderJson(String text) {
		return render(text, "application/json;charset=UTF-8");
	}

	/**
	 * 直接输出字符串GBK编码.
	 */
	protected String renderHtmlUTF8(String html) {
		return render(html, "text/html;charset=UTF-8");
	}

	/**
	 * 直接输出XML.
	 */
	protected String renderXML(String xml) {
		return render(xml, "text/xml;charset=UTF-8");
	}

	/** 存session */
	public void setSessionValue(String key, Object value) {
		CmsSession.getInstance().pub(key, value);
	}

	/** 读取session */
	public Object getSessionValue(String key) {
		return CmsSession.getInstance().get(key);
	}
}
