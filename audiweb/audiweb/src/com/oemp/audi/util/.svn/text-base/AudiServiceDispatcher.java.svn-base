package com.oemp.audi.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oemp.audi.dao.UtilDao;
import com.oemp.audi.service.CmsDictionaryService;
import com.oemp.audi.service.ContactAskService;
import com.oemp.audi.service.ContactComplaintService;
import com.oemp.audi.service.ContactDriverService;
import com.oemp.audi.service.ContactMagazineService;
import com.oemp.audi.service.ContactManualService;
import com.oemp.audi.service.ContactProductbookService;
import com.oemp.audi.service.ContactProposalService;
import com.oemp.audi.service.ContactSubscriptionService;
import com.oemp.audi.service.DealerService;
import com.oemp.audi.service.TbRegUserService;
import com.oemp.audi.service.TbSubscribeEnewsletterService;
import com.oemp.frame.dispatcher.BaseServiceDispatcher;

/**
 * Audi分发器
 * 
 * @author c
 * 
 */
@Repository
public class AudiServiceDispatcher extends BaseServiceDispatcher {

	@Autowired
	protected TbRegUserService regUserService;
	@Autowired
	protected DealerService dealerService;
	@Autowired
	protected ContactDriverService contactDriverService;
	@Autowired
	protected ContactAskService contactAskService;
	@Autowired
	protected ContactComplaintService contactComplaintService;
	@Autowired
	protected ContactProposalService contactProposalServie;
	@Autowired
	protected ContactMagazineService contactMagazineService;
	@Autowired
	protected ContactManualService contactManualService;
	@Autowired
	protected ContactSubscriptionService contactSubscriptionService;
	//产品手册维护
	@Autowired
	protected ContactProductbookService contactProductbookService;
	//字典表
	@Autowired
	protected  CmsDictionaryService cmsDictionaryService; 
	
	//新闻
	@Autowired
	protected TbSubscribeEnewsletterService tbSubscribeEnewsletterService;
	
	@Autowired
	protected UtilDao utilDao;
	
	public UtilDao getUtilDao() {
		return utilDao;
	}
	
	public CmsDictionaryService getCmsDictionaryService() {
		return cmsDictionaryService;
	}
	public TbSubscribeEnewsletterService getTbSubscribeEnewsletterService() {
		return tbSubscribeEnewsletterService;
	}

	public ContactProductbookService getContactProductbookService(){
		return contactProductbookService;
	}
	
	public ContactProposalService getContactProposalService(){
		return contactProposalServie;
	}
	
	public ContactComplaintService getContactComplaintService(){
		return contactComplaintService;
	}
	
	public ContactAskService getContactAskService(){
		return contactAskService;
	}
	
	public TbRegUserService getRegUserService() {
		return regUserService;
	}
	
	public DealerService getDealerService(){
		return dealerService;
	}
	
	public ContactDriverService getContactDriverService(){
		return contactDriverService;
	}
	
	public ContactMagazineService getContactMagazineService(){
		return contactMagazineService;
	}
	
	public ContactManualService getContactManualService(){
		return contactManualService;
	}
	
	public ContactSubscriptionService getContactSubscriptionService(){
		return contactSubscriptionService;
	}
	
}
