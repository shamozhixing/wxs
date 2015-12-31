package com.oemp.cms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.cms.bean.CmsMenu;
import com.oemp.cms.dao.CmsMenuDao;
import com.oemp.cms.service.CmsMenuService;
import com.oemp.cms.util.PrivlegeUtil;
import com.oemp.common.UtilTools;
import com.oemp.frame.service.BaseServiceImpl;

@Service
public class CmsMenuServiceImpl extends BaseServiceImpl implements CmsMenuService{
	
	@Autowired
	protected CmsMenuDao cmsMenuDao;

	//系统栏目菜单根据父ID
	public String getTreeJsonByCmmId(String cmmId) {
		List<CmsMenu> cmList=cmsMenuDao.getSysMrgPageList(cmmId);
		//转化为tree格式
		List<Map<String, Object>> nodelist = new ArrayList<Map<String, Object>>();
		
		for(int i=0;i<cmList.size();i++){
			CmsMenu cm = cmList.get(i);
			Map m = getSysNodeList(cm, cmList);
			if(m!=null && PrivlegeUtil.isPrivlege(cm.getCmmId(), PrivlegeUtil.QUERY)) nodelist.add(m);
		}
		return UtilTools.encodeObject2Json(nodelist);
	}
	//获取子集合
	private List<CmsMenu> getChildsList(Integer cmmId){
		return cmsMenuDao.findByProperty("cmmParentId",cmmId);
	}
	
	//系统栏目菜单--子集节点
	private Map<String, Object> getSysNodeList(CmsMenu cmm, List<CmsMenu> cmList){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("cmpId", cmm.getCmmId());
		m.put("pId", cmm.getCmmParentId());
		m.put("text", cmm.getCmmName());
		String url=(!"#".equals(cmm.getCmmAdminUrl()) && null!=cmm.getCmmAdminUrl() )?(cmm.getCmmAdminUrl().indexOf("?")>-1?"&":"?")+"nodeid="+ cmm.getCmmId():"";
		m.put("url", cmm.getCmmAdminUrl() + url);
		m.put("icon", cmm.getCmmIcon()==null||cmm.getCmmIcon().equals("")?"workplace/image/icon/xitong.png":cmm.getCmmIcon());
		List<CmsMenu> childrenlist = getChildsList(cmm.getCmmId());
		if(childrenlist.isEmpty()){
			m.put("leaf", "true");
			if(!PrivlegeUtil.isPrivlege(cmm.getCmmId(), PrivlegeUtil.QUERY)){//是否有权限
				return null;
			}
		}
		return m;
	}
	//获取系统栏目菜单
	public String getAllTreeNodes() {
			List<CmsMenu> datalist = cmsMenuDao.getAllMenu();
			List<CmsMenu> onelist = getChildrenList(datalist, 0);
			List<Map> nodelist = new ArrayList<Map>();
			for(int i=0;i<onelist.size();i++){
				CmsMenu cmm = datalist.get(i);
				Map m = getNodeList(cmm, datalist);
				if(m!=null) nodelist.add(m);
			}
			return UtilTools.encodeObject2Json(nodelist);
		}
	//获取子集合
	private List<CmsMenu> getChildrenList(List<CmsMenu> datalist, Integer pid){
		List<CmsMenu> rlist = new ArrayList<CmsMenu>();
		boolean start = true;
		boolean findstart = false;
		for(int i=0;i<datalist.size();i++){
			CmsMenu cmm = datalist.get(i);
			if(cmm.getCmmParentId().intValue() == pid.intValue()){
				findstart = true;
				rlist.add(cmm);
			}else{
				if(findstart && !start){
					break;
				}
				if(findstart){
					start = false;
				}
			}
		}
		return rlist;
	}
	//获取nodeList
	private Map getNodeList(CmsMenu cmm, List<CmsMenu> datalist){
		Map m = new HashMap();
		m.put("cmpId", cmm.getCmmId());
		m.put("text", cmm.getCmmName());
		String url=(!"#".equals(cmm.getCmmAdminUrl()) && null!=cmm.getCmmAdminUrl() )?(cmm.getCmmAdminUrl().indexOf("?")>-1?"&":"?")+"nodeid="+ cmm.getCmmId():"";
		m.put("url", cmm.getCmmAdminUrl() + url);
		m.put("icon", cmm.getCmmIcon()==null||cmm.getCmmIcon().equals("")?"workplace/image/icon/xitong.png":cmm.getCmmIcon());
		List<CmsMenu> childrenlist = getChildrenList(datalist, cmm.getCmmId());
		if(childrenlist.isEmpty()){
			m.put("leaf", "true");
			if(!PrivlegeUtil.isPrivlege(cmm.getCmmId(), PrivlegeUtil.QUERY)){//是否有权限
				return null;
			}
		}else{
			List<Map> nodelist = new ArrayList<Map>();
			for(int i=0;i<childrenlist.size();i++){
				CmsMenu ccp = childrenlist.get(i);
				Map cm = getNodeList(ccp, datalist);
				if(cm!=null) nodelist.add(cm);
			}
			m.put("children", nodelist);
			if(!PrivlegeUtil.isPrivlege(cmm.getCmmId(), PrivlegeUtil.QUERY) && nodelist.isEmpty()){//是否有权限
				return null;
			}
		}
		return m;
	}

	//查询列表信息
	public List<CmsMenu> query(CmsMenu cmsMenu) {
		return cmsMenuDao.findByProperty("cmmParentId", cmsMenu.getCmmId());
	}
	//获取所有的信息
	public List<CmsMenu> getMenuStore() {
		List<CmsMenu> datalist = cmsMenuDao.getAllMenu();
		return datalist;
	}
	//获取记录
	public CmsMenu getMenuById(Integer cmmId){
		CmsMenu cm =new CmsMenu();
		List<CmsMenu> cmList=cmsMenuDao.findByProperty("cmmId",cmmId);
		cm=cmList.get(0);
		return cm;
	}
	/**查询是否已经存在数据*/
    public Boolean isExistsObj(String cmmName){
    	 List list=cmsMenuDao.findByProperty("cmmName",cmmName);
    	 if (list == null || list.size()==0) {
 			return false;
 		}else
 		{
 			return true;
 		}
    }
   //添加
    public CmsMenu add(CmsMenu cmsMenu) {
    	CmsMenu cu = cmsMenuDao.save(cmsMenu);
		return cu;
	}
    //删除
    public boolean del(Integer cmmId) {
    	cmsMenuDao.deleteById(cmmId);
		return true;
	}
    //修改
    public Boolean modify(CmsMenu cmsMenu) {
    	cmsMenuDao.update(cmsMenu);
		return true;
	}
}
