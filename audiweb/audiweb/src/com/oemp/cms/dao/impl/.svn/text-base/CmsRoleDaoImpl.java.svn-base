package com.oemp.cms.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.oemp.cms.bean.CmsRole;
import com.oemp.cms.dao.CmsRoleDao;

@Repository
public class CmsRoleDaoImpl extends CmsBaseDaoImpl<CmsRole> implements CmsRoleDao{
	public List<CmsRole> getListByScreen(Map<String,String> screenMap) {
		StringBuffer hql=new StringBuffer();
		hql.append("from com.oemp.cms.bean.CmsRole cr where ");
		 hql.append(" cr.cmroName like ?");
		 hql.append(" and cr.cmroDesc like ?");
		 hql.append(" and cr.cmroAdduser like ?");
		// 建立查询语句
		Query query = getSession().createQuery(hql.toString());
		query.setString(0,"%"+screenMap.get("cmroName")+"%");
		query.setString(1,"%"+screenMap.get("cmroDesc")+"%");
		query.setString(2,"%"+screenMap.get("cmroAdduser")+"%");
		List<CmsRole>  list = query.list();
		if (list == null) {
			list = new ArrayList<CmsRole>();
		}
		return list;
	}
}
