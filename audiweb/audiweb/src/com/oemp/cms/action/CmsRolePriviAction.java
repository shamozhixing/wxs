package com.oemp.cms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.cms.bean.CmsLog;
import com.oemp.cms.bean.CmsRolePrivi;
import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.common.JSONBean;
import com.oemp.common.MetaData;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.ApplicationResources;
import com.oemp.frame.util.CmsConstants;

//权限管理,no page
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.action.CmsRolePriviAction")
public class CmsRolePriviAction extends AdminAction{
    @Autowired
    protected ServiceDispatcher serviceDispatcher;
    private String rows;//前台以JSON的形式传递数据
    private int start;//分页开始
    private int limit;//每页显示量
    private CmsRolePrivi cmsRolePrivi = new CmsRolePrivi();
    List<CmsRolePrivi> datalist;
    
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
			datalist = serviceDispatcher.getCmsRolePriviService().query(cmsRolePrivi);
		}else{
			net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
			Map<String,String> screenMap=new HashMap<String, String>();
			screenMap.put("crpCmroName",js.getString("crpCmroName"));
			screenMap.put("crpCmpId",js.getString("crpCmpId"));
			datalist=serviceDispatcher.getCmsRolePriviService().queryByScreen(screenMap);
		}
        //采用集合分页
        List pageList = UtilTools.queryForPage(start, limit, datalist);
        JSONBean jbean = new JSONBean();
        MetaData md = new MetaData();

        md.setIdProperty("crpId");//关联将要显示列表对应的bean实体的主键ID
        md.reflectFields("com.oemp.cms.bean.CmsRolePrivi");//关联将要显示列表对应的bean实体
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
        
        //return "query";
    }
    
    /** 新增 */
    public void add(){
    	CmsUser cmsuserForSession =  getCmsUser();
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("权限管理",CmsLog.Add, "增加权限", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
    	
    	
    	ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
        String crpCmroName = js.getString("crpCmroName");		//角色名称
        Integer crpCmpId = js.getInt("crpCmpId");		 		//栏目ID
        String crpPrivValue = js.getString("crpPrivValue"); 	//权限值
        
        /** 设置role*/
        cmsRolePrivi.setCrpCmroName(crpCmroName);
        //cmsRolePrivi.setCrpCmpId(Integer.valueOf(crpCmpId));
        cmsRolePrivi.setCrpPrivValue(crpPrivValue);
        
        //------查询是否已经存在
        //新增的时候需要查询获取此栏目是否已经存在
        Boolean isExists=serviceDispatcher.getCmsRolePriviService().isExistsObj(crpCmroName, crpCmpId.toString());
        //------end
        if(isExists)
        {
        	 //获取数据
            StringBuffer jsonString =new StringBuffer();
            jsonString.append("{");
            jsonString.append("success:true,");
            jsonString.append("isExists:true,");
            String msg=ApplicationResources.getText("admin.system.privileges.crpIsExist");
            jsonString.append("msg:"+msg);//'对不起,此栏目权限已存在!'
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
	        CmsRolePrivi cmsroleprivi = serviceDispatcher.getCmsRolePriviService().add(cmsRolePrivi);
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

    }
    
    /** 修改   添加时间和添加者---修改为空 */
    public void modify(){
    	CmsUser cmsuserForSession =  getCmsUser();
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("权限管理",CmsLog.MODIFY, "修改权限信息", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
    	
    	
    	ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
        Integer crpId = js.getInt("crpId");				 	//角色权限主键ID
        String crpCmroName = js.getString("crpCmroName");	//角色名称
        Integer crpCmpId = js.getInt("crpCmpId");		 	//栏目ID
        Integer copyCrpCmpId = js.getInt("copyCrpCmpId");	 //Copy栏目ID
        String crpPrivValue = js.getString("crpPrivValue"); //权限值
        
        cmsRolePrivi.setCrpId(Integer.valueOf(crpId));
        cmsRolePrivi.setCrpCmroName(crpCmroName);
       // cmsRolePrivi.setCrpCmpId(Integer.valueOf(crpCmpId));
        cmsRolePrivi.setCrpPrivValue(crpPrivValue);
        
      //是否需要修改,false:已经存在不需要修改,
		boolean flag=false;
		//查询是否需要修改用户名
		if(copyCrpCmpId.equals(crpCmpId)){//填写的名称与备份名称一致，说明是修改除名字以外的内容
			flag=true;
		}else{
			//------查询是否已经存在
	        //新增的时候需要查询获取是否已经存在
	        Boolean isExists=serviceDispatcher.getCmsRolePriviService().isExistsObj(crpCmroName, crpCmpId.toString());
	        //------end
	        if(isExists)
	        {
	        	 //获取数据
	            StringBuffer jsonString =new StringBuffer();
	            jsonString.append("{");
	            jsonString.append("success:true,");
	            jsonString.append("isExists:true,");
	            String msg=ApplicationResources.getText("admin.system.user.msg.crpIsExistUnUpdate");
	            jsonString.append("msg:'"+MessageFormat.format(msg,crpCmroName)+"'");////对不起,"+crpCmroName+"角色的栏目权限已存在您不能修改!
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
	        	flag=true;//如果用户名需要修改且，数据库中没有数据，那么也可以修改
	        }
		}
		//开始修改
		if(flag){
			serviceDispatcher.getCmsRolePriviService().modify(cmsRolePrivi);
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
    }
    
    /** 删除 */
    public void del(){
    	CmsUser cmsuserForSession =  getCmsUser();
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("权限管理",CmsLog.DELETE, "删除权限", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
    	net.sf.json.JSONArray objArr = net.sf.json.JSONArray.fromObject(rows);
        for(int i=0;i<objArr.size();i++)
        {
        	net.sf.json.JSONObject js=objArr.getJSONObject(i);
            serviceDispatcher.getCmsRolePriviService().del(js.getInt("crpId"));
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
    
    /**在角色信息中为栏目赋权限*/
    public void settingPriv(){
    	CmsUser cmsuserForSession =  getCmsUser();
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("角色管理",CmsLog.Add, "为角色赋予权限", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		
    	   net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
           String crpCmroName = js.getString("crpCmroName");	//角色名称
           String privDatas=js.getString("privDatas");
           net.sf.json.JSONArray objArr=net.sf.json.JSONArray.fromObject(privDatas);
           
           //开始修改
           //修改之前将数据库之前的数据全部清除
           serviceDispatcher.getCmsRolePriviService().deleteByCrpCmroName(crpCmroName);
           for(int i=0;i<objArr.size();i++)
           {
        	   //批量增加需要创建新对象
        	   CmsRolePrivi addCrp=new CmsRolePrivi();
               addCrp.setCrpCmroName(crpCmroName);
           		net.sf.json.JSONObject obj=objArr.getJSONObject(i);
           	    Integer crpCmcId = obj.getInt("crpCmcId");		 	//栏目ID
                String crpPrivValue = obj.getString("crpPrivValue"); //权限值
                addCrp.setCrpCmcId(crpCmcId);
                addCrp.setCrpPrivValue(crpPrivValue);
                serviceDispatcher.getCmsRolePriviService().add(addCrp);
           }
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
    
    /** 查询需要修改的角色的当前权限信息 */
    public void queryPrivByRole(){
    	//解决输入中文的乱码问题
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		//获取当前角色下的相应的权限
		datalist = serviceDispatcher.getCmsRolePriviService().queryRole(js.getString("crpCmroName"));
        //采用集合分页
        JSONBean jbean = new JSONBean();
        jbean.setRows(datalist);
        jbean.setSuccess(true);
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
    
   

    public CmsRolePrivi getCmsRolePrivi() {
		return cmsRolePrivi;
	}

	public void setCmsRolePrivi(CmsRolePrivi cmsRolePrivi) {
		this.cmsRolePrivi = cmsRolePrivi;
	}


	private Integer crpId;
    public Integer getCrpId() {
		return crpId;
	}

	public void setCrpId(Integer crpId) {
		this.crpId = crpId;
	}

	public List<CmsRolePrivi> getDatalist() {
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
