package com.oemp.cms.dao;

import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsRolePrivi;
import com.oemp.frame.hibernate.BaseDao;

public interface CmsRolePriviDao extends BaseDao<CmsRolePrivi>{
	//根据条件筛选查询数据
	public List<CmsRolePrivi> getListByScreen(Map<String,String> screenMap);
	/**查询是否已经存在数据*/
	 public Boolean isExistsObj(String crpCmroName,String crpCmpId);
	 /**批量删除*/
	 public boolean deleteByCrpCmroName(String crpCmroName);
}
