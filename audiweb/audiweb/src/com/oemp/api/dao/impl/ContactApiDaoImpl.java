package com.oemp.api.dao.impl;


import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.api.bean.ContactApi;
import com.oemp.api.dao.ContactApiDao;
import com.oemp.audi.bean.ContactAsk;
import com.oemp.audi.dao.ContactAskDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

@Repository
public class ContactApiDaoImpl extends BaseDaoImpl<ContactApi> implements ContactApiDao {

	/**
	 * @see com.oemp.audi.dao.ContactDriverDao#findPages(int, int, java.util.Map)
	 */
	@SuppressWarnings("unchecked")
	public PageTools<ContactAsk> findPages(int pageNo, int pageSize, Map<String, String> map) {
		String sql = "from ContactApi where 1=1 ";
		/*
		String caName = map.get("caName");
		if(null != caName && !"".equals(caName)){
			sql += "and caName like '%"+ CmsUtils.SqlReplace(caName)+"%'";
		}*/
		return findByHql(pageNo, pageSize, sql);
	}

}
