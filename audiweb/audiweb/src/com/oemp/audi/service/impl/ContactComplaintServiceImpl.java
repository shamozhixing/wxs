package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactComplaint;
import com.oemp.audi.dao.ContactComplaintDao;
import com.oemp.audi.service.ContactComplaintService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;
@Service
public class ContactComplaintServiceImpl extends BaseServiceImpl implements
		ContactComplaintService {
	@Autowired
	protected ContactComplaintDao contactComplainntDao;
	public ContactComplaint save(ContactComplaint activityClass) {
		ContactComplaint cc=contactComplainntDao.save(activityClass);
		return cc;
	}
	
	public PageTools<ContactComplaint> findPages(int pageNo, int pageSize, Map<String, String> map) {
		return contactComplainntDao.findPages(pageNo, pageSize, map);
	}
	/**查询条件*/
	public List<ContactComplaint> findByScreen( Map<String,String> map){
		return contactComplainntDao.findByScreen(map);
	}
}
