package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactAsk;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

/**
 * @author XingShan Wang
 * @version 1.0, 2013-5-27
 */
public interface ContactAskService extends BaseService {
	/**
	 * 保存咨询
	 * @param activityClass
	 * @return
	 */
	ContactAsk save(ContactAsk activityClass);
	
	/**
	 * 后台 ：模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactAsk> findPages(int pageNo, int pageSize, Map<String,String> map);
	
	/**条件查询*/
	List<ContactAsk> findByScreen(Map<String, String> map);
}
