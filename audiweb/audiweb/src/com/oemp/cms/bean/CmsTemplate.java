package com.oemp.cms.bean;
import java.util.Date;

public class CmsTemplate {
   private int cmtId;
   private String cmtName;	//模版名称
   private String cmtImg;	//模板缩略图
   private String cmtDesc;
   private String cmtContent;
   private int cmtPubStatus;
   private String cmtLastuser;
   private Date cmtLasttime;
   private int cmtSiteId;//--CMT_SITE_ID
   //private String cmtIcon;
   // private String cmtUrl;
   public int getCmtId() {
		return cmtId;
	}
	public void setCmtId(int cmtId) {
		this.cmtId = cmtId;
	}
	public String getCmtName() {
		return cmtName;
	}
	public void setCmtName(String cmtName) {
		this.cmtName = cmtName;
	}
	public String getCmtImg() {
		return cmtImg;
	}
	public void setCmtImg(String cmtImg) {
		this.cmtImg = cmtImg;
	}
	public String getCmtDesc() {
		return cmtDesc;
	}
	public void setCmtDesc(String cmtDesc) {
		this.cmtDesc = cmtDesc;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public int getCmtPubStatus() {
		return cmtPubStatus;
	}
	public void setCmtPubStatus(int cmtPubStatus) {
		this.cmtPubStatus = cmtPubStatus;
	}
	public String getCmtLastuser() {
		return cmtLastuser;
	}
	public void setCmtLastuser(String cmtLastuser) {
		this.cmtLastuser = cmtLastuser;
	}
	public Date getCmtLasttime() {
		return cmtLasttime;
	}
	public void setCmtLasttime(Date cmtLasttime) {
		this.cmtLasttime = cmtLasttime;
	}
	public int getCmtSiteId() {
		return cmtSiteId;
	}
	public void setCmtSiteId(int cmtSiteId) {
		this.cmtSiteId = cmtSiteId;
	}
}
