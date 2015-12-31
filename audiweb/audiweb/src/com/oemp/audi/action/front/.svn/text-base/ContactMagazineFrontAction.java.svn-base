package com.oemp.audi.action.front;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.ContactMagazine;
import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.DateUtil;
@Controller("audi.front.action.ContactMagazineFrontAction")
@Scope("prototype")
public class ContactMagazineFrontAction extends ContactBaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	

	TbRegUser user = new TbRegUser();
	ContactMagazine cm=new ContactMagazine();
	
	//进入索取杂志初始化
	public String init(){
		return SUCCESS;
	}
	
	public void save(){
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		
		user = this.getWebUser();
		
		Map map=new HashMap();
		try{
		if(user!=null && user.getUserid()>0){
			cm.setCmUserid(user.getUserid());
		}
		cm.setCmAddtime(DateUtil.getNowDate());
		
		if(cm.getCmIscar()==0){
			cm.setCmBrand(null);
			cm.setCmModel(null);
			cm.setCmBuyyear("");
			cm.setCmBuymonth("");
		}
			ContactMagazine bean=audiServiceDispatcher.getContactMagazineService().save(cm);
			 map.put("success", "true");
			 map.put("msg", "");
			 if(bean==null){
				map.put("success", "false");
				map.put("msg", "提交失败!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "false");
			map.put("msg", e.getMessage());
		}
		renderJson(UtilTools.getJsonForObject(map));
		
	}

	public ContactMagazine getCm() {
		return cm;
	}

	public void setCm(ContactMagazine cm) {
		this.cm = cm;
	}
	
	


	
	
	
}
