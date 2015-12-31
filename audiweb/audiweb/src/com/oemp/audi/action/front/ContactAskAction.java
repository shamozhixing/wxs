package com.oemp.audi.action.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.ContactAsk;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.frame.action.BaseAction;
//http://localhost:8080/audiweb/admin/contactAsk_save.action?caId=111&caUserid=123&caName=liu&caGender=1234&caMobile=123456789&caDescription=acb&caWhen=234&caTiming=322
@Controller("audi.front.action.ContactAskAction")
@Scope("prototype")
public class ContactAskAction extends ContactBaseAction {
	@Autowired
	protected  ServiceDispatcher  serviceDispatcher;
	
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	private String rows;//前台以JSON的形式传递数据

    private Long caId;				//	咨询表主键
    private Long caUserid;			//	用户ID
    private Date caAddtime;		//	创建日期
    private String caName;			//	姓名
    private Long caGender;			//	称谓（性别）1 男；0：女
    private String caMobile;		//	手机号码
    private Date caBirthday;		//	出生日期 
    private String caDescription;	//	咨询问题描述
    private Long caWhen;			//	何时联系您 工作日、节假日...
    private String caTiming;				//	具体时间 如 ： 上午10点
	
	public void save(){
		//System.out.println("我是action");

		
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		 
		 ContactAsk contactAsk=new ContactAsk();
		 
		 contactAsk.setCaId(caId);
		 contactAsk.setCaUserid(caUserid);
		 contactAsk.setCaAddtime(caAddtime);
		 contactAsk.setCaName(caName);
		 contactAsk.setCaGender(caGender);
		 contactAsk.setCaMobile(caMobile);
		 contactAsk.setCaDescription(caDescription);
		 contactAsk.setCaWhen(caWhen);
		 contactAsk.setCaTiming(caTiming);
		 audiServiceDispatcher.getContactAskService().save(contactAsk);
		 
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

	public ServiceDispatcher getServiceDispatcher() {
		return serviceDispatcher;
	}

	public void setServiceDispatcher(ServiceDispatcher serviceDispatcher) {
		this.serviceDispatcher = serviceDispatcher;
	}

	public Long getCaId() {
		return caId;
	}

	public void setCaId(Long caId) {
		this.caId = caId;
	}

	public Long getCaUserid() {
		return caUserid;
	}

	public void setCaUserid(Long caUserid) {
		this.caUserid = caUserid;
	}

	public Date getCaAddtime() {
		return caAddtime;
	}

	public void setCaAddtime(Date caAddtime) {
		this.caAddtime = caAddtime;
	}

	public String getCaName() {
		return caName;
	}

	public void setCaName(String caName) {
		this.caName = caName;
	}

	public Long getCaGender() {
		return caGender;
	}

	public void setCaGender(Long caGender) {
		this.caGender = caGender;
	}

	public String getCaMobile() {
		return caMobile;
	}

	public void setCaMobile(String caMobile) {
		this.caMobile = caMobile;
	}

	public Date getCaBirthday() {
		return caBirthday;
	}

	public void setCaBirthday(Date caBirthday) {
		this.caBirthday = caBirthday;
	}

	public String getCaDescription() {
		return caDescription;
	}

	public void setCaDescription(String caDescription) {
		this.caDescription = caDescription;
	}

	public Long getCaWhen() {
		return caWhen;
	}

	public void setCaWhen(Long caWhen) {
		this.caWhen = caWhen;
	}

	public String getCaTiming() {
		return caTiming;
	}

	public void setCaTiming(String caTiming) {
		this.caTiming = caTiming;
	}


    
    //--------------------------------------测试后删除
  
}
