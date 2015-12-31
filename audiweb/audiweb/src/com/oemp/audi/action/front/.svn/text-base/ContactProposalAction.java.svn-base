package com.oemp.audi.action.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.ContactProposal;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.frame.action.BaseAction;
//http://localhost:8080/audiweb/admin/contactProposal_save.action?cpId=1&cpUserid=123456
@Controller("audi.front.action.ContactProposalAction")
@Scope("prototype")
public class ContactProposalAction extends ContactBaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	private String rows;//前台以JSON的形式传递数据
	//----------------------测试以后删除
	 private Long cpId;
     private Long cpUserid;
     private Date cpAddtime;
     private String cpName;
     private Long cpGender;
     private String cpMobile;
     private Date cpBirthday;
     private String cpDescription;
     private Long cpWhen;
     private String cpTiming;
	//---------------------
	public void save(){
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
//		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
//		long cpId=js.getLong("cpId");
//		long cpUserid=js.getLong("cpUserid");
//		String cpAddtime=js.getString("cpAddtime");
//		String cpName=js.getString("cpName");
//		long cpGender=js.getLong("cpGender");
//		String cpMobile=js.getString("cpMobile");
//		String cpDescription=js.getString("cpDescription");
//		long cpWhen=js.getLong("cpWhen");
//		long cpTiming=js.getLong("cpTiming");
		
		ContactProposal contactProposal=new ContactProposal();
		contactProposal.setCpId(cpId);
		contactProposal.setCpUserid(cpUserid);
		contactProposal.setCpAddtime(cpAddtime);
		contactProposal.setCpName(cpName);
		contactProposal.setCpGender(cpGender);
		contactProposal.setCpMobile(cpMobile);
		contactProposal.setCpDescription(cpDescription);
		contactProposal.setCpWhen(cpWhen);
		contactProposal.setCpTiming(cpTiming);
		audiServiceDispatcher.getContactProposalService().save(contactProposal);
		
		 StringBuffer jsonString =new StringBuffer();
	        jsonString.append("{");
	        jsonString.append("success:true");
	        jsonString.append("}");
	    	PrintWriter out;
	        try {
	            out = ServletActionContext.getResponse().getWriter();
	            out.print(jsonString);
	            out.flush();
	            out.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	}
	
	
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}

//-----------------------以下测试以后删除
	public Long getCpId() {
		return cpId;
	}


	public void setCpId(Long cpId) {
		this.cpId = cpId;
	}


	public Long getCpUserid() {
		return cpUserid;
	}


	public void setCpUserid(Long cpUserid) {
		this.cpUserid = cpUserid;
	}




	public Date getCpAddtime() {
		return cpAddtime;
	}


	public void setCpAddtime(Date cpAddtime) {
		this.cpAddtime = cpAddtime;
	}


	public String getCpName() {
		return cpName;
	}


	public void setCpName(String cpName) {
		this.cpName = cpName;
	}


	public Long getCpGender() {
		return cpGender;
	}


	public void setCpGender(Long cpGender) {
		this.cpGender = cpGender;
	}


	public String getCpMobile() {
		return cpMobile;
	}


	public void setCpMobile(String cpMobile) {
		this.cpMobile = cpMobile;
	}


	public Date getCpBirthday() {
		return cpBirthday;
	}


	public void setCpBirthday(Date cpBirthday) {
		this.cpBirthday = cpBirthday;
	}


	public String getCpDescription() {
		return cpDescription;
	}


	public void setCpDescription(String cpDescription) {
		this.cpDescription = cpDescription;
	}


	public Long getCpWhen() {
		return cpWhen;
	}


	public void setCpWhen(Long cpWhen) {
		this.cpWhen = cpWhen;
	}


	public String getCpTiming() {
		return cpTiming;
	}


	public void setCpTiming(String cpTiming) {
		this.cpTiming = cpTiming;
	}



	
	
}
