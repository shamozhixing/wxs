package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactProposal;
import com.oemp.audi.dao.ContactProposalDao;
import com.oemp.audi.service.ContactProposalService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;
@Service
public class ContactProposalServiceImpl extends BaseServiceImpl implements ContactProposalService {
	@Autowired
	protected ContactProposalDao contactProposalDao;
	public ContactProposal save(ContactProposal contactProposal) {
		ContactProposal cp=contactProposalDao.save(contactProposal);
		return cp;
	}
	
	
	public PageTools<ContactProposal> findPages(int pageNo, int pageSize, Map<String, String> map) {
		return contactProposalDao.findPages(pageNo, pageSize, map);
	}
	/**通过条件获取信息*/
	public List<ContactProposal> findByScreen( Map<String,String> map){
		return contactProposalDao.findByScreen(map);
	}
}
