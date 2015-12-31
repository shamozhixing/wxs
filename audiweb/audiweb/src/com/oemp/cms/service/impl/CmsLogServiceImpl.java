package com.oemp.cms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.cms.bean.CmsLog;
import com.oemp.cms.dao.CmsLogDao;
import com.oemp.cms.service.CmsLogService;
import com.oemp.frame.hibernate.OrderBy;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;
import com.oemp.frame.util.ApplicationResources;
import com.thtf.core.common.util.Configuration;

@Service
public class CmsLogServiceImpl extends BaseServiceImpl implements CmsLogService {
	@Autowired
	protected CmsLogDao cmsLogDao;
	final static boolean flag = new Boolean(ApplicationResources.getText("log.flag")).booleanValue();
	public CmsLog add(CmsLog cmsLog) {
		/*读取配置文件中的标记 为true时，保存；否则不保存*/
		Configuration config= Configuration.getInstance("/oempCms.properties");
		CmsLog cmslog = null;
		//日志开关
		if(flag)
		{
			cmslog = cmsLogDao.save(cmsLog);
		}
		return cmslog;
	}

	public boolean del(Integer cmlId) {
		cmsLogDao.deleteById(cmlId);
		return true;
	}

	public boolean modify(CmsLog cmsLog) {
		cmsLogDao.update(cmsLog);
		return true;		
	}

//	public List<CmsLog> query(CmsLog cmsLog) {
//		System.out.println(cmsLog.getCmlFunction());
//		if(isEmpty(cmsLog.getCmlFunction())){
//			return cmsLogDao.findAll();
//		}
//		return cmsLogDao.findByProperty("cmlFunction", cmsLog.getCmlFunction());
//	}
	
	/**查询结果，按时间的倒序排序*/
	public PageTools<CmsLog> query(int pageNo, int pageSize) {
		OrderBy o = OrderBy.desc("cmlTime");
		return cmsLogDao.findAll(pageNo, pageSize, o);
	}
	
	/**优化查询 有条件*/
	public PageTools<CmsLog> findByHql(final int pageNo,final int pageSize,final String hql,String orderBy) {
		return cmsLogDao.findByHql(pageNo, pageSize, hql,orderBy);
	}
	
}
