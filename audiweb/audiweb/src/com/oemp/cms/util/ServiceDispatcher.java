package com.oemp.cms.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oemp.cms.service.CmsLogService;
import com.oemp.cms.service.CmsMenuService;
import com.oemp.cms.service.CmsPageService;
import com.oemp.cms.service.CmsRolePriviService;
import com.oemp.cms.service.CmsRoleService;
import com.oemp.cms.service.CmsUserLoginService;
import com.oemp.cms.service.CmsUserService;
import com.oemp.frame.dispatcher.BaseServiceDispatcher;


/** 
 * 业务执行分发 
 * @author cdy
 *
 */
@Repository
public class ServiceDispatcher extends BaseServiceDispatcher{
	
	@Autowired
	protected CmsUserService cmsUserService;
	public CmsUserService getCmsUserService(){
		return cmsUserService;
	}
	
	//系统日志
	@Autowired
	protected CmsLogService cmsLogService;
	public CmsLogService getCmsLogService(){
		return cmsLogService;
	}
	//栏目（页面）方法
	@Autowired
	protected CmsPageService cmsPageService;
	public CmsPageService getCmsPageService(){
		return cmsPageService;
	}
	
	
	//资源文件方法
	@Autowired
	protected CmsRoleService cmsRoleService;
	public CmsRoleService getCmsRoleService(){
		return cmsRoleService;
	}
	//getCmsRolePriviService()
	//权限方法
	@Autowired
	protected CmsRolePriviService cmsRolePriviService;
	public CmsRolePriviService getCmsRolePriviService(){
		return cmsRolePriviService;
	}
	
	//系统菜单
	@Autowired
	protected CmsMenuService cmsMenuService;
	public CmsMenuService getCmsMenuService() {
		return cmsMenuService;
	}
	//getCmsPageCommentService()
	
	//用户登录
	@Autowired
	protected CmsUserLoginService cmsUserLoginService;
	public CmsUserLoginService getCmsUserLoginService(){
		return cmsUserLoginService;
	}
	
}
