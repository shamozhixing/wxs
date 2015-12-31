package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactAsk;
import com.oemp.audi.dao.ContactAskDao;
import com.oemp.audi.service.ContactAskService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;
@Service
public class ContactAskServiceImpl extends BaseServiceImpl implements ContactAskService {
	@Autowired
	public ContactAskDao contactAskDao;
	
	public ContactAsk save(ContactAsk activityClass) {
		ContactAsk ca= contactAskDao.save(activityClass);
		return ca;
	}

	public PageTools<ContactAsk> findPages(int pageNo, int pageSize, Map<String, String> map) {
		return contactAskDao.findPages(pageNo, pageSize, map);
	}
	/**条件查询*/
	public List<ContactAsk> findByScreen(Map<String, String> map){
		return contactAskDao.findByScreen(map);
	}
}
