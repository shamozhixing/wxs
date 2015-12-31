/**
 * 
 */
package com.oemp.audi.service;
import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.bean.Dealer;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;


/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-5-16
 */
public interface DealerService extends BaseService{
	/**
	 * 保存经销商
	 * @param activityClass
	 * @return
	 */
	Dealer saveOrUpdate(Dealer de);
	/**
	 * 条件查询全部信息
	 */
	PageTools<Dealer> findByHql(int page, int limit, Map<String, String> screeMap);
	/**
	 * 批量删除
	 */
	boolean delete(long id);
	/**
	 * 通过省id获取城市名称
	 */
	List<CmsDictionary> getCityAll(long id);
	/**
	 * 获取全部的省
	 */
	List<CmsDictionary> getProvinceAll();
	
	 /**
	   * 获取经销商省列表

	   * @return
	   */
	  Map dealerprovince(long id);
	  /**
	   * 获取经销商城市列表

	   * @param pid

	   * @return
	   */
	  Map dealercity(long pid);
	  
	  /**
	   * 获取经销商列表

	   * @param cid
	   * @return
	   */
	  Map dealer(long cid);
}
