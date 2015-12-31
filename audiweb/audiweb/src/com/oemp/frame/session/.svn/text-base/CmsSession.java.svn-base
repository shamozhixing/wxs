package com.oemp.frame.session;

import com.opensymphony.xwork2.ActionContext;

/** 
 * WEB SESSION 处理
 * @author cdy
 *
 */
public class CmsSession {
	private static CmsSession cs = new CmsSession();
	private CmsSession(){
	}
	/** 获取session对象 */
	public static CmsSession getInstance(){
		return cs;
	}
	/** 获取 session key 值 */
	public Object get(String key){
		return ActionContext.getContext().getSession().get(key);
	}
	/** 存 session key value */
	public void pub(String key, Object value){
		ActionContext.getContext().getSession().put(key, value);
	}
	

}
