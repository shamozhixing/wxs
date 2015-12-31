package com.oemp.frame.service;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.frame.hibernate.CRUDDaoImpl;

@Service
public class CRUDServiceImpl extends BaseServiceImpl implements CRUDService{
	@Autowired
	protected CRUDDaoImpl CRUDDao;
	
	public boolean delete(Serializable id) {
		if(CRUDDao.deleteById(id)==null)
			return false;
		return true;
	}

	public boolean delete(Object obj) {
		CRUDDao.delete(obj);
		return true;
	}

	public Object get(Serializable id) {
		
		return CRUDDao.get(id);
	}

	public Object save(Object obj) {
		
		return CRUDDao.save(obj);
	}

	public Object update(Object obj) {
		
		return CRUDDao.update(obj);
	}

	public Object saveOrUpdate(Object obj) {
		
		return CRUDDao.saveOrUpdate(obj);
	}

}
