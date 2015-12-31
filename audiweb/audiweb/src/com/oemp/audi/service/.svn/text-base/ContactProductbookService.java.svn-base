package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.ContactProductbook;
import com.oemp.frame.page.PageTools;


/**
 * 产品手册service
 * 
 * @author c
 * 
 */
public interface ContactProductbookService {
	
	/** 根据条件检索产品手册信息 */
	PageTools<ContactProductbook> findByHql(final int page, final int limit,Map<String, String> screenMap);
	
	/**
	 * 修改信息
	 * @param bean
	 * @return
	 */
	boolean saveOrUpdate(ContactProductbook bean);
	
	/**
	 * 获取对象
	 * @param cpId
	 * @return
	 */
	ContactProductbook getById(Integer cpId);
	
	/**
	 * 根绝cpTypeId获取产品手册信息
	 * @param cpType
	 * @return
	 */
	List<ContactProductbook> getByCpType(Integer cpType);
	
}
