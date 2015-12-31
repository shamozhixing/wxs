package com.oemp.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.cms.bean.CmsRolePrivi;
import com.oemp.cms.dao.CmsRolePriviDao;
import com.oemp.cms.service.CmsRolePriviService;
import com.oemp.frame.service.BaseServiceImpl;
//no page
@Service
public class CmsRolePriviServiceImpl extends BaseServiceImpl implements CmsRolePriviService{
    
    @Autowired
    protected CmsRolePriviDao cmsRolePriviDao;


    public CmsRolePrivi add(CmsRolePrivi cmsRolePrivi) {
        CmsRolePrivi cmsroleprivi=cmsRolePriviDao.save(cmsRolePrivi);  
        return cmsroleprivi;
    }

    
    public boolean del(Integer crpId) {
        cmsRolePriviDao.deleteById(crpId);
        return true;
    }

    
    public boolean modify(CmsRolePrivi cmsRolePrivi) {
        cmsRolePriviDao.update(cmsRolePrivi);
        return true;
    }

    
    public List<CmsRolePrivi> query(CmsRolePrivi cmsRolePrivi) {
        return cmsRolePriviDao.findByProperty("crpId", cmsRolePrivi.getCrpId());
    }

    /**根据筛选条件查询相关信息*/
	public List<CmsRolePrivi> queryByScreen(Map<String, String> screenMap) {
		return cmsRolePriviDao.getListByScreen(screenMap);
	}
	/**查询是否已经存在数据*/
	 public Boolean isExistsObj(String crpCmroName,String crpCmpId){
    	return cmsRolePriviDao.isExistsObj(crpCmroName,crpCmpId);
    }

	public List<CmsRolePrivi> queryRole(String rolename){
		List<CmsRolePrivi> crpList=new ArrayList<CmsRolePrivi>();
		if(null !=rolename){
			//角色
			String [] roles=rolename.split(",");
			for (String r : roles) {
				crpList.addAll(cmsRolePriviDao.findByProperty("crpCmroName", r));
			}	
		}
		return crpList;
	}
	 /**批量删除*/
    public boolean deleteByCrpCmroName(String crpCmroName){
    	return cmsRolePriviDao.deleteByCrpCmroName(crpCmroName);
    }

}
