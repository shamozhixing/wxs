package com.oemp.audi.bean;

import java.io.Serializable;
import java.util.Date;

public class Communicate implements Serializable {
	public Communicate(){
		
	}
	
	//咨询
    private Long caId;				//	咨询表主键
    private Long caUserid;			//	用户ID
    private Date caAddtime;		//	创建日期
    private String caName;			//	姓名
    private Long caGender;			//	称谓（性别）1 男；0：女
    private String caMobile;		//	手机号码
    private Date caBirthday;		//	出生日期 
    private String caDescription;	//	咨询问题描述
    private Long caWhen;			//	何时联系您 0 工作日、1 节假日...
    private String caTiming;				//	具体时间 如 ： 上午10点


	//投诉
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

	//建议
	 private Long cpId;  				//主键
     private Long cpUserid;  			//用户id
     private Date cpAddtime;  			//创建日期
     private String cpName;  			//姓名
     private Long cpGender; 			//性别
     private String cpMobile;  			//手机号
     private Date cpBirthday;  			//出生日期
     private String cpDescription;		//建议内容描述
     private Long cpWhen;  				//联系时间
     private String cpTiming;	        //具体时间
     
     private Long answersex;
     
     

	public Long getAnswersex() {
		return answersex;
	}
	public void setAnswersex(Long answersex) {
		this.answersex = answersex;
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
	public String getCaTiming() {
		return caTiming;
	}
	public void setCaTiming(String caTiming) {
		this.caTiming = caTiming;
	}
	public String getCcTiming() {
		return ccTiming;
	}
	public void setCcTiming(String ccTiming) {
		this.ccTiming = ccTiming;
	}
	public String getCpTiming() {
		return cpTiming;
	}
	public void setCpTiming(String cpTiming) {
		this.cpTiming = cpTiming;
	}    
     
}
