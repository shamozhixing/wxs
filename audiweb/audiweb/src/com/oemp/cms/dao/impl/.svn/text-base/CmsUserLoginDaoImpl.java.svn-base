package com.oemp.cms.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.oemp.cms.bean.CmsUserLogin;
import com.oemp.cms.dao.CmsUserLoginDao;
import com.oemp.common.UtilTools;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.util.CmsUtils;
@Repository
public class CmsUserLoginDaoImpl extends BaseDaoImpl<CmsUserLogin> implements CmsUserLoginDao{

   private	CmsUserLoginDao cul;
	public List<CmsUserLogin> SelectUserByMap(Map<String,String> optionMap) {
		StringBuffer hql=new StringBuffer();
		hql.append("from com.oemp.cms.bean.CmsUserLogin cul where 1=1 ");
		if(!"".equals(optionMap.get("cmuId")))
		{
			hql.append(" and cul.culCmuId in ("+optionMap.get("cmuId")+") ");
		}
		if(!"".equals(optionMap.get("startTime")))
		{
			hql.append(" and CONVERT(date,cul.culLoginTime) >= ?");
			hql.append(" and CONVERT(date,cul.culLoginTime) <= ?");
		}
		 Query query = getSession().createQuery(hql.toString());
		 if(!"".equals(optionMap.get("startTime")))
		 {
			query.setDate(0,UtilTools.formatDateByStr(optionMap.get("startTime"),UtilTools.YYYYMMDD));
			query.setDate(1,UtilTools.formatDateByStr(optionMap.get("endTime"),UtilTools.YYYYMMDD));
		 }
			List<CmsUserLogin>  list = query.list();
			if (list == null) {
				list = new ArrayList<CmsUserLogin>();
			}
			return  list;
	}
//根据时间查询信息
	public List<CmsUserLogin> SelectUserByTime(int cmuId,String startTime,String endTime) {
		StringBuffer hql = new StringBuffer();
		hql.append("from com.oemp.cms.bean.CmsUserLogin cul where ");
		hql.append("cul.culCmuId='"+cmuId+"'");
		hql.append("and CONVERT(varchar(100), cul.culLoginTime, 23)>=convert(date,'"+CmsUtils.SqlReplace(startTime)+"')");
		hql.append(" and  CONVERT(varchar(100), cul.culLoginTime, 23)<=convert(date,'"+CmsUtils.SqlReplace(endTime)+"')");
		List<CmsUserLogin>  list = find(hql.toString());
		if (list == null) {
			list = cul.findAll();
		}
		return  list;
	}
	public List<CmsUserLogin> SelectUserByTime(Map<String, String> screenMap) {
		// TODO Auto-generated method stub
		return null;
	}
  
}
