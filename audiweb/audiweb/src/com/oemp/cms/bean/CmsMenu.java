package com.oemp.cms.bean;

import java.util.Date;

public class CmsMenu {
	private Integer  cmmId;   //菜单id
	private Integer  cmmParentId;
	private String   cmmName;
	private String  cmmDesc;
	private String  cmmIcon;
	private Integer  cmmOrderNum;
	private String  cmmAdminUrl;
	private Integer  cmmType;
	private Date   cmmAddTime;
	private String  cmmAddUser;
	
	public Integer getCmmId() {
		return cmmId;
	}
	public void setCmmId(Integer cmmId) {
		this.cmmId = cmmId;
	}
	public Integer getCmmParentId() {
		return cmmParentId;
	}
	public void setCmmParentId(Integer cmmParentId) {
		this.cmmParentId = cmmParentId;
	}
	public String getCmmName() {
		return cmmName;
	}
	public void setCmmName(String cmmName) {
		this.cmmName = cmmName;
	}
	public String getCmmDesc() {
		return cmmDesc;
	}
	public void setCmmDesc(String cmmDesc) {
		this.cmmDesc = cmmDesc;
	}
	public String getCmmIcon() {
		return cmmIcon;
	}
	public void setCmmIcon(String cmmIcon) {
		this.cmmIcon = cmmIcon;
	}
	public Integer getCmmOrderNum() {
		return cmmOrderNum;
	}
	public void setCmmOrderNum(Integer cmmOrderNum) {
		this.cmmOrderNum = cmmOrderNum;
	}
	public String getCmmAdminUrl() {
		return cmmAdminUrl;
	}
	public void setCmmAdminUrl(String cmmAdminUrl) {
		this.cmmAdminUrl = cmmAdminUrl;
	}
	public Integer getCmmType() {
		return cmmType;
	}
	public void setCmmType(Integer cmmType) {
		this.cmmType = cmmType;
	}
	public Date getCmmAddTime() {
		return cmmAddTime;
	}
	public void setCmmAddTime(Date cmmAddTime) {
		this.cmmAddTime = cmmAddTime;
	}
	public String getCmmAddUser() {
		return cmmAddUser;
	}
	public void setCmmAddUser(String cmmAddUser) {
		this.cmmAddUser = cmmAddUser;
	}
	
	
	
}
