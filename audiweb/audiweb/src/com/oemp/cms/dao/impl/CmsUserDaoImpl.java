package com.oemp.cms.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.dao.CmsUserDao;
import com.oemp.frame.hibernate.BaseDaoImpl;

@Repository
public class CmsUserDaoImpl extends BaseDaoImpl<CmsUser> implements CmsUserDao{

	public List<CmsUser> getListByScreen(Map<String, String> screenMap) {
		StringBuffer hql=new StringBuffer();
		hql.append("from com.oemp.cms.bean.CmsUser cu where ");
		 hql.append(" cu.cmuName like ?");
		 hql.append(" and cu.cmuEmail like ?");
		 hql.append(" and cu.cmuFullName like ?");
		 // 建立查询语句
		Query query = getSession().createQuery(hql.toString());
		query.setString(0,"%"+screenMap.get("cmuName")+"%");
		query.setString(1,"%"+screenMap.get("cmuEmail")+"%");
		query.setString(2,"%"+screenMap.get("cmuFullName")+"%");
		List<CmsUser>  list = query.list();
		if (list == null) {
			list = new ArrayList<CmsUser>();
		}
		return list;
	}

}
