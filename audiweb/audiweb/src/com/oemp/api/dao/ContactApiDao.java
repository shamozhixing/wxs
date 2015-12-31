package com.oemp.api.dao;

import java.util.List;
import java.util.Map;

import com.oemp.api.bean.ContactApi;
import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.bean.ContactAsk;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactApiDao extends BaseDao<ContactApi> {	
	
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactAsk> findPages(int pageNo, int pageSize, Map<String,String> map);

}
