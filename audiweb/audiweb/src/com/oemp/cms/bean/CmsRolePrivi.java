package com.oemp.cms.bean;

public class CmsRolePrivi {
    private Integer crpId;         		//角色权限主键ID
    private String crpCmroName;			//角色名称
    private Integer crpCmcId;			//菜单ID
    private String crpPrivValue;		//权限值
    
    
	public Integer getCrpId() {
		return crpId;
	}
	public void setCrpId(Integer crpId) {
		this.crpId = crpId;
	}
	public String getCrpCmroName() {
		return crpCmroName;
	}
	public void setCrpCmroName(String crpCmroName) {
		this.crpCmroName = crpCmroName;
	}
	public Integer getCrpCmcId() {
		return crpCmcId;
	}
	public void setCrpCmcId(Integer crpCmcId) {
		this.crpCmcId = crpCmcId;
	}
	public String getCrpPrivValue() {
		return crpPrivValue;
	}
	public void setCrpPrivValue(String crpPrivValue) {
		this.crpPrivValue = crpPrivValue;
	}
  
    
    
}
