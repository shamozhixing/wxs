package com.oemp.cms.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.oemp.cms.bean.CmsPage;
import com.oemp.cms.dao.CmsPageDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.hibernate.OrderBy;
import com.oemp.frame.page.PageTools;
@Repository
public class CmsPageDaoImp extends BaseDaoImpl<CmsPage>  implements CmsPageDao{

	@SuppressWarnings("unchecked")
	public List<CmsPage> getPageListByScreen(Map<String, String> screenMap) {
		StringBuffer hql=new StringBuffer();
		hql.append("from com.poten.ele.cms.bean.CmsPage cmp where 1=1 ");
		 hql.append(" and cmp.cmpName like ?");
		 hql.append(" and cmp.cmpCmmId = ?");
		// hql.append(" and cmp.cmpAddtime like ?");
		// hql.append(" and cmp.cmpLasttime like ?");
		
		 Query query = getSession().createQuery(hql.toString());
		query.setString(0,"%"+screenMap.get("cmpName")+"%");
		query.setInteger(1,Integer.parseInt(screenMap.get("cmpCmmId")));
		//	query.setString(1,"%"+screenMap.get("startTime")+"%");
			//query.setString(2,"%"+screenMap.get("endTime")+"%");
			ArrayList<CmsPage>  list = (ArrayList<CmsPage>) query.list();
			if (list == null) {
				list = new ArrayList<CmsPage>();
			}
			return list;
	}
	/**子栏目获取*/
	public List<CmsPage> findsublist(CmsPage cmsPage) {
		String hql ="from CmsPage cmp where cmp.parentCmpId =" + cmsPage.getCmpId();
		Query query = getSession().createQuery(hql);
		ArrayList<CmsPage>  list = (ArrayList<CmsPage>) query.list();
		if (list == null) {
			list = new ArrayList<CmsPage>();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public CmsPage getCmsPageFront(Integer id) {
		String hql = "from CmsPage p inner join fetch p.cmt where p.cmpId=" + id;
		List list = this.find(hql);
		if(list.isEmpty())
			return null;
		return (CmsPage)list.get(0);
	}

	@SuppressWarnings("unchecked")
	public List<CmsPage> getList(int pid, int size, boolean iscolumn, OrderBy... orders) {
		String hql = "from CmsPage p where p.parentCmpId=" + pid + " and p.cmpIsColumn=";
		if(iscolumn){
			hql += "1";
		}else{
			hql += "0";
		}
		hql += getOrderStr(orders);
		return this.getList(hql, size);
	}
	
	private String getOrderStr(OrderBy... orderBys){
		String orderby = "";
		if(orderBys!=null&&orderBys.length>0){
			orderby = " order by ";
			for (int i = 0; i < orderBys.length; i++) {
				orderby += "p."+orderBys[i].getField() + " " + orderBys[i].getOrderType();
				if(i<orderBys.length-1){
					orderby += ",";
				}
			}
		}
		return orderby;
	}

	//根据栏目获取子页面信息
	public List<CmsPage> getPageByCmpId(String cmpId,Integer siteId) {
		String hql ="from CmsPage cmp where 1=1 and cmp.parentCmpId = ? and cmp.cmpIsColumn=1 and cmp.cmpCmmId=? order by cmp.cmpOrderNum,cmp.cmpTitleName";
		Query query=getSession().createQuery(hql);
		query.setInteger(0,Integer.parseInt(cmpId));
		query.setInteger(1,siteId);
		return query.list();
	}
	//查询信息，需要加站点信息
	public List<CmsPage> queryByCmsPage(CmsPage cmsPage){
		String hql ="from CmsPage cmp where 1=1 and cmp.parentCmpId = ? and cmp.cmpCmmId=? order by cmp.cmpOrderNum,cmp.cmpTitleName";
		Query query=getSession().createQuery(hql);
		query.setInteger(0,cmsPage.getParentCmpId());
		query.setInteger(1,cmsPage.getCmpCmmId());
		return query.list();
	}
	@SuppressWarnings("unchecked")
	public PageTools getPageList(int pid, int pageno, int pagesize, OrderBy... orderBys){
		String hql = "from CmsPage p where p.parentCmpId=" + pid + " and p.cmpIsColumn=0";
		hql += getOrderStr(orderBys);
		return findByHql(pageno, pagesize, hql);
	}
	
	@SuppressWarnings("unchecked")
	public List<CmsPage> findfindListByCmt(int cmtId) {
		String  sql ="SELECT * from CMS_PAGE  AS  cp WHERE  cp.CMP_CMT_ID='"+cmtId+"'";
		List<CmsPage>  cplist = getSession().createSQLQuery(sql).list();
		return cplist;
	}
	
	@SuppressWarnings("unchecked")
	public List<CmsPage> findColumnAll() {
		String hql = "from CmsPage p where p.cmpIsColumn=1 order by p.cmpOrderNum,p.cmpLasttime desc";
		return find(hql);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<CmsPage> getVisitList(String layerid, int size) {
		String hql = "from CmsPage p where p.cmpLayerid like '" + layerid + "%' order by p.cmpVisits desc,p.cmpLasttime desc";
		return getList(hql, size);
	}
	
}
