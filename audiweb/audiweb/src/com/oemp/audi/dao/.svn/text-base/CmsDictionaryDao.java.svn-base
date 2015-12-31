package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface CmsDictionaryDao extends BaseDao<CmsDictionary> {	
	/**
	 * 查询字典
	 * @param page
	 * @param limit
	 * @param screenMap
	 * @return
	 */
	PageTools<CmsDictionary> findByHql(int page, int limit,Map<String, Object> screenMap);
	/**
	 * 根据父id获取字典信息
	 * @param cpType
	 * @return
	 */
	List<CmsDictionary> getByUpid(Long upid);
	
	/**
	 * 获取有效信息
	 * @param upid
	 * @return
	 */
	List<CmsDictionary> getByUpidByFlag(Long upid);
}
