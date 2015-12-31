package com.oemp.cms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.bean.CmsUserLogin;
import com.oemp.cms.dao.CmsUserDao;
import com.oemp.cms.dao.CmsUserLoginDao;
import com.oemp.cms.service.CmsUserLoginService;
import com.oemp.frame.service.BaseServiceImpl;

@Service
public class CmsUserLoginServiceImpl extends BaseServiceImpl implements CmsUserLoginService{
	@Autowired
	protected CmsUserLoginDao cmsUserLoginDao;
	public CmsUserLogin add(CmsUserLogin cmsUserLogin) {
		CmsUserLogin cmsUserlogin=cmsUserLoginDao.save(cmsUserLogin);
		return cmsUserlogin;
	}

	public boolean del(int culId) {
		cmsUserLoginDao.deleteById(culId);
		return true;
	}

	public boolean modify(CmsUserLogin cmsUserLogin) {
		return false;
	}

	public List<CmsUserLogin> query(CmsUserLogin cmsUserLogin) {
		return cmsUserLoginDao.findAll();
	}
//根据用户名对应id查询信息
	public List<CmsUserLogin> findByMap(Map<String,String> optionMap) {
		return cmsUserLoginDao.SelectUserByMap(optionMap);
	}

	public List<CmsUserLogin> findByTime(int cmuId,String startTime,String endTime) {
		return cmsUserLoginDao.SelectUserByTime(cmuId,startTime,endTime);
	}

}
