package com.oemp.audi.bean;
// default package

import java.util.Date;

/**
 * 手册
 */

public class ContactManual implements java.io.Serializable {

	// Fields

	private Long cmId;//id
	private Long cmProvince;//省份
	private Long cmCity;//城市
	private String cmAddress;//地址
	private String cmZip;//邮编
	private Long cmIntent;//购车意向
	private Long cmIntentmodel;//意向车型
	private Long cmIntentdealer;//意想经销商
	private String cmPlanbuytime;//计划买车时间
	private String cmBuybudget;//名称
	private Long cmIscar;//是否又车1有
	private Long cmBrand;//车辆品牌
	private String cmBuyyear;//购年
	private String cmBuymonth;//购车月
	private String cmFootnum;//车架号
	private String cmCarnum;//车牌号
	private Long cmModel;//车辆型号
	private String cmName;//名称
	private Long cmGender;//称呼1南
	private String cmMobile;//手机号码
	private Date cmBirthday;//出生日期
	private Long cmUserid;//用户 id
	private String cmObtaintype;//类型1为手册
	private String cmInterestmodel;//选择产品名称
	private String cmAvailabilityflag;//是否有效
	private String cmSendstatus;
	private String cmStandby;
	private String cmStandby1;
	private Date cmAddtime;
	private Date cmSendtime;

	// Constructors

	/** default constructor */
	public ContactManual() {
	}

	/** minimal constructor */
	public ContactManual(Long cmId) {
		this.cmId = cmId;
	}

	/** full constructor */
	public ContactManual(Long cmId, Long cmProvince,
			Long cmCity, String cmAddress, String cmZip,
			Long cmIntent, Long cmIntentmodel,
			Long cmIntentdealer, String cmPlanbuytime,
			String cmBuybudget, Long cmIscar, Long cmBrand,
			String cmBuyyear, String cmBuymonth, String cmFootnum,
			String cmCarnum, Long cmModel, String cmName,
			Long cmGender, String cmMobile, Date cmBirthday,
			Long cmUserid, String cmObtaintype, String cmInterestmodel,
			String cmAvailabilityflag, String cmSendstatus, String cmStandby,
			String cmStandby1, Date cmAddtime, Date cmSendtime) {
		this.cmId = cmId;
		this.cmProvince = cmProvince;
		this.cmCity = cmCity;
		this.cmAddress = cmAddress;
		this.cmZip = cmZip;
		this.cmIntent = cmIntent;
		this.cmIntentmodel = cmIntentmodel;
		this.cmIntentdealer = cmIntentdealer;
		this.cmPlanbuytime = cmPlanbuytime;
		this.cmBuybudget = cmBuybudget;
		this.cmIscar = cmIscar;
		this.cmBrand = cmBrand;
		this.cmBuyyear = cmBuyyear;
		this.cmBuymonth = cmBuymonth;
		this.cmFootnum = cmFootnum;
		this.cmCarnum = cmCarnum;
		this.cmModel = cmModel;
		this.cmName = cmName;
		this.cmGender = cmGender;
		this.cmMobile = cmMobile;
		this.cmBirthday = cmBirthday;
		this.cmUserid = cmUserid;
		this.cmObtaintype = cmObtaintype;
		this.cmInterestmodel = cmInterestmodel;
		this.cmAvailabilityflag = cmAvailabilityflag;
		this.cmSendstatus = cmSendstatus;
		this.cmStandby = cmStandby;
		this.cmStandby1 = cmStandby1;
		this.cmAddtime = cmAddtime;
		this.cmSendtime = cmSendtime;
	}

	// Property accessors

	public Long getCmId() {
		return this.cmId;
	}

	public void setCmId(Long cmId) {
		this.cmId = cmId;
	}

	public Long getCmProvince() {
		return this.cmProvince;
	}

	public void setCmProvince(Long cmProvince) {
		this.cmProvince = cmProvince;
	}

	public Long getCmCity() {
		return this.cmCity;
	}

	public void setCmCity(Long cmCity) {
		this.cmCity = cmCity;
	}

	public String getCmAddress() {
		return this.cmAddress;
	}

	public void setCmAddress(String cmAddress) {
		this.cmAddress = cmAddress;
	}

	public String getCmZip() {
		return this.cmZip;
	}

	public void setCmZip(String cmZip) {
		this.cmZip = cmZip;
	}

	public Long getCmIntent() {
		return this.cmIntent;
	}

	public void setCmIntent(Long cmIntent) {
		this.cmIntent = cmIntent;
	}

	public Long getCmIntentmodel() {
		return this.cmIntentmodel;
	}

	public void setCmIntentmodel(Long cmIntentmodel) {
		this.cmIntentmodel = cmIntentmodel;
	}

	public Long getCmIntentdealer() {
		return this.cmIntentdealer;
	}

	public void setCmIntentdealer(Long cmIntentdealer) {
		this.cmIntentdealer = cmIntentdealer;
	}

	public String getCmPlanbuytime() {
		return this.cmPlanbuytime;
	}

	public void setCmPlanbuytime(String cmPlanbuytime) {
		this.cmPlanbuytime = cmPlanbuytime;
	}

	public String getCmBuybudget() {
		return this.cmBuybudget;
	}

	public void setCmBuybudget(String cmBuybudget) {
		this.cmBuybudget = cmBuybudget;
	}

	public Long getCmIscar() {
		return this.cmIscar;
	}

	public void setCmIscar(Long cmIscar) {
		this.cmIscar = cmIscar;
	}

	public Long getCmBrand() {
		return this.cmBrand;
	}

	public void setCmBrand(Long cmBrand) {
		this.cmBrand = cmBrand;
	}

	public String getCmBuyyear() {
		return this.cmBuyyear;
	}

	public void setCmBuyyear(String cmBuyyear) {
		this.cmBuyyear = cmBuyyear;
	}

	public String getCmBuymonth() {
		return this.cmBuymonth;
	}

	public void setCmBuymonth(String cmBuymonth) {
		this.cmBuymonth = cmBuymonth;
	}

	public String getCmFootnum() {
		return this.cmFootnum;
	}

	public void setCmFootnum(String cmFootnum) {
		this.cmFootnum = cmFootnum;
	}

	public String getCmCarnum() {
		return this.cmCarnum;
	}

	public void setCmCarnum(String cmCarnum) {
		this.cmCarnum = cmCarnum;
	}

	public Long getCmModel() {
		return this.cmModel;
	}

	public void setCmModel(Long cmModel) {
		this.cmModel = cmModel;
	}

	public String getCmName() {
		return this.cmName;
	}

	public void setCmName(String cmName) {
		this.cmName = cmName;
	}

	public Long getCmGender() {
		return this.cmGender;
	}

	public void setCmGender(Long cmGender) {
		this.cmGender = cmGender;
	}

	public String getCmMobile() {
		return this.cmMobile;
	}

	public void setCmMobile(String cmMobile) {
		this.cmMobile = cmMobile;
	}

	public Date getCmBirthday() {
		return this.cmBirthday;
	}

	public void setCmBirthday(Date cmBirthday) {
		this.cmBirthday = cmBirthday;
	}

	public Long getCmUserid() {
		return this.cmUserid;
	}

	public void setCmUserid(Long cmUserid) {
		this.cmUserid = cmUserid;
	}

	public String getCmObtaintype() {
		return this.cmObtaintype;
	}

	public void setCmObtaintype(String cmObtaintype) {
		this.cmObtaintype = cmObtaintype;
	}

	public String getCmInterestmodel() {
		return this.cmInterestmodel;
	}

	public void setCmInterestmodel(String cmInterestmodel) {
		this.cmInterestmodel = cmInterestmodel;
	}

	public String getCmAvailabilityflag() {
		return this.cmAvailabilityflag;
	}

	public void setCmAvailabilityflag(String cmAvailabilityflag) {
		this.cmAvailabilityflag = cmAvailabilityflag;
	}

	public String getCmSendstatus() {
		return this.cmSendstatus;
	}

	public void setCmSendstatus(String cmSendstatus) {
		this.cmSendstatus = cmSendstatus;
	}

	public String getCmStandby() {
		return this.cmStandby;
	}

	public void setCmStandby(String cmStandby) {
		this.cmStandby = cmStandby;
	}

	public String getCmStandby1() {
		return this.cmStandby1;
	}

	public void setCmStandby1(String cmStandby1) {
		this.cmStandby1 = cmStandby1;
	}

	public Date getCmAddtime() {
		return this.cmAddtime;
	}

	public void setCmAddtime(Date cmAddtime) {
		this.cmAddtime = cmAddtime;
	}

	public Date getCmSendtime() {
		return this.cmSendtime;
	}

	public void setCmSendtime(Date cmSendtime) {
		this.cmSendtime = cmSendtime;
	}

}