package com.oemp.audi.dao.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.ContactComplaint;
import com.oemp.audi.dao.ContactComplaintDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;
@Repository
public class ContactComplaintDaoImpl extends BaseDaoImpl<ContactComplaint> implements ContactComplaintDao {

	/**
	 * @see com.oemp.audi.dao.ContactDriverDao#findPages(int, int, java.util.Map)
	 */
	@SuppressWarnings("unchecked")
	public PageTools<ContactComplaint> findPages(int pageNo, int pageSize, Map<String, String> screenMap) {
		String sql = "from ContactComplaint where 1=1 ";
		
		String ccName = screenMap.get("ccName");
		if(null != ccName && !"".equals(ccName)){
			sql += "and ccName like '%"+ CmsUtils.SqlReplace(ccName)+"%'";
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and ccAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and ccAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by ccAddtime desc ";
		return findByHql(pageNo, pageSize, sql);
	}
	
	
	/**查询条件*/
	public List<ContactComplaint> findByScreen( Map<String,String> screenMap){
		String sql = "from ContactComplaint where 1=1 ";
		
		String ccName = screenMap.get("ccName");
		if(null != ccName && !"".equals(ccName)){
			sql += "and ccName like '%"+ CmsUtils.SqlReplace(ccName)+"%'";
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and ccAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and ccAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by ccAddtime desc ";
		return find(sql);
	}
}
