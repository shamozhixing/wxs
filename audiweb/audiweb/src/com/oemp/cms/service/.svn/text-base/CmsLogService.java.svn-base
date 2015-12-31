package com.oemp.cms.service;

import com.oemp.cms.bean.CmsLog;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseService;

public interface CmsLogService extends BaseService {

	/**优化查询 无条件*/
	public PageTools<CmsLog> query(int pageNo, int pageSize);
	
	/**优化查询 有条件*/
	public PageTools<CmsLog> findByHql(final int pageNo, final int pageSize, final String hql,String orderBy);
	
	public CmsLog add(CmsLog cmsLog);

	public boolean modify(CmsLog cmsLog);

	public boolean del(Integer cmlId);
	
}
