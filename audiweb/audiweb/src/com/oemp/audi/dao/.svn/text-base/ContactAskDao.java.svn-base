package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactAsk;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactAskDao extends BaseDao<ContactAsk> {

	/**
	 * 保存经销商
	 * @param activityClass
	 * @return
	 */
	//ContactAsk save(ContactAsk contactAsk);
	
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactAsk> findPages(int pageNo, int pageSize, Map<String,String> map);
	
	/**条件查询*/
	public List<ContactAsk> findByScreen(Map<String, String> map);
}
