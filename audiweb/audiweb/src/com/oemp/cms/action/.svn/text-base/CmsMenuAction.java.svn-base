package com.oemp.cms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.cms.bean.CmsLog;
import com.oemp.cms.bean.CmsMenu;
import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.common.JSONBean;
import com.oemp.common.MetaData;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.ApplicationResources;
import com.oemp.frame.util.CmsConstants;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.action.CmsMenuAction")
public class CmsMenuAction extends AdminAction {
	@Autowired
	protected  ServiceDispatcher  serviceDispatcher;
	private String rows;//前台以JSON的形式传递数据
	private int start;//分页开始
	private int limit;//每页显示量
	private CmsMenu  cmsMenu = new CmsMenu();
	List<CmsMenu> datalist ;
	
	public String index() {
		return "index";
	}
	 /**查询page**/
	public void queryByNodeId(){
		cmsMenu.setCmmId(getNodeid());
		datalist = serviceDispatcher.getCmsMenuService().query(cmsMenu);
		//采用集合分页
		List pageList = UtilTools.queryForPage(start, limit, datalist);
		JSONBean jbean = new JSONBean();
		MetaData md = new MetaData();
		md.setIdProperty("cmpId");//关联将要显示列表对应的bean实体的主键ID
		md.reflectFields("com.oemp.cms.bean.CmsMenu");//关联将要显示列表对应的bean实体
		jbean.setMetaData(md);
		jbean.setRows(pageList);
		jbean.setSuccess(true);
		jbean.setTotal(datalist.size());
		
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		String jsonString = UtilTools.encodeObject2Json(jbean);
		
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			out.print(jsonString);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	 /**查询page**/
	public void query(){
		datalist = serviceDispatcher.getCmsMenuService().getMenuStore();
		//采用集合分页
		List pageList = UtilTools.queryForPage(start, limit, datalist);
		JSONBean jbean = new JSONBean();
		MetaData md = new MetaData();
		md.setIdProperty("cmpId");//关联将要显示列表对应的bean实体的主键ID
		md.reflectFields("com.oemp.cms.bean.CmsMenu");//关联将要显示列表对应的bean实体
		jbean.setMetaData(md);
		jbean.setRows(pageList);
		jbean.setSuccess(true);
		jbean.setTotal(datalist.size());
		
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		String jsonString = UtilTools.encodeObject2Json(jbean);
		
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			out.print(jsonString);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/** 新增 */
	public void add(){
		CmsUser cmsuserForSession =  getCmsUser();
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("菜单管理",CmsLog.Add, "新增菜单", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		//返回值
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		
		 Integer  cmmParentId=js.getInt("cmmParentId");
		 String   cmmName=js.getString("cmmName");
		 String  cmmDesc=js.getString("cmmDesc");
		 String  cmmIcon="".equals(js.getString("cmmIcon"))?"workplace/image/icon/xitong.png":js.getString("cmmIcon");
		 Integer  cmmOrderNum=js.getInt("cmmOrderNum");
		 String  cmmAdminUrl=js.getString("cmmAdminUrl");
		 Integer  cmmType=js.getInt("cmmType");
		Date cmmAddTime = UtilTools.getCurrrentDate1();		//获取当前系统时间
		String cmmAddUser = cmsuserForSession.getCmuName();
		
		CmsMenu cm=new CmsMenu();
		cm.setCmmParentId(cmmParentId);
		cm.setCmmName(cmmName);
		cm.setCmmDesc(cmmDesc);
		cm.setCmmIcon(cmmIcon);
		cm.setCmmOrderNum(cmmOrderNum);
		cm.setCmmAdminUrl(cmmAdminUrl);
		cm.setCmmType(cmmType);
		cm.setCmmAddUser(cmmAddUser);
		cm.setCmmAddTime(cmmAddTime);
		serviceDispatcher.getCmsMenuService().add(cm);
		 //获取数据
        StringBuffer jsonString =new StringBuffer();
        jsonString.append("{");
        jsonString.append("success:true");
        jsonString.append("}");
    	 PrintWriter out;
        try {
            out = ServletActionContext.getResponse().getWriter();
            out.print(jsonString);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	/** 删除 */
	public void del(){
		CmsUser cmsuserForSession =  getCmsUser();
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("菜单管理",CmsLog.DELETE, "删除菜单", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		net.sf.json.JSONArray objArr = net.sf.json.JSONArray.fromObject(rows);
		//是否存在子目录
		Boolean flag=false;
        for(int i=0;i<objArr.size();i++)
        {
        	net.sf.json.JSONObject js=objArr.getJSONObject(i);
        	//是否包含子目录，如果包含则不允许删除
        	cmsMenu.setCmmId(js.getInt("cmmId"));
        	List subList=serviceDispatcher.getCmsMenuService().query(cmsMenu);
        	if(subList!=null && subList.size()>0)
        	{
        		flag=true;
        		break;
        	}else{
        		serviceDispatcher.getCmsMenuService().del(js.getInt("cmmId"));
        	}
        	
		}
        //获取数据
        StringBuffer jsonString =new StringBuffer();
        if(flag)
        {
        	jsonString.append("{");
	        jsonString.append("failure:true,");
	        jsonString.append("msg:'对不起该目录包含子菜单，请先删除子菜单'");
	        jsonString.append("}");
        }else{
	        jsonString.append("{");
	        jsonString.append("success:true,");
	        jsonString.append("msg:"+ApplicationResources.getText("admin.system.user.msg.deleteSuccess"));//'删除成功'
	        jsonString.append("}");
        }
        PrintWriter out;
        try {
        	ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
            out = ServletActionContext.getResponse().getWriter();
            out.print(jsonString.toString());
            out.flush();
            out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//修改
	public void modify(){
		CmsUser cmsuserForSession =  getCmsUser();
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("菜单管理",CmsLog.Add, "修改菜单", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		//返回值
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		 Integer  cmmId=js.getInt("cmmId");
		 Integer  cmmParentId=js.getInt("cmmParentId");
		 String   cmmName=js.getString("cmmName");
		 String  cmmDesc=js.getString("cmmDesc");
		 String  cmmIcon="".equals(js.getString("cmmIcon"))?"workplace/image/icon/xitong.png":js.getString("cmmIcon");
		 Integer  cmmOrderNum=js.getInt("cmmOrderNum");
		 String  cmmAdminUrl=js.getString("cmmAdminUrl");
		 Integer  cmmType=js.getInt("cmmType");
		
		CmsMenu cm=serviceDispatcher.getCmsMenuService().getMenuById(cmmId);
		cm.setCmmParentId(cmmParentId);
		cm.setCmmName(cmmName);
		cm.setCmmDesc(cmmDesc);
		cm.setCmmIcon(cmmIcon);
		cm.setCmmOrderNum(cmmOrderNum);
		cm.setCmmAdminUrl(cmmAdminUrl);
		cm.setCmmType(cmmType);
		
		serviceDispatcher.getCmsMenuService().modify(cm);
		 //获取数据
        StringBuffer jsonString =new StringBuffer();
        jsonString.append("{");
        jsonString.append("success:true");
        jsonString.append("}");
    	 PrintWriter out;
        try {
            out = ServletActionContext.getResponse().getWriter();
            out.print(jsonString);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public CmsMenu getCmsMenu() {
		return cmsMenu;
	}
	public void setCmsMenu(CmsMenu cmsMenu) {
		this.cmsMenu = cmsMenu;
	}
	public List<CmsMenu> getDatalist() {
		return datalist;
	}
	public void setDatalist(List<CmsMenu> datalist) {
		this.datalist = datalist;
	}
	
}
