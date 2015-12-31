package com.oemp.audi.dao;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.page.PageTools;

public interface TbRegUserDao extends BaseDao<TbRegUser> {	
	/**
	 * 查询用户信息
	 * @param page
	 * @param limit
	 * @param screenMap
	 * @return
	 */
	PageTools<TbRegUser> findByHql(int page, int limit,Map<String, String> screenMap);
	
	/**查询导出用户*/
	List<TbRegUser> findByScreen(Map<String, String> screenMap);
	/**
	 * 是否有已经注册过此email的用户

	 * @param email
	 * @return
	 */
	boolean  IsExitRegUser(String email);
	/**
	 * 查找用户详细信息
	 * @param id
	 * @return
	 */
	TbRegUser findByID(long id);
	/**
	 * 更新用户信息
	 * @param cd
	 * @return
	 */
	boolean updateUser(TbRegUser user);
	/**
	 * 返回用户id
	 * @param name
	 * @return
	 */
	String  getUserid(String name);
	/**
	 * 验证邮件密码是否正确
	 * @param name
	 * @param password
	 * @return
	 */
	TbRegUser isPassword(String email,String password);
	/**
	 * 索取密码
	 * @param name
	 * @param email
	 * @return
	 */
	TbRegUser getPassword(String name,String email);
}
