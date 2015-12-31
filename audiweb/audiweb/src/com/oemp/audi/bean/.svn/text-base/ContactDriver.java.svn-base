package com.oemp.audi.bean;
// default package

import java.util.Date;

/**
 * ContactDriver entity. @author MyEclipse Persistence Tools
 */

public class ContactDriver implements java.io.Serializable {

	// Fields

	private Long cdId;//主键
	private Long cdSendstatus;//发送状态,0,1是否可用，原TB_APPLY_DRIVER表SENDSTATUS字段。
	private String cdName;//姓名
	private Long cdGender;//性别：0 女，1 男
	private String cdMobile;//手机号码
	private String cdCaptcha;//手机验证码
	private Date cdBirthday;//出生日期
	private Long cdIntentmodels;//试驾意向车型，cms_dictionary表外键，原TB_APPLLY_DRIVER表cartype字段
	private Long cdIntentcars;//意向车系，原TB_APPLY_DRIVER表isdrivers属性。
	private Long cdProvince;//经销商省
	private Long cdCity;//经销商市
	private Long cdIslicense;//是否拥有驾照，原TB_APPLY_DRIVER表isdrivers属性。
	private String cdDriverage;//驾龄，原TB_APPLY_DRIVER表driverage属性。
	private Long cdIntent;//购车意向，1有 0无
	private String cdPlanbuytime;//计划购车时间范围，原TB_APPLY_DRIVER表BUYTIME
	private String cdBuybudget;//购车预算，原TB_APPLY_DRIVER表BUDGET属性
	private Long cdIscar;//是否有车，1有 0无
	private Long cdBrand;//车辆品牌
	private Long cdModel;//车辆型号
	private String cdBuytime;//购车年份
	private String cdBuymonth;//购车月份
	private String cdFootnum;//车架号
	private String cdCarnum;//车牌号
	private Date cdSendtime;//原TB_APPLY_DRIVER表sendtime字段。
	private Date cdAddtime;//，原TB_APPLY_DRIVER表ADDTIME字段。
	private Long cdFlag;//是否可用，原TB_APPLY_DRIVER表AVAILABILITYFLAG字段。
	private String cdStandby1;//原TB_APPLY_DRIVER表STANDBY1字段。
	private String cdStandby2;//原TB_APPLY_DRIVER表STANDBY2字段。
	private TbRegUser tru;//用户ID
	private Long cdIntentdealer;//试驾意向经销商，audi_dealer外键，原TB_APPLY_DRIVER表dealer字段。
	
	// Constructors

	/** default constructor */
	public ContactDriver() {
	}

	/** minimal constructor */
	public ContactDriver(Long cdId) {
		this.cdId = cdId;
	}

	/** full constructor */
	public ContactDriver(Long cdId, Long cdSendstatus,
			String cdName, Long cdGender,
			String cdMobile, String cdCaptcha, Date cdBirthday,
			Long cdIntentmodels, Long cdIntentcars,
			Long cdProvince, Long cdCity, Long cdIslicense,
			String cdDriverage, Long cdIntent, String cdPlanbuytime,
			String cdBuybudget, Long cdIscar, Long cdBrand,
			Long cdModel, String cdBuytime, String cdBuymonth,
			String cdFootnum, String cdCarnum, Date cdSendtime, Date cdAddtime,
			Long cdFlag, String cdStandby1, String cdStandby2,TbRegUser tru,Long cdIntentdealer) {
		this.tru=tru;
		this.cdIntentdealer=cdIntentdealer;
		this.cdId = cdId;
		this.cdSendstatus = cdSendstatus;
		this.cdName = cdName;
		this.cdGender = cdGender;
		this.cdMobile = cdMobile;
		this.cdCaptcha = cdCaptcha;
		this.cdBirthday = cdBirthday;
		this.cdIntentmodels = cdIntentmodels;
		this.cdIntentcars = cdIntentcars;
		this.cdProvince = cdProvince;
		this.cdCity = cdCity;
		this.cdIslicense = cdIslicense;
		this.cdDriverage = cdDriverage;
		this.cdIntent = cdIntent;
		this.cdPlanbuytime = cdPlanbuytime;
		this.cdBuybudget = cdBuybudget;
		this.cdIscar = cdIscar;
		this.cdBrand = cdBrand;
		this.cdModel = cdModel;
		this.cdBuytime = cdBuytime;
		this.cdBuymonth = cdBuymonth;
		this.cdFootnum = cdFootnum;
		this.cdCarnum = cdCarnum;
		this.cdSendtime = cdSendtime;
		this.cdAddtime = cdAddtime;
		this.cdFlag = cdFlag;
		this.cdStandby1 = cdStandby1;
		this.cdStandby2 = cdStandby2;
	}

	// Property accessors

	public Long getCdId() {
		return this.cdId;
	}

	public void setCdId(Long cdId) {
		this.cdId = cdId;
	}

	public Long getCdSendstatus() {
		return this.cdSendstatus;
	}

	public void setCdSendstatus(Long cdSendstatus) {
		this.cdSendstatus = cdSendstatus;
	}

//	public Long getCdUserid() {
//		return this.cdUserid;
//	}
//
//	public void setCdUserid(Long cdUserid) {
//		this.cdUserid = cdUserid;
//	}

	public String getCdName() {
		return this.cdName;
	}

	public void setCdName(String cdName) {
		this.cdName = cdName;
	}

	public Long getCdGender() {
		return this.cdGender;
	}

	public void setCdGender(Long cdGender) {
		this.cdGender = cdGender;
	}

	public String getCdMobile() {
		return this.cdMobile;
	}

	public void setCdMobile(String cdMobile) {
		this.cdMobile = cdMobile;
	}

	public String getCdCaptcha() {
		return this.cdCaptcha;
	}

	public void setCdCaptcha(String cdCaptcha) {
		this.cdCaptcha = cdCaptcha;
	}

	public Date getCdBirthday() {
		return this.cdBirthday;
	}

	public void setCdBirthday(Date cdBirthday) {
		this.cdBirthday = cdBirthday;
	}

	public Long getCdIntentmodels() {
		return this.cdIntentmodels;
	}

	public void setCdIntentmodels(Long cdIntentmodels) {
		this.cdIntentmodels = cdIntentmodels;
	}

	public Long getCdIntentcars() {
		return this.cdIntentcars;
	}

	public void setCdIntentcars(Long cdIntentcars) {
		this.cdIntentcars = cdIntentcars;
	}

	public Long getCdProvince() {
		return this.cdProvince;
	}

	public void setCdProvince(Long cdProvince) {
		this.cdProvince = cdProvince;
	}

	public Long getCdCity() {
		return this.cdCity;
	}

	public void setCdCity(Long cdCity) {
		this.cdCity = cdCity;
	}

//	public Long getCdIntentdealer() {
//		return this.cdIntentdealer;
//	}
//
//	public void setCdIntentdealer(Long cdIntentdealer) {
//		this.cdIntentdealer = cdIntentdealer;
//	}

	public Long getCdIslicense() {
		return this.cdIslicense;
	}

	public void setCdIslicense(Long cdIslicense) {
		this.cdIslicense = cdIslicense;
	}

	public String getCdDriverage() {
		return this.cdDriverage;
	}

	public void setCdDriverage(String cdDriverage) {
		this.cdDriverage = cdDriverage;
	}

	public Long getCdIntent() {
		return this.cdIntent;
	}

	public void setCdIntent(Long cdIntent) {
		this.cdIntent = cdIntent;
	}

	public String getCdPlanbuytime() {
		return this.cdPlanbuytime;
	}

	public void setCdPlanbuytime(String cdPlanbuytime) {
		this.cdPlanbuytime = cdPlanbuytime;
	}

	public String getCdBuybudget() {
		return this.cdBuybudget;
	}

	public void setCdBuybudget(String cdBuybudget) {
		this.cdBuybudget = cdBuybudget;
	}

	public Long getCdIscar() {
		return this.cdIscar;
	}

	public void setCdIscar(Long cdIscar) {
		this.cdIscar = cdIscar;
	}

	public Long getCdBrand() {
		return this.cdBrand;
	}

	public void setCdBrand(Long cdBrand) {
		this.cdBrand = cdBrand;
	}

	public Long getCdModel() {
		return this.cdModel;
	}

	public void setCdModel(Long cdModel) {
		this.cdModel = cdModel;
	}

	public String getCdBuytime() {
		return this.cdBuytime;
	}

	public void setCdBuytime(String cdBuytime) {
		this.cdBuytime = cdBuytime;
	}

	public String getCdBuymonth() {
		return this.cdBuymonth;
	}

	public void setCdBuymonth(String cdBuymonth) {
		this.cdBuymonth = cdBuymonth;
	}

	public String getCdFootnum() {
		return this.cdFootnum;
	}

	public void setCdFootnum(String cdFootnum) {
		this.cdFootnum = cdFootnum;
	}

	public String getCdCarnum() {
		return this.cdCarnum;
	}

	public void setCdCarnum(String cdCarnum) {
		this.cdCarnum = cdCarnum;
	}

	public Date getCdSendtime() {
		return this.cdSendtime;
	}

	public void setCdSendtime(Date cdSendtime) {
		this.cdSendtime = cdSendtime;
	}

	public Date getCdAddtime() {
		return this.cdAddtime;
	}

	public void setCdAddtime(Date cdAddtime) {
		this.cdAddtime = cdAddtime;
	}

	public Long getCdFlag() {
		return this.cdFlag;
	}

	public void setCdFlag(Long cdFlag) {
		this.cdFlag = cdFlag;
	}

	public String getCdStandby1() {
		return this.cdStandby1;
	}

	public void setCdStandby1(String cdStandby1) {
		this.cdStandby1 = cdStandby1;
	}

	public String getCdStandby2() {
		return this.cdStandby2;
	}

	public void setCdStandby2(String cdStandby2) {
		this.cdStandby2 = cdStandby2;
	}

	/**
	 * @return the tru
	 */
	public TbRegUser getTru() {
		return tru;
	}

	/**
	 * @param tru the tru to set
	 */
	public void setTru(TbRegUser tru) {
		this.tru = tru;
	}

	/**
	 * @return the cdIntentdealer
	 */
	public Long getCdIntentdealer() {
		return cdIntentdealer;
	}

	/**
	 * @param cdIntentdealer the cdIntentdealer to set
	 */
	public void setCdIntentdealer(Long cdIntentdealer) {
		this.cdIntentdealer = cdIntentdealer;
	}

	

}