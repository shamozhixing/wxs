package com.oemp.cms.service;

import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsPage;
import com.oemp.frame.service.BaseService;

public interface CmsPageService extends BaseService{
//	CmsPageServiceImpl
	public List<CmsPage> query(CmsPage cmsPage);
	
	public CmsPage add(CmsPage cmsPage);
	
	public boolean modify(CmsPage cmsPage);
	
	public boolean del(Integer cmpId);
	public CmsPage get(Integer cmpId);
	/*模糊查询*/
	public List<CmsPage> queryByScreen(Map<String, String> screenMap);
	/**子栏目查询 */
	public List<CmsPage> findsublist(CmsPage cmsPage);
	
	/**获取站点下的树,siteId:站点ID*/
	public String getPageByCmpId(String cmpId,Integer siteId);
	
	/**删除时判断模板引用 lyh**/
	public List<CmsPage>  findListByCmt(int cmtId);
	
}
//CmsPage