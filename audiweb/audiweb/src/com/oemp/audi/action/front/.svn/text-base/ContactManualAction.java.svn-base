/**
 * 
 */
package com.oemp.audi.action.front;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.oemp.audi.bean.ContactManual;
import com.oemp.audi.bean.ContactProductbook;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.cms.action.AdminAction;
import com.oemp.common.UtilTools;
import com.oemp.frame.action.BaseAction;
import com.oemp.frame.util.DateUtil;

/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-5-27
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.action.front.ContactManualAction")
public class ContactManualAction extends ContactBaseAction{
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	public 	ContactManual ma=new ContactManual();
	List<ContactProductbook> cpList;
	public String init(){
		cpList=audiServiceDispatcher.getContactProductbookService().getByCpType(0);
		return SUCCESS;
	}
	
	public String getJson(){
		Map<Object, List<ContactProductbook>> map=new HashMap<Object, List<ContactProductbook>>();
		for (int i = 0; i < cpList.size(); i++) {
			ContactProductbook bean=cpList.get(i);
			//是否已经有了
			if(map.containsKey(bean.getCpIntentcars())){
				map.get(bean.getCpIntentcars()).add(bean);
			}else{
				List<ContactProductbook> list=new ArrayList<ContactProductbook>();
				list.add(bean);
				map.put(bean.getCpIntentcars(), list);
			}
		}
		return UtilTools.getJsonForObject(map);
	}
	public String save(){
		 Map map=new HashMap();
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		try{
				ma.setCmAddtime(DateUtil.getNowDate());
				ma.setCmAvailabilityflag("1");
				ContactManual  man =audiServiceDispatcher.getContactManualService().save(ma);
				 map.put("success", "true");
				 map.put("msg", "");
				 if(man==null){
					map.put("success", "false");
					 map.put("msg", "提交失败!");
				}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "false");
			map.put("msg", e.getMessage());
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	/**
	 * @return the ma
	 */
	public ContactManual getMa() {
		return ma;
	}
	/**
	 * @param ma the ma to set
	 */
	public void setMa(ContactManual ma) {
		this.ma = ma;
	}

	/**
	 * @return the cpList
	 */
	public List<ContactProductbook> getCpList() {
		return cpList;
	}

	/**
	 * @param cpList the cpList to set
	 */
	public void setCpList(List<ContactProductbook> cpList) {
		this.cpList = cpList;
	}


	
}
