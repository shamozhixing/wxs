package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactManual;
import com.oemp.audi.dao.ContactManualDao;
import com.oemp.audi.service.ContactManualService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;
@Service
public class ContactManualServiceImpl extends BaseServiceImpl implements ContactManualService {
	
	@Autowired
	ContactManualDao contactManualDao;
	
	/**
	 * @see com.oemp.audi.service.ContactManualService#findPages(int, int, java.util.Map)
	 */
	public PageTools<ContactManual> findPages(int pageNo, int pageSize,
			Map<String, String> map) {
		// TODO Auto-generated method stub
		return contactManualDao.findPages(pageNo, pageSize, map);
	}

	/**
	 * @see com.oemp.audi.service.ContactManualService#save(com.oemp.audi.bean.ContactManual)
	 */
	public ContactManual save(ContactManual manual) {
		
		return contactManualDao.save(manual);
	}
	public List<ContactManual> findByScreen(Map<String,String> map){
		
		return contactManualDao.findByScreen(map);
	}
}
