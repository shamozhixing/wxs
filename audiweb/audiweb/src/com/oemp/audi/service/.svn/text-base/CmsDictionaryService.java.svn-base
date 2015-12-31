package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.frame.page.PageTools;


/**
 * 产品手册service
 * 
 * @author c
 * 
 */
public interface CmsDictionaryService {
	
	/** 根据条件信息 */
	PageTools<CmsDictionary> findByHql(final int page, final int limit,Map<String, Object> screenMap);
	
	/**
	 * 修改信息
	 * @param bean
	 * @return
	 */
	boolean saveOrUpdate(CmsDictionary bean);
	
	/**
	 * 获取对象
	 * @param cpId
	 * @return
	 */
	CmsDictionary getByCId(Long cid);
	
	/**
	 * 根绝upid获取子信息
	 * @param cpType
	 * @return
	 */
	List<CmsDictionary> getByUpid(Long upid);
	
	//获取资源树，根据id
	public String getDictionaryTreeByUpid(Long upid);
	
	/**
	 * 获取有效信息
	 * @param upid
	 * @return
	 */
	List<CmsDictionary> getByUpidByFlag(Long upid);
}
