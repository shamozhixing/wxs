package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactDriver;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactDriverDao extends BaseDao<ContactDriver> {
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactDriver> findPages(int pageNo, int pageSize, Map<String,String> map);
	
	/**根据条件查询*/
	public List<ContactDriver> findByScreen(Map<String,String> map);
}
