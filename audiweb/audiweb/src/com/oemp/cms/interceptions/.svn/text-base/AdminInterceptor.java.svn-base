package com.oemp.cms.interceptions;

import java.util.Date;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oemp.frame.util.CmsConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 后台管理登录拦截
 * @author cdy
 *
 */
@SuppressWarnings("serial")
public class AdminInterceptor extends AbstractInterceptor{
	private static final Logger log = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		String result="adminLogin";
		
		ActionContext ctx=ActionContext.getContext();
		Map sess=ctx.getSession();
		Object rand = sess.get(CmsConstants.ADMIN_USER);
		log.debug("time s:"+new Date(System.currentTimeMillis()));
		if(rand!=null){
			result=arg0.invoke();
		}
		log.debug("time e:"+new Date(System.currentTimeMillis()));
		return result;
	}

}
