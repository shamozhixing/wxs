package com.oemp.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.bean.CmsUserRole;
import com.oemp.cms.dao.CmsUserDao;
import com.oemp.cms.dao.CmsUserRoleDao;
import com.oemp.cms.service.CmsUserService;
import com.oemp.frame.service.BaseServiceImpl;

@Service
public class CmsUserServiceImpl extends BaseServiceImpl implements CmsUserService{
	
	@Autowired
	protected CmsUserDao cmsUserDao;
	@Autowired
	protected CmsUserRoleDao cmsUserRoleDao;
	
	public CmsUser add(CmsUser cmsUser) {
		CmsUser cmsuser = cmsUserDao.save(cmsUser);
		//添加
		String roleStr=cmsUser.getCmuCmroRoles();
		String [] roles=roleStr.split(",");
		for (String r : roles) {
			CmsUserRole addCur=new CmsUserRole();
			addCur.setCurCmuId(cmsUser.getCmuId());
			addCur.setCurCmroName(r);
			cmsUserRoleDao.save(addCur);
		}
		return cmsuser;
	}

	public boolean del(Integer cmuId) {
		cmsUserDao.deleteById(cmuId);
		return true;
	}

	public boolean modify(CmsUser cmsUser) {
		cmsUserDao.update(cmsUser);
		//修改权限信息
		List<CmsUserRole> curList=cmsUserRoleDao.findByProperty("curCmuId",cmsUser.getCmuId());
		for (int i = 0;(null!=curList) &&  i < curList.size(); i++) {
			CmsUserRole cr=curList.get(i);
			cmsUserRoleDao.deleteById(cr.getCurId());
		} 
		
		//添加
		String roleStr=cmsUser.getCmuCmroRoles();
		String [] roles=roleStr.split(",");
		for (String r : roles) {
			CmsUserRole addCur=new CmsUserRole();
			addCur.setCurCmuId(cmsUser.getCmuId());
			addCur.setCurCmroName(r);
			cmsUserRoleDao.save(addCur);
		}
		return true;		
	}

	public List<CmsUser> query(CmsUser cmsuser) {
		List<CmsUser> cuList=new ArrayList<CmsUser>();
		if(isEmpty(cmsuser.getCmuName())){
			cuList =cmsUserDao.findAll();
		}else{
			cuList= cmsUserDao.findByProperty("cmuName", cmsuser.getCmuName());
		}
		for (CmsUser cu : cuList) {
			List<CmsUserRole> curList=cmsUserRoleDao.findByProperty("curCmuId",cu.getCmuId());
			String roleStr="";
			for (CmsUserRole cur : curList) {
				if(roleStr=="")
				{
					roleStr=cur.getCurCmroName();
				}else{
					roleStr+=","+cur.getCurCmroName();
				}
			}
			cu.setCmuCmroRoles(roleStr);
		}
		return cuList;
	}
	
	/** 登录判断 */
	public CmsUser login(String cmuName, String cmuPassword){
		if(!(isEmpty(cmuName) || isEmpty(cmuPassword))){ 
			List<CmsUser> list = cmsUserDao.findByProperty("cmuName", cmuName);
			if(!list.isEmpty()){
				CmsUser cu = list.get(0);
				if(cu.getCmuPassword().equals(cmuPassword)){
					List<CmsUserRole> curList=cmsUserRoleDao.findByProperty("curCmuId",cu.getCmuId());
					String roleStr="";
					for (CmsUserRole cur : curList) {
						if(roleStr=="")
						{
							roleStr=cur.getCurCmroName();
						}else{
							roleStr+=","+cur.getCurCmroName();
						}
					}
					cu.setCmuCmroRoles(roleStr);
					return cu;
				}
			}
		}
		return null;
	}
	 /**根据筛选条件查询相关信息*/
	public List<CmsUser> queryByScreen(Map<String, String> screenMap) {
		List<CmsUser> cuList=cmsUserDao.getListByScreen(screenMap);
		for (CmsUser cu : cuList) {
			List<CmsUserRole> curList=cmsUserRoleDao.findByProperty("curCmuId",cu.getCmuId());
			String roleStr="";
			for (CmsUserRole cur : curList) {
				if(roleStr=="")
				{
					roleStr=cur.getCurCmroName();
				}else{
					roleStr+=","+cur.getCurCmroName();
				}
			}
			cu.setCmuCmroRoles(roleStr);
		}
		
		return cuList;
	}
	
	/**查询是否已经存在数据*/
    public Boolean isExistsObj(String cmuName){
    	 List list=cmsUserDao.findByProperty("cmuName",cmuName);
    	 if (list == null || list.size()==0) {
 			return false;
 		}else
 		{
 			return true;
 		}
    }
}
