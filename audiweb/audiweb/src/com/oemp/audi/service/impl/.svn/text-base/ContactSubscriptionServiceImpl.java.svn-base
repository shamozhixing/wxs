package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactSubscription;
import com.oemp.audi.dao.ContactSubscriptionDao;
import com.oemp.audi.service.ContactSubscriptionService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;

@Service
public class ContactSubscriptionServiceImpl extends BaseServiceImpl implements ContactSubscriptionService {
	@Autowired
	private ContactSubscriptionDao contactSubscriptionDao;
	/**
	 * @see com.oemp.audi.service.ContactSubscriptionService#findPages(int, int, java.util.Map)
	 */
	public PageTools<ContactSubscription> findPages(int pageNo,
			int pageSize, Map<String, String> map) {
		return contactSubscriptionDao.findPages(pageNo, pageSize, map);
	}
	/**查询条件*/
	public List<ContactSubscription> findByScreen(Map<String,String> map){
		return contactSubscriptionDao.findByScreen(map);
	}

}
