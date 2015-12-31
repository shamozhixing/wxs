package com.oemp.cms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.oemp.cms.bean.CmsPage;
import com.oemp.cms.dao.CmsPageDao;
import com.oemp.cms.service.CmsPageService;
import com.oemp.cms.util.PagePrivlegeUtil;
import com.oemp.common.UtilTools;
import com.oemp.frame.exception.CmsExceptionUtil;
import com.oemp.frame.service.BaseServiceImpl;

@Service
public class CmsPageServiceImpl extends BaseServiceImpl implements CmsPageService{

	@Autowired
	protected  CmsPageDao  cmsPagedao;

	public CmsPage add(CmsPage cmsPage) {
		CmsPage entity = cmsPagedao.save(cmsPage);
		return entity;
	}

	public boolean del(Integer cmpId) {
		cmsPagedao.deleteById(cmpId);
		return true;
	}

	public boolean modify(CmsPage cmsPage) {
		cmsPagedao.update(cmsPage);
		return true;
	}

	public List<CmsPage> query(CmsPage cmsPage) {
		List<CmsPage> list = cmsPagedao.queryByCmsPage(cmsPage);
		return list;
	}

	/**删除栏目时候子栏目查询 判断*/
	public List<CmsPage> findsublist(CmsPage cmsPage) {
			return cmsPagedao.findsublist(cmsPage);
	}
	
	
	//通过ID进行查询
	public CmsPage get(Integer cmpId){
		return cmsPagedao.get(cmpId);
	}
	/**模糊查询*/
	public List<CmsPage> queryByScreen(Map<String, String> screenMap) {
		List<CmsPage> list =cmsPagedao.getPageListByScreen(screenMap);
		List<CmsPage> listPriv = new ArrayList<CmsPage>();
		for (CmsPage cpObj : list) {
			if(0==cpObj.getCmpIsColumn().intValue())
			{
				listPriv.add(cpObj);
			}
			else if(PagePrivlegeUtil.isPrivlege(cpObj.getCmpId(), PagePrivlegeUtil.QUERY))
			{
				listPriv.add(cpObj);
			}
		}
		return listPriv;
	}
	
	
	//获取站点下的树
	public String getPageByCmpId(String cmpId,Integer siteId) {
		List<CmsPage> cpList= cmsPagedao.getPageByCmpId(cmpId,siteId);
		//转化为tree格式
		List<Map<String, Object>> nodelist = new ArrayList<Map<String, Object>>();
		for(int i=0;i<cpList.size();i++){
			CmsPage cp = cpList.get(i);
			Map m = getSysNodeList(cp, cpList);
			if(0==cp.getParentCmpId().intValue())
			{
				if(m!=null && PagePrivlegeUtil.isPrivlege(cp.getCmpId(), PagePrivlegeUtil.QUERY))//数据权限控制
				{
					nodelist.add(m);
				}
			}
			else if(m!=null && PagePrivlegeUtil.isPrivlege(cp.getParentCmpId(), PagePrivlegeUtil.QUERY))//数据权限控制
			{
				nodelist.add(m);
			}
		}
		return UtilTools.encodeObject2Json(nodelist);
	}
	//系统栏目菜单--子集节点
	private Map<String, Object> getSysNodeList(CmsPage cp, List<CmsPage> cmList){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("cmpId", cp.getCmpId());
		m.put("pId", cp.getParentCmpId());
		m.put("text", cp.getCmpName());
		m.put("cmpCmmId", cp.getCmpCmmId());
		String url=(!"#".equals(cp.getCmpSkipUrl()) && null!=cp.getCmpSkipUrl() )?(cp.getCmpSkipUrl().indexOf("?")>-1?"&":"?")+"nodeid="+ cp.getCmpId():"";
		m.put("url", cp.getCmpSkipUrl() + url);
		if(0==cp.getCmpIsColumn().intValue()){
			m.put("leaf", "true");
		}
		return m;
	}

	public List<CmsPage> findListByCmt(int cmtId) {
		// TODO Auto-generated method stub
		return cmsPagedao.findfindListByCmt(cmtId);
	}
}
