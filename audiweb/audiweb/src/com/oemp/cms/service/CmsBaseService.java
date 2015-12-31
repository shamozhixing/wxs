package com.oemp.cms.service;

import com.oemp.cms.bean.CmsUser;
import com.oemp.frame.service.BaseService;

public interface CmsBaseService extends BaseService{
	/** 
	 * 读取后台当前登录用户信息 
	 * @return 
	 */
	public CmsUser getLoginCmsUser();
}
