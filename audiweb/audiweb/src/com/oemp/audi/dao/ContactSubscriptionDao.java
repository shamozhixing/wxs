package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactSubscription;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactSubscriptionDao extends BaseDao<ContactSubscription> {
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactSubscription> findPages(int pageNo, int pageSize, Map<String,String> map);
	
	/**查询条件*/
	List<ContactSubscription> findByScreen(Map<String,String> map);

}
