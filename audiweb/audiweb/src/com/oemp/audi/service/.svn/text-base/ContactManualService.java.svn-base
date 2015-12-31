package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactManual;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

public interface ContactManualService extends BaseService {
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactManual> findPages(int pageNo, int pageSize, Map<String,String> map);
		/**
		 * 保存获取产品手册
		 * 
		 */
	public ContactManual save(ContactManual manual);
	
	public List<ContactManual> findByScreen(Map<String,String> map);
}
