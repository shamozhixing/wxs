package com.oemp.audi.bean;

import java.util.Date;

/**
 * 经销商实体(TB_AUDI_DEALER)
 * @author Zhou
 *
 */
public class Dealer implements java.io.Serializable {

	
	private Long aid;					//经销商ID
	private Long city;			//城市ID(CMS_DICTIONARY外键)
	private Long province;		//省ID(CMS_DICTIONARY外键)
	private String dealername;			//经销商名称
	private String dealerenname;		//经销商英文名称
	private String address;				//经销商地址
	private String enaddress;			//经销商英文地址
	private String dealerLongitude;		//经度
	private String dealerDimension;		//纬度
	private String postalcode;			//邮编
	private String url;					//经销商网址
	private String areanum;				//区号
	private String phone;				//销售电话
	private String servicephone;		//服务电话
	private String fax;					//传真
	private String model;				//销售车型
	private String issecond;			//是否二手车服务  1：是；0：否。
	private String contact;				//二手车服务人姓名
	private String contactEn;			//二手车主管英文姓名
	private String contactPhone;		//二手车服务手机
	private String contactTel;			//二手车服务电话
	private String contactEmail;		//二手车服务邮箱
	private String isRescue;			//是否24小时救援
	private String rescuePhone;			//24小时救援手机
	private String rescueTel;			//24小时救援电话
	private Integer availabilityflag;	//经销商是否有效  1：是；0：否。
	private long ordernum;				//序号
	private String isr8;				//是否R8经销商 1：是；0：否。
	private String islimit;				//单向服务 1:双向；0：单向。
	private String businessTime;		//服务时间
	private String businessTime1;		//服务时间1
	
	private Integer bid;				// 隐藏域
	private Date addtime;				//添加时间
	private Integer lastmodify;			//最后修改人
	private Date lasttime;				//最后修改时间
	
	private String standby1;			//备注1
	private String standby2;			//备注2
	private Integer version;			//版本号
	private String dspcode;				//未知
	
	/**
	 * @return the aid
	 */
	public Long getAid() {
		return aid;
	}
	
	

	/**
	 * @param aid the aid to set
	 */
	public void setAid(Long aid) {
		this.aid = aid;
	}
	/**
	 * @return the city
	 */
	public Long getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(Long city) {
		this.city = city;
	}
	/**
	 * @return the province
	 */
	public Long getProvince() {
		return province;
	}
	/**
	 * @param province the province to set
	 */
	public void setProvince(Long province) {
		this.province = province;
	}
	/**
	 * @return the dealername
	 */
	public String getDealername() {
		return dealername;
	}
	/**
	 * @param dealername the dealername to set
	 */
	public void setDealername(String dealername) {
		this.dealername = dealername;
	}
	/**
	 * @return the dealerenname
	 */
	public String getDealerenname() {
		return dealerenname;
	}
	/**
	 * @param dealerenname the dealerenname to set
	 */
	public void setDealerenname(String dealerenname) {
		this.dealerenname = dealerenname;
	}
	/**
	 * @return the areanum
	 */
	public String getAreanum() {
		return areanum;
	}
	/**
	 * @param areanum the areanum to set
	 */
	public void setAreanum(String areanum) {
		this.areanum = areanum;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the fax
	 */
	public String getFax() {
		return fax;
	}
	/**
	 * @param fax the fax to set
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the availabilityflag
	 */
	public Integer getAvailabilityflag() {
		return availabilityflag;
	}
	/**
	 * @param availabilityflag the availabilityflag to set
	 */
	public void setAvailabilityflag(Integer availabilityflag) {
		this.availabilityflag = availabilityflag;
	}
	/**
	 * @return the enaddress
	 */
	public String getEnaddress() {
		return enaddress;
	}
	/**
	 * @param enaddress the enaddress to set
	 */
	public void setEnaddress(String enaddress) {
		this.enaddress = enaddress;
	}
	/**
	 * @return the postalcode
	 */
	public String getPostalcode() {
		return postalcode;
	}
	/**
	 * @param postalcode the postalcode to set
	 */
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * @return the islimit
	 */
	public String getIslimit() {
		return islimit;
	}
	/**
	 * @param islimit the islimit to set
	 */
	public void setIslimit(String islimit) {
		this.islimit = islimit;
	}
	/**
	 * @return the model
	 */
	public String getModel() {
		return model;
	}
	/**
	 * @param model the model to set
	 */
	public void setModel(String model) {
		this.model = model;
	}
	/**
	 * @return the bid
	 */
	public Integer getBid() {
		return bid;
	}
	/**
	 * @param bid the bid to set
	 */
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	/**
	 * @return the addtime
	 */
	public Date getAddtime() {
		return addtime;
	}
	/**
	 * @param addtime the addtime to set
	 */
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	/**
	 * @return the lastmodify
	 */
	public Integer getLastmodify() {
		return lastmodify;
	}
	/**
	 * @param lastmodify the lastmodify to set
	 */
	public void setLastmodify(Integer lastmodify) {
		this.lastmodify = lastmodify;
	}
	/**
	 * @return the lasttime
	 */
	public Date getLasttime() {
		return lasttime;
	}
	/**
	 * @param lasttime the lasttime to set
	 */
	public void setLasttime(Date lasttime) {
		this.lasttime = lasttime;
	}
	/**
	 * @return the ordernum
	 */
	public long getOrdernum() {
		return ordernum;
	}
	/**
	 * @param ordernum the ordernum to set
	 */
	public void setOrdernum(long ordernum) {
		this.ordernum = ordernum;
	}
	/**
	 * @return the standby1
	 */
	public String getStandby1() {
		return standby1;
	}
	/**
	 * @param standby1 the standby1 to set
	 */
	public void setStandby1(String standby1) {
		this.standby1 = standby1;
	}
	/**
	 * @return the standby2
	 */
	public String getStandby2() {
		return standby2;
	}
	/**
	 * @param standby2 the standby2 to set
	 */
	public void setStandby2(String standby2) {
		this.standby2 = standby2;
	}
	/**
	 * @return the servicephone
	 */
	public String getServicephone() {
		return servicephone;
	}
	/**
	 * @param servicephone the servicephone to set
	 */
	public void setServicephone(String servicephone) {
		this.servicephone = servicephone;
	}
	/**
	 * @return the isr8
	 */
	public String getIsr8() {
		return isr8;
	}
	/**
	 * @param isr8 the isr8 to set
	 */
	public void setIsr8(String isr8) {
		this.isr8 = isr8;
	}
	/**
	 * @return the issecond
	 */
	public String getIssecond() {
		return issecond;
	}
	/**
	 * @param issecond the issecond to set
	 */
	public void setIssecond(String issecond) {
		this.issecond = issecond;
	}
	/**
	 * @return the dealerLongitude
	 */
	public String getDealerLongitude() {
		return dealerLongitude;
	}
	/**
	 * @param dealerLongitude the dealerLongitude to set
	 */
	public void setDealerLongitude(String dealerLongitude) {
		this.dealerLongitude = dealerLongitude;
	}
	/**
	 * @return the dealerDimension
	 */
	public String getDealerDimension() {
		return dealerDimension;
	}
	/**
	 * @param dealerDimension the dealerDimension to set
	 */
	public void setDealerDimension(String dealerDimension) {
		this.dealerDimension = dealerDimension;
	}
	/**
	 * @return the contact
	 */
	public String getContact() {
		return contact;
	}
	/**
	 * @param contact the contact to set
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	/**
	 * @return the contactPhone
	 */
	public String getContactPhone() {
		return contactPhone;
	}
	/**
	 * @param contactPhone the contactPhone to set
	 */
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	/**
	 * @return the contactTel
	 */
	public String getContactTel() {
		return contactTel;
	}
	/**
	 * @param contactTel the contactTel to set
	 */
	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}
	/**
	 * @return the contactEmail
	 */
	public String getContactEmail() {
		return contactEmail;
	}
	/**
	 * @param contactEmail the contactEmail to set
	 */
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	/**
	 * @return the isRescue
	 */
	public String getIsRescue() {
		return isRescue;
	}
	/**
	 * @param isRescue the isRescue to set
	 */
	public void setIsRescue(String isRescue) {
		this.isRescue = isRescue;
	}
	/**
	 * @return the rescuePhone
	 */
	public String getRescuePhone() {
		return rescuePhone;
	}
	/**
	 * @param rescuePhone the rescuePhone to set
	 */
	public void setRescuePhone(String rescuePhone) {
		this.rescuePhone = rescuePhone;
	}
	/**
	 * @return the rescueTel
	 */
	public String getRescueTel() {
		return rescueTel;
	}
	/**
	 * @param rescueTel the rescueTel to set
	 */
	public void setRescueTel(String rescueTel) {
		this.rescueTel = rescueTel;
	}
	/**
	 * @return the contactEn
	 */
	public String getContactEn() {
		return contactEn;
	}
	/**
	 * @param contactEn the contactEn to set
	 */
	public void setContactEn(String contactEn) {
		this.contactEn = contactEn;
	}
	/**
	 * @return the version
	 */
	public Integer getVersion() {
		return version;
	}
	/**
	 * @param version the version to set
	 */
	public void setVersion(Integer version) {
		this.version = version;
	}
	/**
	 * @return the dspcode
	 */
	public String getDspcode() {
		return dspcode;
	}
	/**
	 * @param dspcode the dspcode to set
	 */
	public void setDspcode(String dspcode) {
		this.dspcode = dspcode;
	}
	/**
	 * @return the businessTime
	 */
	public String getBusinessTime() {
		return businessTime;
	}
	/**
	 * @param businessTime the businessTime to set
	 */
	public void setBusinessTime(String businessTime) {
		this.businessTime = businessTime;
	}
	/**
	 * @return the businessTime1
	 */
	public String getBusinessTime1() {
		return businessTime1;
	}
	/**
	 * @param businessTime1 the businessTime1 to set
	 */
	public void setBusinessTime1(String businessTime1) {
		this.businessTime1 = businessTime1;
	}
	
	
	
}