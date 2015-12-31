package com.oemp.cms.service;

import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsRole;
import com.oemp.frame.service.BaseService;

public interface CmsRoleService extends BaseService{
    public List<CmsRole> query(CmsRole cmsRole);
    
    public List<CmsRole> queryByScreen(Map<String,String> screenMap);
    
    public CmsRole add(CmsRole cmsRole);
    
    public boolean modify(CmsRole cmsRole);
    
    public List<CmsRole> queryOne(CmsRole cmsRole);//查询单挑数据
    
    public boolean del(String cmroName);
    
    /**查询是否已经存在数据*/
    public Boolean isExistsObj(String cmroName);
    

}
