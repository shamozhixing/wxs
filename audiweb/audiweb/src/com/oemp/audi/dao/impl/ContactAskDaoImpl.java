package com.oemp.audi.dao.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.ContactAsk;
import com.oemp.audi.dao.ContactAskDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

@Repository
public class ContactAskDaoImpl extends BaseDaoImpl<ContactAsk> implements ContactAskDao {

//	public ContactAsk save(ContactAsk contactAsk) {
//		
//		return null;
//	}


	/**
	 * @see com.oemp.audi.dao.ContactDriverDao#findPages(int, int, java.util.Map)
	 */
	@SuppressWarnings("unchecked")
	public PageTools<ContactAsk> findPages(int pageNo, int pageSize, Map<String, String> screenMap) {
		String sql = "from ContactAsk where 1=1 ";
		
		String caName = screenMap.get("caName");
		if(null != caName && !"".equals(caName)){
			sql += "and caName like '%"+ CmsUtils.SqlReplace(caName)+"%'";
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and caAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and caAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by caAddtime desc ";
		
		return findByHql(pageNo, pageSize, sql);
	}
	/**条件查询*/
	public List<ContactAsk> findByScreen(Map<String, String> screenMap){
		String sql = "from ContactAsk where 1=1 ";
		
		String caName = screenMap.get("caName");
		if(null != caName && !"".equals(caName)){
			sql += "and caName like '%"+ CmsUtils.SqlReplace(caName)+"%'";
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and caAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and caAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by caAddtime desc ";
		
		return find(sql);
	}
}
