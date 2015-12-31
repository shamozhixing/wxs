package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactManual;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactManualDao extends BaseDao<ContactManual> {
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactManual> findPages(int pageNo, int pageSize, Map<String,String> map);
	
	public List<ContactManual> findByScreen(Map<String,String> map);
	
}
