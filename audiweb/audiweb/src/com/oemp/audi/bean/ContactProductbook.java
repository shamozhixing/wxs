package com.oemp.audi.bean;

import java.util.Date;




public class ContactProductbook implements java.io.Serializable {

	// Fields

	private Integer cpId;//主键
	private Integer cpIntentcars;//所属车系id
	private String cpBookname;//产品手册名称
	private String cpImg;//图片
	private String cpType;//类型类型，0获取手册，1试驾
	private String cpPagename;//页面显示名称
	private Integer cpIspub;//是否发布0未发布，1发布
	private Date cpAddtime;//添加时间
	private String cpPdf;//pdf文件下载地址
	private String cpIntentname;//车系名称
	private Integer cpOrder;//排序
	// Constructors

	/** default constructor */
	public ContactProductbook() {
	}

	/**
	 * @return the cpId
	 */
	public Integer getCpId() {
		return cpId;
	}

	/**
	 * @param cpId the cpId to set
	 */
	public void setCpId(Integer cpId) {
		this.cpId = cpId;
	}

	/**
	 * @return the cpIntentcars
	 */
	public Integer getCpIntentcars() {
		return cpIntentcars;
	}

	/**
	 * @param cpIntentcars the cpIntentcars to set
	 */
	public void setCpIntentcars(Integer cpIntentcars) {
		this.cpIntentcars = cpIntentcars;
	}

	/**
	 * @return the cpBookname
	 */
	public String getCpBookname() {
		return cpBookname;
	}

	/**
	 * @param cpBookname the cpBookname to set
	 */
	public void setCpBookname(String cpBookname) {
		this.cpBookname = cpBookname;
	}

	/**
	 * @return the cpImg
	 */
	public String getCpImg() {
		return cpImg;
	}

	/**
	 * @param cpImg the cpImg to set
	 */
	public void setCpImg(String cpImg) {
		this.cpImg = cpImg;
	}

	/**
	 * @return the cpType
	 */
	public String getCpType() {
		return cpType;
	}

	/**
	 * @param cpType the cpType to set
	 */
	public void setCpType(String cpType) {
		this.cpType = cpType;
	}

	/**
	 * @return the cpPagename
	 */
	public String getCpPagename() {
		return cpPagename;
	}

	/**
	 * @param cpPagename the cpPagename to set
	 */
	public void setCpPagename(String cpPagename) {
		this.cpPagename = cpPagename;
	}

	/**
	 * @return the cpIspub
	 */
	public Integer getCpIspub() {
		return cpIspub;
	}

	/**
	 * @param cpIspub the cpIspub to set
	 */
	public void setCpIspub(Integer cpIspub) {
		this.cpIspub = cpIspub;
	}

	/**
	 * @return the cpAddtime
	 */
	public Date getCpAddtime() {
		return cpAddtime;
	}

	/**
	 * @param cpAddtime the cpAddtime to set
	 */
	public void setCpAddtime(Date cpAddtime) {
		this.cpAddtime = cpAddtime;
	}

	/**
	 * @return the cpPdf
	 */
	public String getCpPdf() {
		return cpPdf;
	}

	/**
	 * @param cpPdf the cpPdf to set
	 */
	public void setCpPdf(String cpPdf) {
		this.cpPdf = cpPdf;
	}

	/**
	 * @return the cpIntentname
	 */
	public String getCpIntentname() {
		return cpIntentname;
	}

	/**
	 * @param cpIntentname the cpIntentname to set
	 */
	public void setCpIntentname(String cpIntentname) {
		this.cpIntentname = cpIntentname;
	}

	/**
	 * @return the cpOrder
	 */
	public Integer getCpOrder() {
		return cpOrder;
	}

	/**
	 * @param cpOrder the cpOrder to set
	 */
	public void setCpOrder(Integer cpOrder) {
		this.cpOrder = cpOrder;
	}

	
	

}