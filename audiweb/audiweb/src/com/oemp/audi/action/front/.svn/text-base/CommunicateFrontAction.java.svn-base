package com.oemp.audi.action.front;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.Communicate;
import com.oemp.audi.bean.ContactAsk;
import com.oemp.audi.bean.ContactComplaint;
import com.oemp.audi.bean.ContactProposal;
import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.DateUtil;
@Controller("audi.front.action.CommunicateFrontAction")
@Scope("prototype")
public class CommunicateFrontAction extends ContactBaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	Communicate cc=new Communicate();
	ContactAsk contactAsk=new ContactAsk();
	ContactComplaint contactComplaint=new ContactComplaint();
	ContactProposal contactProposal=new ContactProposal();
	ContactComplaint contactComplaint_result=null;
	ContactProposal contactProposal_result=null;
	ContactAsk contactAsk_result=null;
	TbRegUser user = new TbRegUser();
	
	public String init(){		
		return SUCCESS;
	}
	
	public String  save(){
		//System.out.println("我进来了");
		Map map=new HashMap();
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		user = this.getWebUser();
		if(user!=null && user.getUserid()>0){
			contactComplaint.setCcUserid(user.getUserid());
			contactProposal.setCpUserid(user.getUserid());
			contactAsk.setCaUserid(user.getUserid());
		}
		try{
			if(cc.getAnswersex()==2){
				contactComplaint.setCcName(cc.getCcName());  //投诉
				contactComplaint.setCcBirthday(cc.getCcBirthday());
				contactComplaint.setCcGender(cc.getCcGender());
				contactComplaint.setCcMobile(cc.getCcMobile());
				contactComplaint.setCcType(cc.getCcType());
				if(cc.getCcType()==2){
					contactComplaint.setCcModel(cc.getCcModel());
					contactComplaint.setCcBuyyear(cc.getCcBuyyear());
					contactComplaint.setCcBuymonth(cc.getCcBuymonth());
					contactComplaint.setCcFootnum(cc.getCcFootnum());
					contactComplaint.setCcKilometer(cc.getCcKilometer());					
				}
				contactComplaint.setCcProvince(cc.getCcProvince());
				contactComplaint.setCcCity(cc.getCcCity());
				contactComplaint.setCcDealer(cc.getCcDealer());				
				contactComplaint.setCcDescription(cc.getCcDescription());
				contactComplaint.setCcWhen(cc.getCcWhen());
				contactComplaint.setCcTiming(cc.getCcTiming());
				contactComplaint.setCcCode(cc.getCcCode());
				contactComplaint.setCcAddtime(DateUtil.getNowDate());
				contactComplaint_result=audiServiceDispatcher.getContactComplaintService().save(contactComplaint);
			}
			if(cc.getAnswersex()==3){
				contactProposal.setCpAddtime(DateUtil.getNowDate());   //建议存储
				contactProposal.setCpDescription(cc.getCpDescription());
				contactProposal.setCpWhen(cc.getCpWhen());
				contactProposal.setCpTiming(cc.getCpTiming());
				contactProposal.setCpName(cc.getCcName());    //姓名性别等公用字段都在ContactComplaint 对象中
				contactProposal.setCpBirthday(cc.getCcBirthday());
				contactProposal.setCpGender(cc.getCcGender());
				contactProposal.setCpMobile(cc.getCcMobile());
				contactProposal_result=audiServiceDispatcher.getContactProposalService().save(contactProposal);
			}

			if(cc.getAnswersex()==1){
				contactAsk.setCaName(cc.getCcName());  //咨询
				contactAsk.setCaBirthday(cc.getCcBirthday());
				contactAsk.setCaGender(cc.getCcGender());
				contactAsk.setCaMobile(cc.getCcMobile());
				contactAsk.setCaAddtime(DateUtil.getNowDate());
				contactAsk.setCaDescription(cc.getCaDescription());
				contactAsk.setCaWhen(cc.getCaWhen());
				contactAsk.setCaTiming(cc.getCaTiming());
				contactAsk_result=audiServiceDispatcher.getContactAskService().save(contactAsk);
			}
			
			
			map.put("success", "true");
			map.put("msg", "");
			if(contactProposal_result==null&&contactComplaint_result==null&&contactAsk_result==null){
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
	
	
	
	
	
	public Communicate getCc() {
		return cc;
	}
	public void setCc(Communicate cc) {
		this.cc = cc;
	}
	
	
	
}
