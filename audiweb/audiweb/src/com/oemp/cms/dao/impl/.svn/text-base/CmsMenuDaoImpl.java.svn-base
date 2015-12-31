package com.oemp.cms.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.oemp.cms.bean.CmsMenu;
import com.oemp.cms.dao.CmsMenuDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
@Repository
public class CmsMenuDaoImpl extends BaseDaoImpl<CmsMenu>  implements CmsMenuDao{
	//系统栏目菜单
	public List<CmsMenu> getSysMrgPageList(String cmmId) {
		String hql = "from CmsMenu t where 1=1 and t.cmmParentId = ? order by t.cmmParentId,t.cmmOrderNum,t.cmmName";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, Integer.parseInt(cmmId));
		return query.list();
	}
	
	//系统栏目菜单,全部信息
	public List<CmsMenu> getAllMenu() {
		String hql = "from CmsMenu t where 1=1 order by t.cmmParentId,t.cmmOrderNum,t.cmmName";
		Query query=getSession().createQuery(hql);
		return query.list();
	}
}
