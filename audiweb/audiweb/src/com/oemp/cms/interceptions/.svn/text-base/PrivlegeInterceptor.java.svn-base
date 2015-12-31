package com.oemp.cms.interceptions;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oemp.cms.action.AdminAction;
import com.oemp.cms.util.PrivlegeUtil;
import com.oemp.frame.exception.CmsExceptionUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


/** 权限菜栏功能拦截 */
@SuppressWarnings("serial")
public class PrivlegeInterceptor  extends AbstractInterceptor{
	private static final Logger log = LoggerFactory.getLogger(PrivlegeInterceptor.class);
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		ActionContext ctx=ActionContext.getContext();
		if(!(arg0.getAction() instanceof AdminAction)){
			throw CmsExceptionUtil.getPrivlegeException("系统错误,非功能管理操作,请检查!", null);
		}
		
		
		AdminAction act = (AdminAction) arg0.getAction();

		String methodType = PrivlegeUtil.QUERY ;
		
		HttpServletRequest req = (HttpServletRequest) ctx.get(StrutsStatics.HTTP_REQUEST);
		String actName = req.getRequestURL().toString(); //ctx.getName();
		int imethod = actName.indexOf("!");
		imethod = imethod>0?imethod:actName.indexOf("_");
		if(imethod>0){
			methodType = actName.substring(imethod+1).replace(".action", "");
		}
		
		act.setMethod(methodType);
		Integer menuId = act.getNodeid(); 
		if(log.isDebugEnabled()) log.debug("actName {} menuId {} imethod {}", new Object[]{actName, menuId , imethod});
		if(PrivlegeUtil.SYSTEM_PRIVEGE){
			if(log.isDebugEnabled()) log.debug("---判断权限开始");
			/* 当前访问的菜单 */
			if(menuId!=null && menuId>0){
				String val = PrivlegeUtil.getPrivlegeValue(menuId);
				if(val==null) throw CmsExceptionUtil.getPrivlegeException("没有此功能菜单操作权限!", null);
				
				//判断权限 
				String mq = methodType.toUpperCase();
				List<String> vlist = PrivlegeUtil.getPrivlegeValues();
				for(int i=0;i<vlist.size();i++){
					if(mq.indexOf(vlist.get(i))>-1){
						if(!PrivlegeUtil.isPrivlege(menuId, vlist.get(i))){
							throw CmsExceptionUtil.getPrivlegeException("没有此功能菜单操作权限!", null);
						}
					}
				}
			}else {
				throw CmsExceptionUtil.getPrivlegeException("功能菜单操作权限ID不能为空!", null);
			}
			if(log.isDebugEnabled()) log.debug("---判断权限结束");
		}
		if(log.isDebugEnabled()) log.debug("method:"+methodType+" -- PrivlegeTime:"+new Date(System.currentTimeMillis()));
		
		return arg0.invoke();
	}

}
