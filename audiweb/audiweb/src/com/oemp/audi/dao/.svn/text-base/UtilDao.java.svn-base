package com.oemp.audi.dao;

import java.util.Map;

import com.oemp.audi.bean.Dealer;
import com.oemp.frame.hibernate.BaseDao;

/**
 * 省市经销商公共查询dao
 * 
 * @author Zhijun Yuan
 * @version 1.0, 2013-6-4
 */
public interface UtilDao extends BaseDao<Dealer> {	
	String getDealerById(long aid);
	/**
	 * 获取dic中的cn
	 * @return
	 */
	Map<Long, String> getCacheDictionaryMap();
	Map<Long, String>  getDealerMap();
	/**
	 * 获取dic中的en
	 * @return
	 */
	Map<Long, String> getCacheDictionaryEnMap();
	
	/**
	 * 修改，添加或者删除后
	 * 重新缓存中文字典
	 */
	void resetDicCache();
	/**
	 * 修改，添加或者删除后
	 * 重新缓存经销商
	 */
	void resetDealerCache();
}
