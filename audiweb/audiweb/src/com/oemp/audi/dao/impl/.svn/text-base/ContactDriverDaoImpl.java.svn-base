package com.oemp.audi.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.ContactDriver;
import com.oemp.audi.dao.ContactDriverDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.hibernate.OrderBy;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

@Repository
public class ContactDriverDaoImpl extends BaseDaoImpl<ContactDriver> implements ContactDriverDao  {

	/**
	 * @see com.oemp.audi.dao.ContactDriverDao#findPages(int, int, java.util.Map)
	 */
	public PageTools<ContactDriver> findPages(int pageNo, int pageSize,
			Map<String, String> screenMap) {
		
		String sql = "from ContactDriver where 1=1 ";
		
		String cdname = screenMap.get("cdname");
		if(cdname!=null&&!cdname.equals("")){
			sql += "and cdName like '%"+ CmsUtils.SqlReplace(cdname)+"%'";
		}
		
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and cdAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and cdAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by cdAddtime desc ";
		return findByHql(pageNo, pageSize, sql);
	}

	/**根据条件查询*/
	public List<ContactDriver> findByScreen(Map<String,String> screenMap){
		String sql = "from ContactDriver where 1=1 ";
		String cdname = screenMap.get("cdname");
		if(cdname!=null&&!cdname.equals("")){
			sql += "and cdName like '%"+ CmsUtils.SqlReplace(cdname)+"%'";
		}
		
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and cdAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and cdAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by cdAddtime desc ";
		return find(sql);
	}


}
