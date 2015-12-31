package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactProposal;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface ContactProposalDao extends BaseDao<ContactProposal> {

	/**
	 * 模糊分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return PageTools
	 */
	public PageTools<ContactProposal> findPages(int pageNo, int pageSize, Map<String,String> map);
	
	/**通过条件获取信息*/
	public List<ContactProposal> findByScreen( Map<String,String> map);
}
