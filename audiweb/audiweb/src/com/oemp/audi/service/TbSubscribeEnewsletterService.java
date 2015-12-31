package com.oemp.audi.service;

import java.util.Map;

import com.oemp.audi.bean.ContactManual;
import com.oemp.audi.bean.TbSubscribeEnewsletter;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

public interface TbSubscribeEnewsletterService extends BaseService {
	/**
	 * 是否已经订阅
	 * 
	 */
public TbSubscribeEnewsletter findbyUserId(long userid);
/**
 * 保存
 * 
 */
public TbSubscribeEnewsletter save(TbSubscribeEnewsletter manual);
/**
 * 修改
 * 
 */
public Boolean updateNews(TbSubscribeEnewsletter manual);
/**
 * email是否存在
 * email
 */
public boolean isEmail(String manual);
/**
 * email查询对象
 * email
 */
public TbSubscribeEnewsletter EnewsByEmail(String manual);
}
