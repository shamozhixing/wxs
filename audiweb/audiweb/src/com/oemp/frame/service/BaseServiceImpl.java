package com.oemp.frame.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class BaseServiceImpl implements BaseService {
	protected Logger log = LoggerFactory.getLogger(getClass());
	
	public Date getDate() {
		return new Date();
	}
	
	public boolean isEmpty(String str) {
		return str == null || str.trim().equals("");
	}

	public boolean isEmpty(Object obj) {
		return obj == null;
	}
	
	
		
}
