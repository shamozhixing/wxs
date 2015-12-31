package com.oemp.audi.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.ContactProductbook;
import com.oemp.audi.dao.ContactProductbookDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

@Repository
public class ContactProductbookDaoImpl extends BaseDaoImpl<ContactProductbook> implements ContactProductbookDao {

	
	public PageTools<ContactProductbook> findByHql(int page, int limit,Map<String, String> screenMap) {
		StringBuffer hql = new StringBuffer();
		hql.append("from com.oemp.audi.bean.ContactProductbook where 1=1 ");
		String cpBookname=screenMap.get("cpBookname");
		String cpType=screenMap.get("cpType");
		if(!CmsUtils.isEmpty(cpBookname)){
			hql.append(" and cpBookname like '%" +CmsUtils.SqlReplace(cpBookname) + "%'");
		}
		
		if(!CmsUtils.isEmpty(cpType)){
			hql.append(" and cpType = '" +CmsUtils.SqlReplace(cpType) + "'");
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			hql.append(" and cpAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and cpAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ");
		}
		StringBuffer orderBy = new StringBuffer();
		orderBy.append(" order by cpAddtime desc");
		return findByHql(page, limit, hql.toString(),orderBy.toString());
	}

	/**
	 * @see com.oemp.audi.dao.ContactProductbookDao#getByCpType(java.lang.Integer)
	 */
	public List<ContactProductbook> getByCpType(Integer cpType) {
		StringBuffer hql = new StringBuffer();
		hql.append("from com.oemp.audi.bean.ContactProductbook where cpIspub=1 and cpType=? order by cpOrder ");
		
		List<ContactProductbook> list= getSession().createQuery(hql.toString()).setInteger(0, cpType).list();
		return list;
	}
	
}
