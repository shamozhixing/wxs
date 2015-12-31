package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactProductbook;
import com.oemp.audi.dao.ContactProductbookDao;
import com.oemp.audi.service.ContactProductbookService;
import com.oemp.frame.page.PageTools;

/**
 * 产品手册信息实现类
 * 
 * @author c
 * 
 */
@Service
public class ContactProductbookServiceImpl implements ContactProductbookService {
	@Autowired
	protected ContactProductbookDao contactProductbookDao;
	static Logger log=LoggerFactory.getLogger(ContactProductbookServiceImpl.class);
	
	public PageTools<ContactProductbook> findByHql(int page, int limit,Map<String, String> screenMap) {
		return contactProductbookDao.findByHql(page, limit, screenMap);
	}

	public boolean saveOrUpdate(ContactProductbook bean) {
		try {
			Object obj=contactProductbookDao.saveOrUpdate(bean);
			return obj!=null;
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return false;
	}

	/**
	 * @see com.oemp.audi.service.ContactProductbookService#getById(java.lang.Integer)
	 */
	public ContactProductbook getById(Integer cpId) {
		return contactProductbookDao.get(cpId);
	}

	/**
	 * @see com.oemp.audi.service.ContactProductbookService#getByCpType(java.lang.Integer)
	 */
	public List<ContactProductbook> getByCpType(Integer cpType) {
		return contactProductbookDao.getByCpType(cpType);
	}

	
	
	
	
		
}
