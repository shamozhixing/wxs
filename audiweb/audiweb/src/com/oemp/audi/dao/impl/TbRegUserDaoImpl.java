package com.oemp.audi.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.dao.TbRegUserDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

@Repository
public class TbRegUserDaoImpl extends BaseDaoImpl<TbRegUser> implements TbRegUserDao {

	/**
	 * @see com.oemp.audi.dao.TbRegUserDao#findByHql(int, int, java.util.Map)
	 */
	public PageTools<TbRegUser> findByHql(int page, int limit,Map<String, String> screenMap) {
		StringBuffer hql = new StringBuffer();
		hql.append("from com.oemp.audi.bean.TbRegUser where 1=1 ");
		String email=screenMap.get("email");
		String userName=screenMap.get("username");
		String status=screenMap.get("status");
		if(!CmsUtils.isEmpty(email)){
			hql.append(" and email like '%" +CmsUtils.SqlReplace(email) + "%'");
		}
		if(!CmsUtils.isEmpty(userName)){
			hql.append(" and username like '%" + CmsUtils.SqlReplace(userName) + "%'");
		}
		
		if(!CmsUtils.isEmpty(status)){
			hql.append(" and availabilityflag like '%" + CmsUtils.SqlReplace(status) + "%'");
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			hql.append(" and regtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and regtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ");
		}
		
		StringBuffer orderBy = new StringBuffer();
		orderBy.append(" order by regtime desc,emailsubtime desc");
		return findByHql(page, limit, hql.toString(),orderBy.toString());
	}
	
	/**查询导出用户*/
	public List<TbRegUser> findByScreen(Map<String, String> screenMap){
		StringBuffer hql = new StringBuffer();
		hql.append("from com.oemp.audi.bean.TbRegUser where 1=1 ");
		String email=screenMap.get("email");
		String userName=screenMap.get("username");
		String status=screenMap.get("status");
		if(!CmsUtils.isEmpty(email)){
			hql.append(" and email like '%" +CmsUtils.SqlReplace(email) + "%'");
		}
		if(!CmsUtils.isEmpty(userName)){
			hql.append(" and username like '%" + CmsUtils.SqlReplace(userName) + "%'");
		}
		
		if(!CmsUtils.isEmpty(status)){
			hql.append(" and availabilityflag like '%" + CmsUtils.SqlReplace(status) + "%'");
		}
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			hql.append(" and regtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and regtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ");
		}
		
		StringBuffer orderBy = new StringBuffer();
		orderBy.append(" order by regtime desc,emailsubtime desc");
		return find(hql.toString());
	}
	@SuppressWarnings("unchecked")
	public boolean IsExitRegUser(String email) {
		try{
			List list = super.find("from  com.oemp.audi.bean.TbRegUser  where Upper(email)=Upper('"+email+"')");
			if(list.size()>0){
				return true;
			}
			else{
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
	}

	public TbRegUser findByID(long id) {
		TbRegUser user = null;
		try{
			List list = super.find("from  com.oemp.audi.bean.TbRegUser  where userid="+id);
			if(list.size()>0){
				user= (TbRegUser)list.get(0);
			}			
		}catch(Exception e){
			e.printStackTrace();			
		}
		return user;
	}

	public boolean updateUser(TbRegUser user) {
		try{
			super.update(user);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public String getUserid(String name) {
		String idstr="";
		try{
			String sql=" from com.oemp.audi.bean.TbRegUser where  username like '%"+name+"%'";
			List list = super.find(sql);
		  for(int i=0;i<list.size();i++){
			  idstr+=((TbRegUser)list.get(i)).getUserid()+",";
		  }
		  if(idstr!=""){
			  idstr = idstr.substring(0,idstr.lastIndexOf(","));
		  }
		}catch(Exception e){
			e.printStackTrace();
		}
		return idstr;
	}

	public TbRegUser isPassword(String email, String password) {
		TbRegUser user = null;
		//String sql="from TbRegUser where  email='"+email.trim()+"' and password='"+password+"'";
		String sql="from com.oemp.audi.bean.TbRegUser where  Upper(email)=Upper('"+email.trim()+"') and password='"+password+"'";
		try{
			List list = super.find(sql);
			if(list.size()>0){
				user = (TbRegUser)list.get(0);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		
		}
		return user;
		
	}

	public TbRegUser getPassword(String name, String email) {
		TbRegUser user = null;
		String sql="from com.oemp.audi.bean.TbRegUser where  Upper(email)=Upper('"+email.trim()+"') and Upper(username)=Upper('"+name+"')";
		try{
			List list = super.find(sql);
			if(list.size()>0){
				user = (TbRegUser)list.get(0);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		
		}
		return user;
	}
	
}
