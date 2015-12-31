package com.oemp.audi.service;


import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactComplaint;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

public interface ContactComplaintService extends BaseService {
	/**
	 * 保存建议
	 * @param activityClass
	 * @return
	 */
	ContactComplaint save(ContactComplaint activityClass);
	
	/**
	 * 后台 ：模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactComplaint> findPages(int pageNo, int pageSize, Map<String,String> map);
	/**查询条件*/
	List<ContactComplaint> findByScreen( Map<String,String> map);
}
