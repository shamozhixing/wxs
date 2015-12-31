package com.oemp.cms.bean;
import java.util.Date;
public class CmsUserLogin {
  private int culId;
  private int culCmuId;
  public int getCulCmuId() {
	return culCmuId;
}
public void setCulCmuId(int culCmuId) {
	this.culCmuId = culCmuId;
}
private Date culLoginTime;
  private CmsUser cmuName;
public CmsUser getCmuName() {
	return cmuName;
}
public void setCmuName(CmsUser cmuName) {
	this.cmuName = cmuName;
}
public int getCulId() {
	return culId;
}
public void setCulId(int culId) {
	this.culId = culId;
}
public Date getCulLoginTime() {
	return culLoginTime;
}
public void setCulLoginTime(Date culLoginTime) {
	this.culLoginTime = culLoginTime;
}

  
}
