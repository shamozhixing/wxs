package com.oemp.cms.service;

import java.util.List;

import com.oemp.cms.bean.CmsMenu;
import com.oemp.frame.service.BaseService;

public interface CmsMenuService extends BaseService{
	/**系统栏目菜单*/
	public String getTreeJsonByCmmId(String cmmId);
	/**获取所有系统栏目菜单*/
	public String getAllTreeNodes();
	/**查询列表信息*/
	public List<CmsMenu> query(CmsMenu cmsMenu);
	/**获取所有的信息*/
	public List<CmsMenu> getMenuStore();
	/**获取菜单是否已经存在*/
	public Boolean isExistsObj(String cmmName);
	/**添加菜单*/
	public CmsMenu add(CmsMenu cmsMenu);
	/**删除菜单*/
	public boolean del(Integer cmmId) ;
	/**根据Id获取信息获取*/
	public CmsMenu getMenuById(Integer cmmId);
	/**修改信息*/
	public Boolean modify(CmsMenu cmsMenu);
}
