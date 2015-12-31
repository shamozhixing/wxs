package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactMagazine;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactMagazineDao extends BaseDao<ContactMagazine> {

	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactMagazine> findPages(int pageNo, int pageSize, Map<String,String> map);
	public List<ContactMagazine> findByScreen(Map<String, String> map);
}
