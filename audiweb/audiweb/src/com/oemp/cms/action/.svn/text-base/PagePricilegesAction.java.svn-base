package com.oemp.cms.action;

import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.util.PagePrivlegeUtil;
import com.oemp.frame.action.BaseAction;
import com.oemp.frame.util.CmsConstants;
//设置内容权限
@SuppressWarnings("serial")
public abstract class PagePricilegesAction extends BaseAction{
	/** 当前操作菜单ID */
	private Integer nodeid;
	/** 当前操作方法 */
	private String method;
	public Integer getNodeid() {
		return nodeid;
	}
	public void setNodeid(Integer nodeid) {
		this.nodeid = nodeid;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	/**
	 * 是否有当前功能新增权
	 * @return
	 */
	public boolean isAdd(){
		return isOther(PagePrivlegeUtil.ADD);
	}
	/**
	 * 是否有当前功能修改权
	 * @return
	 */
	public boolean isMod(){
		return isOther(PagePrivlegeUtil.MOD);
	}
	/**
	 * 是否有当前功能查询权
	 * @return
	 */
	public boolean isQuery(){
		return isOther(PagePrivlegeUtil.QUERY);
	}
	/**
	 * 是否有当前功能删除权
	 * @return
	 */
	public boolean isDel(){
		return isOther(PagePrivlegeUtil.DEL);
	}
	/**
	 * 是否有当前功能审核权
	 * @return
	 */
	public boolean isCheck(){
		return isOther(PagePrivlegeUtil.CHECK);
	}
	/**
	 * 是否有当前功能发布权
	 * @return
	 */
	public boolean isPub(){
		return isOther(PagePrivlegeUtil.PUB);
	}
	/**
	 * 是否有当前功能   val 权限值 
	 * @param val 权限值
	 * @return
	 */
	public boolean isOther(String val){
		return PagePrivlegeUtil.isPrivlege(nodeid, val);
	}
	
	protected CmsUser getCmsUser(){
		return (CmsUser)getSessionValue(CmsConstants.ADMIN_USER);
	}

}
