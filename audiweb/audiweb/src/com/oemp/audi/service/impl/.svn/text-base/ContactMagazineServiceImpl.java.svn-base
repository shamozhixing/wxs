package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactMagazine;
import com.oemp.audi.dao.ContactMagazineDao;
import com.oemp.audi.service.ContactMagazineService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;

@Service
public class ContactMagazineServiceImpl extends BaseServiceImpl implements ContactMagazineService {

	@Autowired
	private ContactMagazineDao contactMagazineDao;
	
	/**
	 * @see com.oemp.audi.service.ContactMagazineService#findPages(int, int, java.util.Map)
	 */
	public PageTools<ContactMagazine> findPages(int pageNo, int pageSize,
			Map<String, String> map) {
		return contactMagazineDao.findPages(pageNo, pageSize, map);
	}

	public ContactMagazine save(ContactMagazine contactMagazine) {
		ContactMagazine cm=new ContactMagazine();
		cm=contactMagazineDao.save(contactMagazine);
		return cm;
	}

	public List<ContactMagazine> findByScreen(Map<String, String> map) {
		return contactMagazineDao.findByScreen(map);
	}

}
