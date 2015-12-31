package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactProposal;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

public interface ContactProposalService extends BaseService {

	ContactProposal save(ContactProposal contactProposal);
	
	/**
	 * 后台 ：模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactProposal> findPages(int pageNo, int pageSize, Map<String,String> map);
	
	/**通过条件获取信息*/
	List<ContactProposal> findByScreen( Map<String,String> map);
}
