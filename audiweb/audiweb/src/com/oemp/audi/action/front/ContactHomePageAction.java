package com.oemp.audi.action.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.frame.util.CmsUtils;
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.front.action.ContactHomePageAction")
public class ContactHomePageAction extends ContactBaseAction {
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	
	/**
	 * 进入试驾也初始化
	 * @return
	 */
	public String init(){
		String _remember=getCookie("_remember");
		if(!CmsUtils.isEmpty(_remember) && "1".equals(_remember) && getWebUser()==null){
			String _email=getCookie("_email").replace("|", "@");
			String _password=getCookie("_password");
			TbRegUser cacheUser = audiServiceDispatcher.getRegUserService().isPassword(_email,_password);
			if(cacheUser!=null){
				this.setWebUser(cacheUser);
			}
		}
		return "init";
	}
	
	
}
