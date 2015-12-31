package com.oemp.cms.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.oemp.cms.bean.CmsRolePrivi;
import com.oemp.cms.dao.CmsRolePriviDao;
import com.oemp.frame.hibernate.BaseDaoImpl;

@Repository
public class CmsRolePriviDaoImpl extends BaseDaoImpl<CmsRolePrivi> implements CmsRolePriviDao {
	//根据条件查询信息
	public List<CmsRolePrivi> getListByScreen(Map<String,String> screenMap) {
		StringBuffer hql=new StringBuffer();
		hql.append("from com.oemp.cms.bean.CmsRolePrivi crp where ");
		hql.append(" crp.crpCmroName like ?");
		if(null!=screenMap.get("crpCmpId") && !"".equals(screenMap.get("crpCmpId")))
		{
		  hql.append(" and crp.crpCmpId = ?");
	    }
		// 建立查询语句
		Query query = getSession().createQuery(hql.toString());
		query.setString(0, "%"+screenMap.get("crpCmroName")+"%");
		if(null!=screenMap.get("crpCmpId") && !"".equals(screenMap.get("crpCmpId")))
		{
			query.setInteger(1, Integer.parseInt(screenMap.get("crpCmpId").toString()));
		}
		List<CmsRolePrivi>  list = query.list();
		if (list == null) {
			list = new ArrayList<CmsRolePrivi>();
		}
		return list;
	}
	/**查询是否已经存在数据*/
	 public Boolean isExistsObj(String crpCmroName,String crpCmpId){
    	StringBuffer hql=new StringBuffer();
		hql.append("from com.oemp.cms.bean.CmsRolePrivi crp where ");
		hql.append(" crp.crpCmroName = ?");
	    hql.append(" and crp.crpCmpId = ?");
		// 建立查询语句
		Query query = getSession().createQuery(hql.toString());
		query.setString(0,crpCmroName);
		query.setInteger(1,Integer.parseInt(crpCmpId.toString()));
		List<CmsRolePrivi>  list = query.list();
		if (list == null || list.size()==0) {
			return false;
		}else
		{
			return true;
		}
    }
	 
	 /**批量删除*/
	 public boolean deleteByCrpCmroName(String crpCmroName){
		 StringBuffer hql=new StringBuffer();
			hql.append("delete from com.oemp.cms.bean.CmsRolePrivi crp where ");
			hql.append(" crp.crpCmroName = ?");
			// 建立查询语句
			Query query = getSession().createQuery(hql.toString());
			query.setString(0,crpCmroName);
			query.executeUpdate();
			return true;
	 }
}
