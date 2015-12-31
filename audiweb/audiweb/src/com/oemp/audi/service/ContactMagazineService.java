package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactMagazine;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

public interface ContactMagazineService extends BaseService {
	
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactMagazine> findPages(int pageNo, int pageSize, Map<String,String> map);
	
	public ContactMagazine save(ContactMagazine contactMagazine);
	
	
	List<ContactMagazine> findByScreen(Map<String,String> map);
}
