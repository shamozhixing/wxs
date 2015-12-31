/**
 * 
 */
package com.oemp.audi.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.bean.Dealer;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-5-16
 */

public interface DealerDao extends BaseDao<Dealer>{

	/**
	 * 分页查询全部信息
	 */
	PageTools<Dealer> findByHql(int page, int limit,Map<String, String> screeMap);
	/**
	 * 通过省id获取城市名称
	 */
	List<CmsDictionary> getCityAll(long id);
	/**
	 * 获取全部的省
	 */
	List<CmsDictionary> getProvinceAll();

	/**
	 * 查询经销商
	 */
	@SuppressWarnings("unchecked")
	List getDealerlist(String proid,String cityid,String lbid);
	
	Dealer  findbyid(long id);
	
	List getDealerlistbyhql(String hqlstr);
	
	
	
	public Map  dealer(long id);
	public Map dealerprovince(long ccid);

	public Map dealercity(long pid);

}
