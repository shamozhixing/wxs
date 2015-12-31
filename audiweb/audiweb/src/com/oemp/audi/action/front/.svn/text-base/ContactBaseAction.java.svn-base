package com.oemp.audi.action.front;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.util.CommonUtil;
import com.oemp.frame.action.BaseAction;
@SuppressWarnings("serial")
public class ContactBaseAction extends BaseAction {
	/**
	 * session用户信息
	 * @return
	 */
	public TbRegUser getWebUser(){
		return (TbRegUser)getSessionValue(CommonUtil.WEB_USER);
	}
	/**存入session*/
	public void setWebUser(TbRegUser user){
		setSessionValue(CommonUtil.WEB_USER,user);
	}
	/**
	 * 添加Cookie
	 * @param key
	 * @param value
	 * @param timeOut:失效时间，单位(s)
	 */
	public void setCookie(String key,String value,int timeOut) {  
      Cookie cookie = new Cookie(key, value);
      //设置Cookie的生命周期
      cookie.setMaxAge(timeOut);
      ServletActionContext.getResponse().addCookie(cookie);
   }
	/**
	 * 获取Cookie
	 * @param key
	 */
	public String getCookie(String key) {  
		//取出所有的cookie
		 Cookie[] cookies = ServletActionContext.getRequest().getCookies();
		 if(null != cookies){
			 for (Cookie ck : cookies) {
				if(key.equals(ck.getName())){
					return ck.getValue();
				}
			 }
		 }
		 return null;
	 }
}
