package com.oemp.frame.service;

import java.io.Serializable;

/** 增删改查实现 */
public interface CRUDService extends BaseService{
	/** 通过ID查找对象 */
	public Object get(Serializable id);
	/** 保存 */
	public Object save(Object obj);
	/** 修改 */
	public Object update(Object obj);
	/** 保存或更新 */
	public Object saveOrUpdate(Object obj);
	/** 删除该ID对象 */
	public boolean delete(Serializable id);
	/** 删除对象 */
	public boolean delete(Object obj);
}
