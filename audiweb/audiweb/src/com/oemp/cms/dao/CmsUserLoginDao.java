package com.oemp.cms.dao;

import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsUserLogin;
import com.oemp.frame.hibernate.BaseDao;

public interface CmsUserLoginDao extends BaseDao<CmsUserLogin>{
	//根据用户id查询信息
	public List<CmsUserLogin> SelectUserByMap(Map<String,String> optionMap);
	//根据时间查询信息
	public List<CmsUserLogin> SelectUserByTime(int cmuId,String startTime,String endTime);
}
