package com.oemp.cms.service;

import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsRolePrivi;
import com.oemp.frame.service.BaseService;

/***
 * 
 * @author 
 *
 */
public interface CmsRolePriviService extends BaseService{
    public List<CmsRolePrivi> query(CmsRolePrivi cmsRolePrivi);
    
    public CmsRolePrivi add(CmsRolePrivi cmsRolePrivi);
    
    public boolean modify(CmsRolePrivi cmsRolePrivi);
    
    public boolean del(Integer crpId);
    
    public List<CmsRolePrivi> queryByScreen(Map<String,String> screenMap);
    /**查询是否已经存在数据*/
    public Boolean isExistsObj(String crpCmroName,String crpCmpId);
    /** 角色权限 */
    public List<CmsRolePrivi> queryRole(String rolename);
    
    /**批量删除*/
    public boolean deleteByCrpCmroName(String crpCmroName);

}
