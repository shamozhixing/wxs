package com.oemp.audi.action.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.ContactComplaint;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.cms.action.AdminAction;
import com.oemp.frame.action.BaseAction;
//http://localhost:8080/audiweb/admin/contactComplaint_save.action?ccId=1&ccType=123&ccUserid=12345&ccKilometer=5465&ccCity=325
@Controller("audi.front.action.ContactComplaintAction")
@Scope("prototype")
public class ContactComplaintAction extends ContactBaseAction {
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	//----------------------------------
    private Long ccId;			//主键ID
    private Long ccType;		//投诉类型 1：售前；2：售后；3：二手车。
    private Long ccUserid;		//用户ID
    private Date ccAddtime;	//创建日期
    private Long ccKilometer;	//行驶里程
    private Long ccProvince;	//经销商所在省
    private Long ccCity;		//经销商所在市
    private Long ccDealer;		//经销商名称
    private String ccModel;		//车辆型号
    private String ccFootnum;	//车架号
    private String ccCarnum;	//车牌号
    private String ccBuyyear;	//购车年份
    private String ccBuymonth;	//购车月份
    private String ccName;		//姓名
    private Long ccGender;		//性别
    private String ccMobile;	//手机号码
    private Date ccBirthday;	//出生日期
    private String ccDescription;//投诉内容
    private String ccCode;		//编码
    private Long ccWhen;		//联系时间
    private String ccTiming;		//具体时间
	//-----------------------------------
	private String rows;
	public void save(){
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("+++++++++这是contactComplaint的action");
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
//		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
//		//long ccId=js.getLong("ccId");
//		long ccType=js.getLong("ccType");
//		long ccUserid=js.getLong("ccUserid");
//		String ccAddtime=js.getString("ccAddtime");
//		long ccKilometer=js.getLong("ccKilometer");
//		long ccProvince=js.getLong("ccProvince");
//		long ccCity=js.getLong("ccCity");
//		long ccDealer=js.getLong("ccDealer");
//		long ccModel=js.getLong("ccModel");
//		String ccFootnum=js.getString("ccFootnum");
//		String ccCarnum=js.getString("ccCarnum");
//		String ccBuyyear=js.getString("ccBuyyear");
//		String ccBuymonth=js.getString("ccBuymonth");
//		String ccName=js.getString("ccName");
//		long ccGender=js.getLong("ccGender");
//		String ccMobile=js.getString("ccMobile");
//		String ccBirthday1=js.getString("ccBirthday");
//		try {
//			Date ccBirthday=sim.parse(ccBirthday1);
//		} catch (ParseException e1) {
//			e1.printStackTrace();
//		}
//		String ccDescription=js.getString("ccDescription");
//		String ccCode=js.getString("ccCode");
//		long ccWhen=js.getLong("ccWhen");
//		long ccTiming=js.getLong("ccTiming");
		
		ContactComplaint contactComplaint=new ContactComplaint();
		contactComplaint.setCcId(ccId);
		contactComplaint.setCcType(ccType);
		contactComplaint.setCcUserid(ccUserid);
		contactComplaint.setCcAddtime(ccAddtime);
		contactComplaint.setCcKilometer(ccKilometer);
		contactComplaint.setCcProvince(ccProvince);
		contactComplaint.setCcCity(ccCity);
		contactComplaint.setCcDealer(ccDealer);
		contactComplaint.setCcModel(ccModel);
		contactComplaint.setCcFootnum(ccFootnum);
		contactComplaint.setCcCarnum(ccCarnum);
		contactComplaint.setCcBuyyear(ccBuyyear);
		contactComplaint.setCcBuymonth(ccBuymonth);
		contactComplaint.setCcName(ccName);
		contactComplaint.setCcGender(ccGender);
		contactComplaint.setCcMobile(ccMobile);
		contactComplaint.setCcDescription(ccDescription);
		contactComplaint.setCcCode(ccCode);
		contactComplaint.setCcWhen(ccWhen);
		contactComplaint.setCcTiming(ccTiming);
		audiServiceDispatcher.getContactComplaintService().save(contactComplaint);
		
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
	//--------------------------------以下测试后删除
	public Long getCcId() {
		return ccId;
	}
	public void setCcId(Long ccId) {
		this.ccId = ccId;
	}
	public Long getCcType() {
		return ccType;
	}
	public void setCcType(Long ccType) {
		this.ccType = ccType;
	}
	public Long getCcUserid() {
		return ccUserid;
	}
	public void setCcUserid(Long ccUserid) {
		this.ccUserid = ccUserid;
	}

	public Date getCcAddtime() {
		return ccAddtime;
	}
	public void setCcAddtime(Date ccAddtime) {
		this.ccAddtime = ccAddtime;
	}
	public Long getCcKilometer() {
		return ccKilometer;
	}
	public void setCcKilometer(Long ccKilometer) {
		this.ccKilometer = ccKilometer;
	}
	public Long getCcProvince() {
		return ccProvince;
	}
	public void setCcProvince(Long ccProvince) {
		this.ccProvince = ccProvince;
	}
	public Long getCcCity() {
		return ccCity;
	}
	public void setCcCity(Long ccCity) {
		this.ccCity = ccCity;
	}
	public Long getCcDealer() {
		return ccDealer;
	}
	public void setCcDealer(Long ccDealer) {
		this.ccDealer = ccDealer;
	}
	public String getCcModel() {
		return ccModel;
	}
	public void setCcModel(String ccModel) {
		this.ccModel = ccModel;
	}
	public String getCcFootnum() {
		return ccFootnum;
	}
	public void setCcFootnum(String ccFootnum) {
		this.ccFootnum = ccFootnum;
	}
	public String getCcCarnum() {
		return ccCarnum;
	}
	public void setCcCarnum(String ccCarnum) {
		this.ccCarnum = ccCarnum;
	}
	public String getCcBuyyear() {
		return ccBuyyear;
	}
	public void setCcBuyyear(String ccBuyyear) {
		this.ccBuyyear = ccBuyyear;
	}
	public String getCcBuymonth() {
		return ccBuymonth;
	}
	public void setCcBuymonth(String ccBuymonth) {
		this.ccBuymonth = ccBuymonth;
	}
	public String getCcName() {
		return ccName;
	}
	public void setCcName(String ccName) {
		this.ccName = ccName;
	}
	public Long getCcGender() {
		return ccGender;
	}
	public void setCcGender(Long ccGender) {
		this.ccGender = ccGender;
	}
	public String getCcMobile() {
		return ccMobile;
	}
	public void setCcMobile(String ccMobile) {
		this.ccMobile = ccMobile;
	}
	public Date getCcBirthday() {
		return ccBirthday;
	}
	public void setCcBirthday(Date ccBirthday) {
		this.ccBirthday = ccBirthday;
	}
	public String getCcDescription() {
		return ccDescription;
	}
	public void setCcDescription(String ccDescription) {
		this.ccDescription = ccDescription;
	}
	public String getCcCode() {
		return ccCode;
	}
	public void setCcCode(String ccCode) {
		this.ccCode = ccCode;
	}
	public Long getCcWhen() {
		return ccWhen;
	}
	public void setCcWhen(Long ccWhen) {
		this.ccWhen = ccWhen;
	}
	public String getCcTiming() {
		return ccTiming;
	}
	public void setCcTiming(String ccTiming) {
		this.ccTiming = ccTiming;
	}

	
	//--------------------------------------
	
}
