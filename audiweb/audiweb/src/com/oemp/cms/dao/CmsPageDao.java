package com.oemp.cms.dao;

import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsPage;
import com.oemp.frame.hibernate.BaseDao;
import com.oemp.frame.hibernate.OrderBy;
import com.oemp.frame.page.PageTools;

public interface CmsPageDao extends BaseDao<CmsPage>{

	List<CmsPage> getPageListByScreen(Map<String, String> screenMap);

	List<CmsPage> findsublist(CmsPage cmsPage);
	
	public CmsPage getCmsPageFront(Integer id);
	
	public List<CmsPage> getList(int pid, int size, boolean iscolumn, OrderBy... orders);
	/**获取该站点下的子页面信息，siteid：站点ID*/
	public List<CmsPage> getPageByCmpId(String cmpId,Integer siteId);
	/**查询信息，需要加站点信息*/
	public List<CmsPage> queryByCmsPage(CmsPage cmsPage);
	/** 网页分页列表 */
	@SuppressWarnings("unchecked")
	public PageTools getPageList(int pid, int pageno, int pagesize, OrderBy... orderBys);
	/**获取某个模板下的内容**/
	List<CmsPage> findfindListByCmt(int cmtId);
	
	List<CmsPage> findColumnAll();
	
	public List<CmsPage> getVisitList(String layerid, int size);
}
