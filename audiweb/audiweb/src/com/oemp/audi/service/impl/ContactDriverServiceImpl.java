package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactDriver;
import com.oemp.audi.dao.ContactDriverDao;
import com.oemp.audi.service.ContactDriverService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;
@Service
public class ContactDriverServiceImpl extends BaseServiceImpl implements ContactDriverService {
	
	@Autowired
	protected ContactDriverDao cdDao;
	
	/**
	 * @see com.oemp.audi.service.ContactDriverService#findPages(int, int, java.util.Map)
	 */
	public PageTools<ContactDriver> findPages(int pageNo, int pageSize,
			Map<String, String> map) {

		
		return cdDao.findPages(pageNo, pageSize, map);
	}

	public ContactDriver save(ContactDriver contactDriver) {
		ContactDriver cd=new ContactDriver();
		cd =cdDao.save(contactDriver);
		return cd;
	}
	/**根据条件查询*/
	public List<ContactDriver> findByScreen(Map<String,String> map){
		return cdDao.findByScreen(map);
	}
	
}
