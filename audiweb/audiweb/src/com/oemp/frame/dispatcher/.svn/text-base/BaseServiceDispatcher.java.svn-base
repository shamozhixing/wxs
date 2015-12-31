package com.oemp.frame.dispatcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oemp.frame.service.CRUDService;

/**
 * 业务执行分发基类
 * @author cdy
 *
 */
@Repository
public class BaseServiceDispatcher {
	@Autowired
	protected CRUDService CRUDService;
	/** 增删改查实现 */
	public CRUDService getCRUDService(){
		return CRUDService;
	}
}
