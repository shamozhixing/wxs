package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactSubscription;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

public interface ContactSubscriptionService extends BaseService {
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
