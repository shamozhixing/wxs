package com.oemp.cms.action;

import org.apache.struts2.ServletActionContext;

import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.util.PrivlegeUtil;
import com.oemp.frame.action.BaseAction;
import com.oemp.frame.util.CmsConstants;
import com.oemp.frame.util.CmsUtils;

@SuppressWarnings("serial")
public abstract class AdminAction extends BaseAction{
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
		return isOther(PrivlegeUtil.ADD);
	}
	/**
	 * 是否有当前功能修改权
	 * @return
	 */
	public boolean isMod(){
		return isOther(PrivlegeUtil.MOD);
	}
	/**
	 * 是否有当前功能查询权
	 * @return
	 */
	public boolean isQuery(){
		return isOther(PrivlegeUtil.QUERY);
	}
	/**
	 * 是否有当前功能删除权
	 * @return
	 */
	public boolean isDel(){
		return isOther(PrivlegeUtil.DEL);
	}
	/**
	 * 是否有当前功能审核权
	 * @return
	 */
	public boolean isCheck(){
		return isOther(PrivlegeUtil.CHECK);
	}
	/**
	 * 是否有当前功能发布权
	 * @return
	 */
	public boolean isPub(){
		return isOther(PrivlegeUtil.PUB);
	}
	/**
	 * 是否有当前功能   val 权限值 
	 * @param val 权限值
	 * @return
	 */
	public boolean isOther(String val){
		return PrivlegeUtil.isPrivlege(nodeid, val);
	}
	
	protected CmsUser getCmsUser(){
		return (CmsUser)getSessionValue(CmsConstants.ADMIN_USER);
	}
	/**
	 * 获取根路径下
	 * @param uploaddir
	 * @return
	 */
	protected String getRootPathDir(String uploaddir)
	{
		if(CmsUtils.isEmpty(uploaddir)){
			uploaddir="";
		}
		StringBuffer dir =new StringBuffer(ServletActionContext.getServletContext().getRealPath(uploaddir));
		return dir.toString();
	}
}
