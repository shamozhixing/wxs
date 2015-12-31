package com.oemp.cms.bean;

import java.util.Date;

//import com.oemp.common.UtilTools;

public class CmsLog {
	private Integer cmlId;			//系统日志主键ID
	private String cmlFunction;		//日志操作功能
	private String cmlType;			//日志类型
	private String cmlDesc;			//日志描述
	private Date cmlTime;			//日志日期
	private String cmlUser;			//日志添加人
	
	//提供常量类型
	public static final String Add = "ADD";			//添加
	public static final String MODIFY = "MODIFY";	//修改
	public static final String DELETE = "DELETE";	//删除
	public static final String AUDIT = "AUDIT";		//审核
	public static final String EDIT = "EDIT";		//编辑
	public static final String PUBLISH = "PUBLISH";	//发布
	public static final String EDITORPUBLISH = "EDITORPUBLISH";	//编辑/发布
	public static final String CANCELISSUE = "CANCELISSUE";	//撤销发布

	public Integer getCmlId() {
		return cmlId;
	}
	public void setCmlId(Integer cmlId) {
		this.cmlId = cmlId;
	}
	public String getCmlFunction() {
		return cmlFunction;
	}
	public void setCmlFunction(String cmlFunction) {
		this.cmlFunction = cmlFunction;
	}
	public String getCmlType() {
		return cmlType;
	}
	public void setCmlType(String cmlType) {
		this.cmlType = cmlType;
	}
	public String getCmlDesc() {
		return cmlDesc;
	}
	public void setCmlDesc(String cmlDesc) {
		this.cmlDesc = cmlDesc;
	}
	public Date getCmlTime() {
		return cmlTime;
	}
	public void setCmlTime(Date cmlTime) {
		this.cmlTime = cmlTime;
	}
	public String getCmlUser() {
		return cmlUser;
	}
	public void setCmlUser(String cmlUser) {
		this.cmlUser = cmlUser;
	}
	
	
}
