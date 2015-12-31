package com.oemp.audi.action.front;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.frame.action.BaseAction;
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.front.action.ContactUsAction")
public class ContactUsAction extends ContactBaseAction {
	
	/**
	 * 进入试驾也初始化
	 * @return
	 */
	public String init(){
		return SUCCESS;
	}
	
}
