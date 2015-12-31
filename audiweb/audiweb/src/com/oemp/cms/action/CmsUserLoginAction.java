package com.oemp.cms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.cms.bean.CmsLog;
import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.bean.CmsUserLogin;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.common.JSONBean;
import com.oemp.common.MetaData;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.ApplicationResources;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.action.CmsUserLoginAction")
public class CmsUserLoginAction extends AdminAction{
	@Autowired
	protected ServiceDispatcher serviceDispatcher;
	private String rows;//前台以JSON的形式传递数据
	private int start;//分页开始
	private int limit;//每页显示量
	private CmsUserLogin cmsUserLogin=new CmsUserLogin();
	List<CmsUserLogin> culList;
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
	public String index(){
		return "index";
	}
	//查询
	public void query(){
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		if(rows==null){
			culList=serviceDispatcher.getCmsUserLoginService().query(cmsUserLogin);
		}else{
			net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
			Map<String,String> screenMap = new HashMap<String, String>();
			String startTime=js.getString("startTime");
			String endTime=js.getString("endTime");
			String cmuIds=js.getString("cmuId");
			Map<String,String> optionMap=new HashMap<String, String>();
			optionMap.put("cmuId", cmuIds);
			optionMap.put("endTime", endTime);
			optionMap.put("startTime", startTime);
			culList=serviceDispatcher.getCmsUserLoginService().findByMap(optionMap);	
			
		}
		
		
		//采用集合分页
		List pageList = UtilTools.queryForPage(start, limit, culList);
		JSONBean jbean = new JSONBean();
		MetaData md = new MetaData();

		md.setIdProperty("culId");//关联将要显示列表对应的bean实体的主键ID
		md.reflectFields("com.oemp.cms.bean.CmsUserLogin");//关联将要显示列表对应的bean实体
		jbean.setMetaData(md);
		jbean.setRows(pageList);
		jbean.setSuccess(true);
		jbean.setTotal(culList.size());

		String jsonString = UtilTools.encodeObject2Json(jbean,"MM/dd/yyyy HH:mm:ss");
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
	public void del(){
		net.sf.json.JSONArray objArr = net.sf.json.JSONArray.fromObject(rows);
		 for(int i=0;i<objArr.size();i++){
			 net.sf.json.JSONObject js=objArr.getJSONObject(i);
			 serviceDispatcher.getCmsUserLoginService().del(js.getInt("culId"));
		 }

			CmsUser cmsuser = getCmsUser();
			String cmtLastuser =cmsuser.getCmuName();//获取session中对象的姓名
			/**
			 * 系统日志
			 */
			CmsLog  log = UtilTools.buildLog("登陆用户", CmsLog.DELETE, "删除登陆用户", cmtLastuser);
	        serviceDispatcher.getCmsLogService().add(log);
	        //获取数据
	        StringBuffer jsonString =new StringBuffer();
	        jsonString.append("{");
	        jsonString.append("success:true,");
	        String msg=ApplicationResources.getText("util.delSuccess");
	        jsonString.append("msg:'"+msg+"'");//'删除成功'
	        jsonString.append("}");
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
}
