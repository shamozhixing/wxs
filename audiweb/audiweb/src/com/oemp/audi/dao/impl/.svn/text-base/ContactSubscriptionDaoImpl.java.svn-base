package com.oemp.audi.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.ContactDriver;
import com.oemp.audi.bean.ContactSubscription;
import com.oemp.audi.dao.ContactSubscriptionDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

@Repository
public class ContactSubscriptionDaoImpl extends BaseDaoImpl<ContactSubscription> implements ContactSubscriptionDao {

	/**
	 * @see com.oemp.audi.dao.ContactSubscriptionDao#findPages(int, int, java.util.Map)
	 */
	public PageTools<ContactSubscription> findPages(int pageNo, int pageSize,
			Map<String, String> screenMap) {
		String sql = "from ContactSubscription where 1=1 ";
		
		String csEmail = screenMap.get("csEmail");
		if(csEmail!=null&&!csEmail.equals("")){
			sql += "and csEmail like '%"+ CmsUtils.SqlReplace(csEmail)+"%'";
		}
		
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and csAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and csAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by csAddtime desc ";
		return findByHql(pageNo, pageSize, sql);
	}
	
	/**查询条件*/
	public List<ContactSubscription> findByScreen(Map<String,String> screenMap){
		String sql = "from ContactSubscription where 1=1 ";
		
		String csEmail = screenMap.get("csEmail");
		if(csEmail!=null&&!csEmail.equals("")){
			sql += "and csEmail like '%"+ CmsUtils.SqlReplace(csEmail)+"%'";
		}
		
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and csAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and csAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by csAddtime desc ";
		return find(sql);
	}
	

}
