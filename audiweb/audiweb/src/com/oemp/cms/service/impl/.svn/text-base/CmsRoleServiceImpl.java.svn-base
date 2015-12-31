package com.oemp.cms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.cms.bean.CmsRole;
import com.oemp.cms.bean.CmsUserRole;
import com.oemp.cms.dao.CmsRoleDao;
import com.oemp.cms.dao.CmsRolePriviDao;
import com.oemp.cms.dao.CmsUserRoleDao;
import com.oemp.cms.service.CmsRoleService;
import com.oemp.frame.service.BaseServiceImpl;

@Service
public class CmsRoleServiceImpl extends BaseServiceImpl implements CmsRoleService{
    
    @Autowired
    protected CmsRoleDao cmsRoleDao; 
    @Autowired
    protected CmsRolePriviDao cmsRolePriviDao; 
    @Autowired
    protected CmsUserRoleDao cmsUserRoleDao; 
    public CmsRole add(CmsRole cmsRole) {
        CmsRole cmsrole = cmsRoleDao.save(cmsRole);
        return cmsrole;
    }

    public boolean del(String cmroName) {
    	//先删除主主表
        cmsRoleDao.deleteById(cmroName);
        //再删除子表
        List cmsRoles=cmsRolePriviDao.findByProperty("crpCmroName",cmroName);
        for (Object object : cmsRoles) {
        	 cmsRolePriviDao.delete(object);
		}
        //删除角色对应的用户关联信息
       List<CmsUserRole> curList= cmsUserRoleDao.findByProperty("curCmroName", cmroName);
       for (CmsUserRole cur : curList) {
    	   cmsUserRoleDao.delete(cur);
       }
        return true;
    }

    public boolean modify(CmsRole cmsRole) {
        cmsRoleDao.update(cmsRole);
        return true;
    }
        /**查询所有*/
    public List<CmsRole> query(CmsRole cmsRole) {
        if(isEmpty(cmsRole.getCmroName())){
            return cmsRoleDao.findAll();
        }
        return cmsRoleDao.findByProperty("cmroName", cmsRole.getCmroName());

    }

    public List<CmsRole> queryOne(CmsRole cmsRole) {
        return cmsRoleDao.findByProperty("cmroName", cmsRole.getCmroName());
    }
    /**根据筛选条件查询相关信息*/
	public List<CmsRole> queryByScreen(Map<String, String> screenMap) {
		return cmsRoleDao.getListByScreen(screenMap);
	}
	/**查询是否已经存在数据*/
    public Boolean isExistsObj(String cmroName){
    	 List list=cmsRoleDao.findByProperty("cmroName",cmroName);
    	 if (list == null || list.size()==0) {
  			return false;
  		}else
  		{
  			return true;
  		}
    }
    

}
