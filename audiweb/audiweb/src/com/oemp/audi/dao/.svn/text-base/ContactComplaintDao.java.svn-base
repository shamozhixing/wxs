package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactComplaint;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactComplaintDao extends BaseDao<ContactComplaint> {
	
	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactComplaint> findPages(int pageNo, int pageSize, Map<String,String> map);
	/**查询条件*/
	public List<ContactComplaint> findByScreen( Map<String,String> map);
}
