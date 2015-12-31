package com.oemp.cms.service.impl;

import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.service.CmsBaseService;
import com.oemp.frame.service.BaseServiceImpl;
import com.oemp.frame.session.CmsSession;
import com.oemp.frame.util.CmsConstants;

public class CmsBaseServiceImpl extends BaseServiceImpl implements CmsBaseService{
	
	public CmsUser getLoginCmsUser(){
		return (CmsUser)CmsSession.getInstance().get(CmsConstants.ADMIN_USER);
	}

}
