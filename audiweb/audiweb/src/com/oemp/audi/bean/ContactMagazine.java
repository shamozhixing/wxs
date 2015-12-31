package com.oemp.audi.bean;
// default package

import java.util.Date;

/**
 * 杂志
 */

public class ContactMagazine implements java.io.Serializable {

	// Fields

	private Long cmId;
	private Long cmProvince;
	private Long cmCity;
	private String cmAddress;
	private String cmZip;
	private Long cmIscar;
	private Long cmBrand;
	private String cmFootnum;
	private String cmCarnum;
	private Long cmModel;
	private Long cmIntentmodel;
	private String cmBuyyear;
	private String cmBuymonth;
	private String cmName;
	private Long cmGender;
	private String cmMobile;
	private Date cmBirthday;
	private Long cmUserid;
	private String cmObtaintype;
	private String cmInterestmodel;
	private String cmSendstatus;
	private Date cmAddtime;
	private String cmFlag;
	private String cmStandby;
	private String cmStandby1;
	private Date cmSendtime;
	
	// Constructors

	/** default constructor */
	public ContactMagazine() {
	}

	/** minimal constructor */
	public ContactMagazine(Long cmId) {
		this.cmId = cmId;
	}

	/** full constructor */
	public ContactMagazine(Long cmId, Long cmProvince,
			Long cmCity, String cmAddress, String cmZip,
			Long cmIscar, Long cmBrand, String cmFootnum,
			String cmCarnum, Long cmModel, Long cmIntentmodel,
			String cmBuyyear, String cmBuymonth, String cmName,
			Long cmGender, String cmMobile, Date cmBirthday,
			Long cmUserid, String cmObtaintype, String cmInterestmodel,
			String cmSendstatus, Date cmAddtime, String cmFlag,
			String cmStandby, String cmStandby1, Date cmSendtime) {
		this.cmId = cmId;
		this.cmProvince = cmProvince;
		this.cmCity = cmCity;
		this.cmAddress = cmAddress;
		this.cmZip = cmZip;
		this.cmIscar = cmIscar;
		this.cmBrand = cmBrand;
		this.cmFootnum = cmFootnum;
		this.cmCarnum = cmCarnum;
		this.cmModel = cmModel;
		this.cmIntentmodel = cmIntentmodel;
		this.cmBuyyear = cmBuyyear;
		this.cmBuymonth = cmBuymonth;
		this.cmName = cmName;
		this.cmGender = cmGender;
		this.cmMobile = cmMobile;
		this.cmBirthday = cmBirthday;
		this.cmUserid = cmUserid;
		this.cmObtaintype = cmObtaintype;
		this.cmInterestmodel = cmInterestmodel;
		this.cmSendstatus = cmSendstatus;
		this.cmAddtime = cmAddtime;
		this.cmFlag = cmFlag;
		this.cmStandby = cmStandby;
		this.cmStandby1 = cmStandby1;
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

	public Long getCmIntentmodel() {
		return this.cmIntentmodel;
	}

	public void setCmIntentmodel(Long cmIntentmodel) {
		this.cmIntentmodel = cmIntentmodel;
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

	public String getCmSendstatus() {
		return this.cmSendstatus;
	}

	public void setCmSendstatus(String cmSendstatus) {
		this.cmSendstatus = cmSendstatus;
	}

	public Date getCmAddtime() {
		return this.cmAddtime;
	}

	public void setCmAddtime(Date cmAddtime) {
		this.cmAddtime = cmAddtime;
	}

	public String getCmFlag() {
		return this.cmFlag;
	}

	public void setCmFlag(String cmFlag) {
		this.cmFlag = cmFlag;
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

	public Date getCmSendtime() {
		return this.cmSendtime;
	}

	public void setCmSendtime(Date cmSendtime) {
		this.cmSendtime = cmSendtime;
	}

}