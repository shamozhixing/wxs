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
import com.oemp.cms.bean.CmsRole;
import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.common.JSONBean;
import com.oemp.common.MetaData;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.ApplicationResources;
import com.oemp.frame.util.CmsConstants;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.action.CmsRoleAction")
public class CmsRoleAction extends AdminAction{
    @Autowired
    protected ServiceDispatcher serviceDispatcher;
    private String rows;//前台以JSON的形式传递数据
    private int start;//分页开始
    private int limit;//每页显示量
    private CmsRole cmsRole = new CmsRole();
    List<CmsRole> datalist;
    
    //转到页面中
    public String index()
    {
    	return "index";
    }
    
    /** 查询 */
    public void query(){
    	//解决输入中文的乱码问题
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		if(rows==null){
			datalist = serviceDispatcher.getCmsRoleService().query(cmsRole);
		}else
		{
			net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
			Map<String,String> screenMap=new HashMap<String, String>();
			screenMap.put("cmroName",js.getString("cmroName"));
			screenMap.put("cmroDesc",js.getString("cmroDesc"));
			screenMap.put("cmroAdduser",js.getString("cmroAdduser"));
			datalist=serviceDispatcher.getCmsRoleService().queryByScreen(screenMap);
		}
        //采用集合分页
        List pageList = UtilTools.queryForPage(start, limit, datalist);
        JSONBean jbean = new JSONBean();
        MetaData md = new MetaData();

        md.setIdProperty("cmroName");//关联将要显示列表对应的bean实体的主键ID
        md.reflectFields("com.oemp.cms.bean.CmsRole");//关联将要显示列表对应的bean实体
        jbean.setMetaData(md);
        jbean.setRows(pageList);
        jbean.setSuccess(true);
        jbean.setTotal(datalist.size());

        //String jsonString = UtilTools.encodeObject2Json(jbean);
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
		CmsLog log=UtilTools.buildLog("角色管理",CmsLog.Add, "添加角色", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
    	
    	ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
        //主键不是自增长，需要添加主键值
        String cmroName = js.getString("cmroName");		
        String cmroDesc = js.getString("cmroDesc");
        String cmroAdduser = js.getString("cmroAdduser");

        cmsRole.setCmroName(cmroName);							//添加角色名称
        cmsRole.setCmroDesc(cmroDesc);							//添加角色描述
        cmsRole.setCmroAddtime(com.oemp.frame.util.DateUtil.getNowDate());	//添加时间就是当前系统时间
        cmsRole.setCmroAdduser(cmroAdduser);					//添加添加人
        
        //------查询是否已经存在
        //新增的时候需要查询获取此角色是否已经存在
        Boolean isExists=serviceDispatcher.getCmsRoleService().isExistsObj(cmroName);
        //------end
        if(isExists)
        {
        	 //获取数据
            StringBuffer jsonString =new StringBuffer();
            jsonString.append("{");
            jsonString.append("success:true,");
            jsonString.append("isExists:true,");
            String msg=ApplicationResources.getText("admin.system.role.roleIsExist");
            jsonString.append("msg:"+msg);//'对不起,此角色已存在!'
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
        else{
        	CmsRole addCmsRole = serviceDispatcher.getCmsRoleService().add(cmsRole);
        	//获取数据
            StringBuffer jsonString =new StringBuffer();
            jsonString.append("{");
            jsonString.append("success:true");;
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
        
        
        
    }
    
    /** 修改   添加时间和添加者---修改为空 */
    public void modify(){
    	CmsUser cmsuserForSession =  getCmsUser();
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("角色管理",CmsLog.MODIFY, "修改角色信息", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
    	
        net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
        String cmroName = js.getString("cmroName");
        String cmroDesc = js.getString("cmroDesc");
        //String cmroAdduser = js.getString("cmroAdduser");
        cmsRole.setCmroName(cmroName);
        CmsRole cr=serviceDispatcher.getCmsRoleService().query(cmsRole).get(0);
        cr.setCmroDesc(cmroDesc);
        serviceDispatcher.getCmsRoleService().modify(cr);
        JSONBean bean = new JSONBean();
        bean.setSuccess(true);
        String jsonString = UtilTools.encodeObject2Json(bean,"MM/dd/yyyy HH:mm:ss");
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
		CmsLog log=UtilTools.buildLog("角色管理",CmsLog.DELETE, "删除角色", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		
    	net.sf.json.JSONArray objArr = net.sf.json.JSONArray.fromObject(rows);
        for(int i=0;i<objArr.size();i++)
        {
        	net.sf.json.JSONObject js=objArr.getJSONObject(i);
            serviceDispatcher.getCmsRoleService().del(js.getString("cmroName"));
        }
        //获取数据
        StringBuffer jsonString =new StringBuffer();
        jsonString.append("{");
        jsonString.append("success:true,");
        String msg=ApplicationResources.getText("admin.system.user.msg.deleteSuccess");
        jsonString.append("msg:"+msg);//'删除成功'
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
    private String cmroName;

    public CmsRole getCmsRole() {
		return cmsRole;
	}

	public void setCmsRole(CmsRole cmsRole) {
		this.cmsRole = cmsRole;
	}

	public String getCmroName() {
        return cmroName;
    }

    public void setCmroName(String cmroName) {
        this.cmroName = cmroName;
    }

    public List<CmsRole> getDatalist() {
        return datalist;
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
    
    
    
    
}
