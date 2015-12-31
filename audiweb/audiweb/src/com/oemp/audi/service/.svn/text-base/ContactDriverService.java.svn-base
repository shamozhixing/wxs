package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactDriver;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

/**
 * @author Zhou
 */
public interface ContactDriverService extends BaseService {
	
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactDriver> findPages(int pageNo, int pageSize, Map<String,String> map);

	public ContactDriver save(ContactDriver contactDriver);
	/**根据条件查询*/
	List<ContactDriver> findByScreen(Map<String,String> map);
}
