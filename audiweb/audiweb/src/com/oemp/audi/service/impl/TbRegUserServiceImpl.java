package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.dao.TbRegUserDao;
import com.oemp.audi.service.TbRegUserService;
import com.oemp.frame.page.PageTools;

/**
 * 官网用户实现类
 * 
 * @author c
 * 
 */
@Service
public class TbRegUserServiceImpl implements TbRegUserService {
	@Autowired
	protected TbRegUserDao tbRegUserDao;
	static Logger log=LoggerFactory.getLogger(TbRegUserServiceImpl.class);
	/**
	 * @see com.oemp.audi.service.TbRegUserService#findByHql(int, int, java.util.Map)
	 */
	public PageTools<TbRegUser> findByHql(int page, int limit,Map<String, String> screenMap) {
		return tbRegUserDao.findByHql(page, limit, screenMap);
	}
	/**查询导出用户*/
	public List<TbRegUser> findByScreen(Map<String, String> screenMap){
		return tbRegUserDao.findByScreen(screenMap);
	}
	/**
	 * @see com.oemp.audi.service.TbRegUserService#modify(com.oemp.audi.bean.TbRegUser)
	 */
	public boolean modify(TbRegUser bean) {
		try {
			Object obj=tbRegUserDao.update(bean);
			return obj!=null;
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return false;
	}

	/**
	 * @see com.oemp.audi.service.TbRegUserService#getUserById(java.lang.Long)
	 */
	public TbRegUser getUserById(Long userid){
		return tbRegUserDao.get(userid);
	}

	/**
	 * @see com.oemp.audi.service.TbRegUserService#IsExitRegUser(java.lang.String)
	 */
	public boolean IsExitRegUser(String email) {
		
		return tbRegUserDao.IsExitRegUser(email);
	}

	/**
	 * @see com.oemp.audi.service.TbRegUserService#findByID(long)
	 */
	public TbRegUser findByID(long id) {
		
		return tbRegUserDao.findByID(id);
	}

	/**
	 * @see com.oemp.audi.service.TbRegUserService#getPassword(java.lang.String, java.lang.String)
	 */
	public TbRegUser getPassword(String name, String email) {
		
		return tbRegUserDao.getPassword(name, email);
	}

	/**
	 * @see com.oemp.audi.service.TbRegUserService#getUserid(java.lang.String)
	 */
	public String getUserid(String name) {
		
		return tbRegUserDao.getUserid(name);
	}

	/**
	 * @see com.oemp.audi.service.TbRegUserService#isPassword(java.lang.String, java.lang.String)
	 */
	public TbRegUser isPassword(String email, String password) {
		
		return tbRegUserDao.isPassword(email, password);
	}

	/**
	 * @see com.oemp.audi.service.TbRegUserService#updateUser(com.oemp.audi.bean.TbRegUser)
	 */
	public boolean updateUser(TbRegUser user) {
		
		return tbRegUserDao.updateUser(user);
	}

	/**
	 * @see com.oemp.audi.service.TbRegUserService#save(com.oemp.audi.bean.TbRegUser)
	 */
	public boolean save(TbRegUser user) {
		try{
			tbRegUserDao.save(user);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see com.oemp.audi.service.TbRegUserService#getUserByEmail(java.lang.String)
	 */
	public TbRegUser getUserByEmail(String email) {
		List<TbRegUser> dbUsers=tbRegUserDao.findByProperty("email", email);
		if(dbUsers.isEmpty()){
			return null;
		}
		return dbUsers.get(0);
	}
	
	
	
	
		
}
