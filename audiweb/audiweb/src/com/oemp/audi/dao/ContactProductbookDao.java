package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactProductbook;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactProductbookDao extends BaseDao<ContactProductbook> {	
	/**
	 * 查询产品手册
	 * @param page
	 * @param limit
	 * @param screenMap
	 * @return
	 */
	PageTools<ContactProductbook> findByHql(int page, int limit,Map<String, String> screenMap);
	/**
	 * 产品手册根据类型
	 * @param cpType
	 * @return
	 */
	List<ContactProductbook> getByCpType(Integer cpType);
}
