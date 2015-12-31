package com.oemp.audi.dao.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.ContactProposal;
import com.oemp.audi.dao.ContactProposalDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;
@Repository
public class ContactProposalDaoImpl extends BaseDaoImpl<ContactProposal> implements ContactProposalDao {
	/**
	 * @see com.oemp.audi.dao.ContactDriverDao#findPages(int, int, java.util.Map)
	 */
	@SuppressWarnings("unchecked")
	public PageTools<ContactProposal> findPages(int pageNo, int pageSize, Map<String, String> screenMap) {
		String sql = "from ContactProposal where 1=1 ";
		
		String cpName = screenMap.get("cpName");
		if(null != cpName && !"".equals(cpName)){
			sql += "and cpName like '%"+ CmsUtils.SqlReplace(cpName)+"%'";
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			sql+=" and cpAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and cpAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		sql+=" order by cpAddtime desc ";
		
		return findByHql(pageNo, pageSize, sql);
	}
	/**通过条件获取信息*/
	public List<ContactProposal> findByScreen( Map<String,String> screenMap){
		String hql = "from ContactProposal where 1=1 ";
		
		String cpName = screenMap.get("cpName");
		if(null != cpName && !"".equals(cpName)){
			hql += "and cpName like '%"+ CmsUtils.SqlReplace(cpName)+"%'";
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			hql+=" and cpAddtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and cpAddtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ";
		}
		hql+=" order by cpAddtime desc ";
		return find(hql);
	}
}
