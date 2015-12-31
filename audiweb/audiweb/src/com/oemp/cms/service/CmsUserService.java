package com.oemp.cms.service;

import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsUser;
import com.oemp.frame.service.BaseService;

public interface CmsUserService extends BaseService{
	
	public List<CmsUser> query(CmsUser cmsUser);
	
	public CmsUser add(CmsUser cmsUser);
	
	public boolean modify(CmsUser cmsUser);
	
	public boolean del(Integer cmuId);
	
	public CmsUser login(String cmuName, String cmuPassword);
	
	public List<CmsUser> queryByScreen(Map<String,String> screenMap);
	
	/**查询是否已经存在数据*/
    public Boolean isExistsObj(String cmuName);
}
