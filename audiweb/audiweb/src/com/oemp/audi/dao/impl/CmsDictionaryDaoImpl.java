package com.oemp.audi.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.dao.CmsDictionaryDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;

@Repository
public class CmsDictionaryDaoImpl extends BaseDaoImpl<CmsDictionary> implements CmsDictionaryDao {

	
	public PageTools<CmsDictionary> findByHql(int page, int limit,Map<String, Object> screenMap) {
		StringBuffer hql = new StringBuffer();
		Long upid=screenMap.get("upid")==null?Long.valueOf(0):Long.valueOf(screenMap.get("upid").toString());
		hql.append("from com.oemp.audi.bean.CmsDictionary where upid="+upid);
		StringBuffer orderBy = new StringBuffer();
		orderBy.append(" order by ordernum,cid asc");
		return findByHql(page, limit, hql.toString(),orderBy.toString());
	}

	
	public List<CmsDictionary> getByUpid(Long upid) {
		StringBuffer hql = new StringBuffer();
		hql.append("from com.oemp.audi.bean.CmsDictionary where upid=? order by ordernum,cid ");
		
		List<CmsDictionary> list= getSession().createQuery(hql.toString()).setLong(0, upid).list();
		return list;
	}
	
	public List<CmsDictionary> getByUpidByFlag(Long upid) {
		StringBuffer hql = new StringBuffer();
		hql.append("from com.oemp.audi.bean.CmsDictionary where upid=? and availabilityflag=1 order by ordernum,cid ");
		
		List<CmsDictionary> list= getSession().createQuery(hql.toString()).setLong(0, upid).list();
		return list;
	}
	
	
}
