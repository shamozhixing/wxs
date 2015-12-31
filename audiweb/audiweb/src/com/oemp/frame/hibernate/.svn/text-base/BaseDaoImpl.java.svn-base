package com.oemp.frame.hibernate;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Example.PropertySelector;
import org.hibernate.impl.CriteriaImpl;
import org.hibernate.transform.ResultTransformer;
import org.hibernate.type.Type;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import com.oemp.frame.exception.CmsExceptionUtil;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsBeanUtils;

/**
 * DAO基类
 * 
 * CURD *
 * 
 * @param <T>
 */
@Repository
public abstract class BaseDaoImpl<T> implements BaseDao<T> {
	protected Logger log = LoggerFactory.getLogger(getClass());

	private Class<T> persistentClass;

	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	public T save(T entity) {
		Assert.notNull(entity);
		this.getSession().save(entity);
		return entity;
	}

	public Object update(Object entity) {
		Assert.notNull(entity);
		getSession().update(entity);
		return entity;
	}

	public Object saveOrUpdate(Object entity) {
		Assert.notNull(entity);
		getSession().saveOrUpdate(entity);
		return entity;
	}

	public Object merge(Object entity) {
		Assert.notNull(entity);
		return getSession().merge(entity);
	}

	public void delete(Object entity) {
		Assert.notNull(entity);
		getSession().delete(entity);
	}

	public T deleteById(Serializable id) {
		Assert.notNull(id);
		T entity = load(id);
		getSession().delete(entity);
		return entity;
	}

	public T load(Serializable id) {
		Assert.notNull(id);
		return load(id, false);
	}

	@SuppressWarnings("unchecked")
	public T get(Serializable id) {
		Assert.notNull(id);
		return (T) getSession().get(getPersistentClass(), id);
	}

	@SuppressWarnings("unchecked")
	public T load(Serializable id, boolean lock) {
		Assert.notNull(id);
		T entity = null;
		if (lock) {
			entity = (T) getSession().load(getPersistentClass(), id,
					LockMode.UPGRADE);
		} else {
			entity = (T) getSession().load(getPersistentClass(), id);
		}
		return entity;
	}

	
	
	/*
	 * 查询
	 */

	public List<T> findAll() {
		return findByCriteria();
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(OrderBy... orders) {
		Criteria crit = createCriteria();
		if (orders != null) {
			for (OrderBy order : orders) {
				crit.addOrder(order.getOrder());
			}
		}
		return crit.list();
	}

	public PageTools<T> findAll(int pageNo, int pageSize, OrderBy... orders) {
		Criteria crit = createCriteria();
		return findByCriteria(crit, pageNo, pageSize, null, OrderBy
				.asOrders(orders));
	}

	/**
	 * 按HQL查询对象列表.
	 * 
	 * @param hql
	 *            hql语句
	 * @param values
	 *            数量可变的参数
	 */
	@SuppressWarnings("unchecked")
	protected List find(String hql, Object... values) {
		return createQuery(hql, values).list();
	}

	/**
	 * 按HQL查询唯一对象.
	 */
	protected Object findUnique(String hql, Object... values) {
		return createQuery(hql, values).uniqueResult();
	}

	/**
	 * 按属性查找对象列表.
	 */
	@SuppressWarnings("unchecked")
	public List<T> findByProperty(String propertyName, Object value) {
		Assert.hasText(propertyName);
		return createCriteria(Restrictions.eq(propertyName, value)).list();
	}

	/**
	 * 根据查询函数与参数列表创建Query对象,后续可进行更多处理,辅助函数.
	 */
	protected Query createQuery(String queryString, Object... values) {
		Assert.hasText(queryString);
		Query queryObject = getSession().createQuery(queryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				queryObject.setParameter(i, values[i]);
			}
		}
		// 查询缓存
		queryObject.setCacheable(true);
		return queryObject;
	}

	/**
	 * 按Criterion查询对象列表.
	 * 
	 * @param criterion
	 *            数量可变的Criterion.
	 */
	@SuppressWarnings("unchecked")
	protected List<T> findByCriteria(Criterion... criterion) {
		return createCriteria(criterion).list();
	}

	@SuppressWarnings("unchecked")
	protected PageTools<T> findByCriteria(Criteria crit, int pageNo,
			int pageSize, Projection projection, Order... orders) {
		//查询缓存
		crit.setCacheable(true);
		
		int totalCount = ((Number) crit.setProjection(Projections.rowCount())
				.uniqueResult()).intValue();
		PageTools<T> p = new PageTools<T>(pageNo, pageSize, totalCount);
		if (totalCount < 1) {
			p.setList(new ArrayList<T>());
			return p;
		}
		crit.setProjection(projection);
		if (projection == null) {
			crit.setResultTransformer(Criteria.ROOT_ENTITY);
		}
		if (orders != null) {
			for (Order order : orders) {
				if (order != null)
					crit.addOrder(order);
			}
		}
		crit.setFirstResult(p.getFirstResult());
		crit.setMaxResults(p.getPageSize());
		p.setList(crit.list());
		return p;
	}

	/** 带有查询条件的查询优化 */
	@SuppressWarnings("unchecked")
	public PageTools findByHql(final int pageNo, final int pageSize,final String hql) {
		/*
		 *  获取总记录
		 */
		Query queryTotalCount = getSession().createQuery("select count(*)" + hql);
		queryTotalCount.setCacheable(true);//查询缓存
		List getCountList=queryTotalCount.list();
		int totalCount = Integer.parseInt(getCountList.get(0).toString());
		PageTools p = new PageTools(pageNo, pageSize, totalCount);

		// 建立查询语句
		Query query = getSession().createQuery(hql);
		// 游标指向当前页第一条记录
		query.setFirstResult(p.getFirstResult());
		// 游标指向当前页最后一条记录
		query.setMaxResults(p.getPageSize());
		// 查询缓存
		query.setCacheable(true);
		// 获取当前页记录
		List list = query.list();
		if (list == null) {
			p.setList(new ArrayList());
		} else {
			p.setList(list);
		}

		return p;

	}

	/** 带有查询条件的查询优化 */
	@SuppressWarnings("unchecked")
	public PageTools findByHql(final int pageNo, final int pageSize,final String hql, final String orderBy) {
		// 获取总记录
		Query queryTotalCount = getSession().createQuery("select count(*)" + hql);
		queryTotalCount.setCacheable(true);//查询缓存
		List getCountList=queryTotalCount.list();
		int totalCount = Integer.parseInt(getCountList.get(0).toString());
		PageTools p = new PageTools(pageNo, pageSize, totalCount);

		// 建立查询语句
		Query query = getSession().createQuery(hql + orderBy);
		// 游标指向当前页第一条记录
		query.setFirstResult(p.getFirstResult());
		// 游标指向当前页最后一条记录
		query.setMaxResults(p.getPageSize());
		// 查询缓存
		query.setCacheable(true);
		// 获取当前页记录
		List list = query.list();
		if (list == null) {
			p.setList(new ArrayList());
		} else {
			p.setList(list);
		}

		return p;

	}

	
	/** 带有查询条件的查询优化 */
	@SuppressWarnings("unchecked")
	public PageTools findBySql(final int pageNo, final int pageSize,final String sql, final String orderBy) {
		// 获取总记录
		Query queryTotalCount = getSession().createSQLQuery("select count(*) as totals from (" + sql+")");
		List getCountList=queryTotalCount.list();
		int totalCount = Integer.parseInt(getCountList.get(0).toString());
		PageTools p = new PageTools(pageNo, pageSize, totalCount);

		// 建立查询语句
		Query query = getSession().createSQLQuery(sql + orderBy);
		// 游标指向当前页第一条记录
		query.setFirstResult(p.getFirstResult());
		// 游标指向当前页最后一条记录
		query.setMaxResults(p.getPageSize());
		// 获取当前页记录
		List list = query.list();
		if (list == null) {
			p.setList(new ArrayList());
		} else {
			p.setList(list);
		}

		return p;

	}

	/**
	 * 通过count查询获得本次查询所能获得的对象总数.
	 * 
	 * @return page对象中的totalCount属性将赋值.
	 */
	@SuppressWarnings("unchecked")
	protected int countQueryResult(Criteria c) {
		CriteriaImpl impl = (CriteriaImpl) c;
		// 先把Projection、ResultTransformer、OrderBy取出来,清空三者后再执行Count操作
		Projection projection = impl.getProjection();
		ResultTransformer transformer = impl.getResultTransformer();
		List<CriteriaImpl.OrderEntry> orderEntries = null;
		try {
			orderEntries = (List) CmsBeanUtils.getFieldValue(impl,
					"orderEntries");
			CmsBeanUtils.setFieldValue(impl, "orderEntries", new ArrayList());
		} catch (Exception e) {
			log.error("不可能抛出的异常:{}", e.getMessage());
		}
		// 查询缓存
		c.setCacheable(true);
		// 执行Count查询
		int totalCount = (Integer) c.setProjection(Projections.rowCount())
				.uniqueResult();
		if (totalCount < 1) {
			return 0;
		}
		// 将之前的Projection和OrderBy条件重新设回去
		c.setProjection(projection);
		if (projection == null) {
			c.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
		}
		if (transformer != null) {
			c.setResultTransformer(transformer);
		}
		try {
			CmsBeanUtils.setFieldValue(impl, "orderEntries", orderEntries);
		} catch (Exception e) {
			log.error("不可能抛出的异常:{}", e.getMessage());
		}
		return totalCount;
	}

	public void refresh(Object entity) {
		getSession().refresh(entity);
	}

	/**
	 * 根据Criterion条件创建Criteria,后续可进行更多处理,辅助函数.
	 */
	protected Criteria createCriteria(Criterion... criterions) {
		Criteria criteria = getSession().createCriteria(getPersistentClass());
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		// 查询缓存
		criteria.setCacheable(true);
		return criteria;
	}

	public Class<T> getPersistentClass() {
		return persistentClass;
	}

	public T createNewEntiey() {
		try {
			return getPersistentClass().newInstance();
		} catch (Exception e) {
			throw new RuntimeException("不能创建实体对象："
					+ getPersistentClass().getName());
		}
	}

	public static final NotBlankPropertySelector NOT_BLANK = new NotBlankPropertySelector();

	/**
	 * 不为空的EXAMPLE属性选择方式
	 * 
	 * @author liufang
	 * 
	 */
	static final class NotBlankPropertySelector implements PropertySelector {
		private static final long serialVersionUID = 1L;

		public boolean include(Object object, String propertyName, Type type) {
			return object != null
					&& !(object instanceof String && StringUtils
							.isBlank((String) object));
		}
	}

	public List<T> deleteById(Serializable[] ids) {
		List<T> dts = new ArrayList<T>();
		T del = null;
		if (ids != null && ids.length > 0) {
			for (Serializable id : ids) {
				del = deleteById(id);
				if (del != null) {
					dts.add(del);
				}
			}
		}
		return dts;
	}

	public T update(String id, T uobj) {
		try {

			T sobj = this.load(id);
			Method[] m = uobj.getClass().getMethods();
			for (int i = 0; i < m.length; i++) {
				Method method = m[i];
				String mname = method.getName();
				if (mname.indexOf("get") > -1 && !mname.equals("getClass")) {

					Object para = method.invoke(uobj);
					if (para != null) {
						try {
							Method sm = sobj.getClass()
									.getMethod("set" + mname.substring(3),
											para.getClass());
							sm.invoke(sobj, para);

						} catch (NoSuchMethodException ne) {

						}
					}
				}
			}
			getSession().update(sobj);
			return sobj;
		} catch (Exception e) {
			e.printStackTrace();
			throw CmsExceptionUtil
					.getSystemException("update is error! class is "
							+ this.getClass().getName(), e);
		}

	}

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	protected SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean isEmpty(String str) {
		return str == null || str.trim().equals("");
	}

	public boolean isEmpty(Object obj) {
		return obj == null;
	}

	protected Order getOrder(String orderType, String orderName) {
		Order order1;
		if (!isEmpty(orderName) && !isEmpty(orderType)
				&& orderType.toLowerCase().equals("desc")) {
			order1 = Order.desc(orderName);
		} else if (!isEmpty(orderName)) {
			order1 = Order.asc(orderName);
		} else {
			order1 = null;
		}
		return order1;
	}

	protected String getOrderHql(String orderType, String orderName) {
		String order = " order by ";
		if (!isEmpty(orderName) && !isEmpty(orderType)
				&& orderType.toLowerCase().equals("desc")) {
			order += orderName + " desc"; // Order.desc(orderName);
		} else if (!isEmpty(orderName)) {
			order += orderName + " asc ";// Order.asc(orderName);
		} else {
			order = "";
		}
		return order;
	}

	@SuppressWarnings("unchecked")
	protected List getList(final String hql, final int num) {
		// 建立查询语句
		Query query = getSession().createQuery(hql);

		if (num > 0) {
			// 游标指向当前页第一条记录
			query.setFirstResult(0);
			// 游标指向当前页最后一条记录
			query.setMaxResults(num);
		}
		// 查询缓存
		query.setCacheable(true);
		// 获取当前页记录
		List list = query.list();
		if (list == null) {
			list = new ArrayList();
		}

		return list;
	}
}
