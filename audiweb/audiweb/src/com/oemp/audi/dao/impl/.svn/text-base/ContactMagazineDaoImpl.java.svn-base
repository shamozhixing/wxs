package com.oemp.audi.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.ContactMagazine;
import com.oemp.audi.dao.ContactMagazineDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

@Repository
public class ContactMagazineDaoImpl extends BaseDaoImpl<ContactMagazine> implements ContactMagazineDao {

	/**
	 * @see com.oemp.audi.dao.ContactMagazineDao#findPages(int, int, java.util.Map)
	 */
	public PageTools<ContactMagazine> findPages(int pageNo, int pageSize,
			Map<String, String> screenMap) {
		
		String sql = "from ContactMagazine where 1=1 ";
		
		String cmName = screenMap.get("cmName");
		if(cmName!=null&&!cmName.equals("")){
			sql += "and cmName like '%"+ CmsUtils.SqlReplace(cmName)+"%'";
		}
		
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and cmAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and cmAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by cmAddtime desc ";
		return findByHql(pageNo, pageSize, sql);
	}

	public List<ContactMagazine> findByScreen(Map<String, String> screenMap){
		
		String sql = "from ContactMagazine where 1=1 ";
		
		String cmName = screenMap.get("cmName");
		if(cmName!=null&&!cmName.equals("")){
			sql += "and cmName like '%"+ CmsUtils.SqlReplace(cmName)+"%'";
		}
		
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and cmAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and cmAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by cmAddtime desc ";
		return find(sql);
	}


}
