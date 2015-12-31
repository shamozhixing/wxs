package com.oemp.cms.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.frame.action.BaseAction;


/**
 * 菜单树
 * 
 * @author yzj
 * 
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.action.CmsLeftTreeAction")
public class CmsLeftTreeAction extends BaseAction {
	private String cmpId;
	@Autowired
	protected ServiceDispatcher serviceDispatcher;

	//获取站点树
	public void getSiteTreeByCmpId(){
		String treeJsonTree=serviceDispatcher.getCmsPageService().getPageByCmpId(cmpId,Integer.parseInt(getSessionValue("siteId").toString()));
		this.renderJson(treeJsonTree);
	}

	// 获取系统树
	public void getSysTreeByCmmId() {
		String treeJsonTree = serviceDispatcher.getCmsMenuService()
				.getTreeJsonByCmmId(cmpId);
		this.renderJson(treeJsonTree);
	}

	// 获取所有的菜单信息
	public void getAllTreeNodes() {
		String treeJsonTree = serviceDispatcher.getCmsMenuService()
				.getAllTreeNodes();
		this.renderJson(treeJsonTree);
	}

	public String getCmpId() {
		return cmpId;
	}

	public void setCmpId(String cmpId) {
		this.cmpId = cmpId;
	}
}
