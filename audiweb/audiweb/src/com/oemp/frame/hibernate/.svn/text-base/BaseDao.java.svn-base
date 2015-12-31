package com.oemp.frame.hibernate;

import java.io.Serializable;
import java.util.List;

import com.oemp.frame.page.PageTools;


public interface BaseDao<T> {
	/**
	 * 通过ID查找对象
	 * 
	 * @param id
	 *            记录的ID
	 * @param lock
	 *            是否锁定对象
	 * @return 实体对象
	 */
	public T load(Serializable id, boolean lock);

	public T get(Serializable id);

	/**
	 * 通过ID查找对象,不锁定对象
	 * 
	 * @param id
	 *            记录的ID
	 * @return 实体对象
	 */
	public T load(Serializable id);

	/**
	 * 查找所有对象
	 * 
	 * @return 对象列表
	 */
	public List<T> findAll();

	public List<T> findAll(OrderBy... orders);

	/**无条件 优化查询*/
	public PageTools<T> findAll(int pageNo, int pageSize, OrderBy... orders);

	/**djh 作废*/
	public PageTools<T> findByHql(final int pageNo,final int pageSize,final String hql);
	
	/**djh 带条件的查询使用该方法*/
	public PageTools<T> findByHql(final int pageNo,final int pageSize,final String hql, final String orderBy);
	public PageTools findBySql(final int pageNo, final int pageSize,final String sql, final String orderBy);
	/**
	 * 按属性查找对象列表.
	 */
	public List<T> findByProperty(String propertyName, Object value);

	/**
	 * 保存对象
	 * 
	 * @param entity
	 *            实体对象
	 * @return 实体对象
	 */
	public T save(T entity);


	/**
	 * 更新对象
	 * 
	 * @param entity
	 *            实体对象
	 * @return 实体对象
	 */
	public Object update(Object entity);

	/**
	 * 
	 */
	public T update(String id, T uobj);

	/**
	 * 保存或更新对象
	 * 
	 * @param entity
	 *            实体对象
	 * @return 实体对象
	 */
	public Object saveOrUpdate(Object entity);

	/**
	 * 保存或更新对象拷贝
	 * 
	 * @param entity
	 * @return 已更新的持久化对象
	 */
	public Object merge(Object entity);

	/**
	 * 删除对象
	 * 
	 * @param entity
	 *            实体对象
	 */
	public void delete(Object entity);

	/**
	 * 根据ID删除记录
	 * 
	 * @param id
	 *            记录ID
	 */
	public T deleteById(Serializable id);

	/**
	 * 刷新对象
	 * 
	 * @param entity
	 */
	public void refresh(Object entity);

	/**
	 * 获得实体Class
	 * 
	 * @return
	 */
	public Class<T> getPersistentClass();

	/**
	 * 创建实体类的对象
	 * 
	 * @return
	 */
	public T createNewEntiey();
    /** 删除 ids*/
	List<T> deleteById(Serializable[] ids);

	public boolean isEmpty(String str);

	public boolean isEmpty(Object obj);
	
}
