package com.oemp.audi.service;

import java.util.List;
import java.util.Map;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.frame.page.PageTools;


/**
 * 官网用户service
 * 
 * @author c
 * 
 */
public interface TbRegUserService {
	
	/** 根据条件检索会员信息 */
	PageTools<TbRegUser> findByHql(final int page, final int limit,Map<String, String> screenMap);
	
	/**查询导出用户*/
	List<TbRegUser> findByScreen(Map<String, String> screenMap);
	/**
	 * 修改信息
	 * @param bean
	 * @return
	 */
	boolean modify(TbRegUser bean);
	
	/**
	 * 获取user
	 * @param userid
	 * @return
	 */
	TbRegUser getUserById(Long userid);
	/**
	 * 是否有已经注册过此email的用户

	 * @param email
	 * @return
	 */
	boolean  IsExitRegUser(String email);
	
	TbRegUser  getUserByEmail(String email);
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
	 * 注册新用户
	 * @param cd
	 * @return
	 */
	boolean save(TbRegUser user);
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
