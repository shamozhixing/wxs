package com.oemp.cms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.Date;
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
import com.oemp.cms.bean.CmsUserLogin;
import com.oemp.cms.util.PrivlegeUtil;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.common.JSONBean;
import com.oemp.common.MetaData;
import com.oemp.common.UtilTools;
import com.oemp.frame.exception.CmsExceptionUtil;
import com.oemp.frame.util.ApplicationResources;
import com.oemp.frame.util.CmsConstants;
import com.oemp.frame.util.Security;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.action.CmsUserAction")
public class CmsUserAction extends AdminAction{
	@Autowired
	protected ServiceDispatcher serviceDispatcher;
	private String rows;//前台以JSON的形式传递数据
	private int start;//分页开始
	private int limit;//每页显示量
	private CmsUser cmsuser = new CmsUser();
	private CmsUserLogin cul=new CmsUserLogin();
	List<CmsUser> datalist;
	
	//转到页面中
    public String index()
    {
    	return "index";
    }
    /**显示用户工作台信息*/
	public String detail(){
		return "detail";
	}
	/** 查询 */
	public void query(){
		
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		if(rows==null){
			datalist = serviceDispatcher.getCmsUserService().query(cmsuser);
		}else
		{
			net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
			Map<String,String> screenMap=new HashMap<String, String>();
			screenMap.put("cmuName",js.getString("cmuName"));
			screenMap.put("cmuEmail",js.getString("cmuEmail"));
			screenMap.put("cmuFullName",js.getString("cmuFullName"));
			datalist=serviceDispatcher.getCmsUserService().queryByScreen(screenMap);
		}
		//采用集合分页
		List pageList = UtilTools.queryForPage(start, limit, datalist);
		JSONBean jbean = new JSONBean();
		MetaData md = new MetaData();

		md.setIdProperty("cmuId");//关联将要显示列表对应的bean实体的主键ID
		md.reflectFields("com.oemp.cms.bean.CmsUser");//关联将要显示列表对应的bean实体
		jbean.setMetaData(md);
		jbean.setRows(pageList);
		jbean.setSuccess(true);
		jbean.setTotal(datalist.size());

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
		CmsUser cmsuserForSession = (CmsUser)ServletActionContext.getRequest().getSession().getAttribute(CmsConstants.ADMIN_USER);
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("用户管理",CmsLog.Add, "新增用户", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		//返回值
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		String cmuName = js.getString("cmuName");
		String cmuPassword = js.getString("cmuPassword");
		//将密码加密
		String cmuPasswordForMd5=Security.encryptMD5(cmuPassword);
		String cmuEmail = js.getString("cmuEmail");
		String cmuMobile = js.getString("cmuMobile");
		String cmuFullName = js.getString("cmuFullName");
		String cmuCmroRoles = js.getString("cmuCmroRoles");
		//是否超级管理员
		String requestCmuIsAdmin = js.getString("cmuIsAdmin");
		Date cmuAddtime = UtilTools.getCurrrentDate1();		//获取当前系统时间
		String cmuAdduser = cmsuserForSession.getCmuName();
		
		CmsUser cu=new CmsUser();
		cu.setCmuName(cmuName);
		cu.setCmuPassword(cmuPasswordForMd5);
		cu.setCmuEmail(cmuEmail);
		cu.setCmuMobile(cmuMobile);
		cu.setCmuFullName(cmuFullName);
		cu.setCmuCmroRoles(cmuCmroRoles);
		cu.setCmuAddtime(cmuAddtime);
		cu.setCmuAdduser(cmuAdduser);
		cu.setCmuIsAdmin(Integer.parseInt(requestCmuIsAdmin));
		//------查询是否已经存在
        //新增的时候需要查询获取是否已经存在
        Boolean isExists=serviceDispatcher.getCmsUserService().isExistsObj(cmuName);
        //------end
        if(isExists)
        {
        	 //获取数据
            StringBuffer jsonString =new StringBuffer();
            jsonString.append("{");
            jsonString.append("success:true,");
            jsonString.append("isExists:true,");
            jsonString.append("msg:"+ApplicationResources.getText("admin.system.user.msg.userisexists"));//'对不起,此用户已存在!'
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
			serviceDispatcher.getCmsUserService().add(cu);
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
	
	/** 修改 */
	public void modify(){
		CmsUser cmsuserForSession = (CmsUser)ServletActionContext.getRequest().getSession().getAttribute(CmsConstants.ADMIN_USER);
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("用户管理",CmsLog.MODIFY, "修改用户信息", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		String cmuId = js.getString("cmuId");
		String cmuName = js.getString("cmuName");
		//备份的名称
		String copyCmuName = js.getString("copyCmuName");
		String cmuPassword = js.getString("cmuPassword");
		String cmuEmail = js.getString("cmuEmail");
		String cmuMobile = js.getString("cmuMobile");
		String cmuFullName = js.getString("cmuFullName");
		String cmuCmroRoles = js.getString("cmuCmroRoles");
		//Date cmuAddtime = UtilTools.getCurrrentDate1();		//获取当前系统时间
		String cmuAdduser = js.getString("cmuAdduser");
		//是否超级管理员
		String requestCmuIsAdmin = js.getString("cmuIsAdmin");
		CmsUser cu=new CmsUser();
		cu.setCmuName(cmuName);
		List<CmsUser> culist= serviceDispatcher.getCmsUserService().query(cu);
		cu= culist.get(0);
		cu.setCmuId(Integer.valueOf(cmuId));
		cu.setCmuName(cmuName);
		cu.setCmuPassword(cmuPassword);
		cu.setCmuEmail(cmuEmail);
		cu.setCmuMobile(cmuMobile);
		cu.setCmuFullName(cmuFullName);
		cu.setCmuCmroRoles(cmuCmroRoles);
		cu.setCmuIsAdmin(Integer.parseInt(requestCmuIsAdmin));
		//cu.setCmuAddtime(cmuAddtime);
		cu.setCmuAdduser(cmuAdduser);
		//是否需要修改,false:已经存在不需要修改,
		boolean flag=false;
		//查询是否需要修改用户名
		if(copyCmuName.equals(cmuName)){//填写的名称与备份名称一致，说明是修改除名字以外的内容
			flag=true;
		}else{
			//------查询是否已经存在
	        //新增的时候需要查询获取是否已经存在
	        Boolean isExists=serviceDispatcher.getCmsUserService().isExistsObj(cmuName);
	        //------end
	        if(isExists)
	        {
	        	 //获取数据
	            StringBuffer jsonString =new StringBuffer();
	            jsonString.append("{");
	            jsonString.append("success:true,");
	            String msg=ApplicationResources.getText("admin.system.user.msg.userisexistsUnUpdate");
	            jsonString.append("isExists:true,");
	           
	            jsonString.append("msg:'"+MessageFormat.format(msg,cmuName)+"'");//'对不起,用户名为["+cmuName+"]的用户已存在,您不能修改!'");
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
			serviceDispatcher.getCmsUserService().modify(cu);
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
	/**重置密码 */
	public void resetPwd(){
		CmsUser cmsuserForSession = (CmsUser)ServletActionContext.getRequest().getSession().getAttribute(CmsConstants.ADMIN_USER);
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("用户管理",CmsLog.MODIFY, "修改用户密码", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		
		//获取数据
		String requestCmuName = js.getString("cmuName");
		if(!cmdAdduser.equals(requestCmuName)){
			throw CmsExceptionUtil.getSystemException("系统错误", null);
		}
		//提示信息
		String msg="";
		//oldPwd不为空，是修改当前用户密码
		String oldPwd=ServletActionContext.getRequest().getParameter("cmuOldPassword");//js("cmuOldPassword");
		if(null!=oldPwd && !"".equals(oldPwd))
		{
			//查询用户密码，与现密码是否匹配
			CmsUser obj=new CmsUser();
			obj.setCmuName(requestCmuName);
			obj=serviceDispatcher.getCmsUserService().query(obj).get(0);
			//密码是否相等
			if(!Security.encryptMD5(oldPwd).equals(obj.getCmuPassword())){
				// 获取数据
				StringBuffer jsonString = new StringBuffer();
				jsonString.append("{");
				jsonString.append("success:true,");
				jsonString.append("isOldError:true,");//密码输入有误
				msg=ApplicationResources.getText("admin.system.user.oldPasswordError");
				jsonString.append("msg:"+msg);
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
				return;
			}
			 msg=ApplicationResources.getText("admin.system.user.msg.modifyPwdScuccess");
		}
		//获取数据
		String cmuPassword = js.getString("cmuPassword");
		// 将密码加密
		String cmuPasswordForMd5 = Security.encryptMD5(cmuPassword);
		//修改信息
		CmsUser obj=new CmsUser();
		obj.setCmuName(requestCmuName);
		//修改的用户
		obj=serviceDispatcher.getCmsUserService().query(obj).get(0);
		obj.setCmuPassword(cmuPasswordForMd5);
		//重置密码
		serviceDispatcher.getCmsUserService().modify(obj);
		// 获取数据
		StringBuffer jsonString = new StringBuffer();
		jsonString.append("{");
		jsonString.append("success:true,");
		if(!"".equals(msg))
		{
			cmsuser.setCmuPassword(cmuPasswordForMd5);
			//登陆成功后，把当前登录用户对象放入session中
			setSessionValue(CmsConstants.ADMIN_USER, cmsuser);
		}
		msg="".equals(msg)?ApplicationResources.getText("admin.system.user.msg.resetScuccess"):msg;
		jsonString.append("msg:"+msg);
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
	
	/** 删除 */
	public void del(){
		CmsUser cmsuserForSession = (CmsUser)ServletActionContext.getRequest().getSession().getAttribute(CmsConstants.ADMIN_USER);
		String	cmdAdduser = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("用户管理",CmsLog.DELETE, "删除用户", cmdAdduser);
		serviceDispatcher.getCmsLogService().add(log);
		
		net.sf.json.JSONArray objArr = net.sf.json.JSONArray.fromObject(rows);
        for(int i=0;i<objArr.size();i++)
        {
        	net.sf.json.JSONObject js=objArr.getJSONObject(i);
        	serviceDispatcher.getCmsUserService().del(js.getInt("cmuId"));
		}
        //获取数据
        StringBuffer jsonString =new StringBuffer();
        jsonString.append("{");
        jsonString.append("success:true,");
        jsonString.append("msg:"+ApplicationResources.getText("admin.system.user.msg.deleteSuccess"));//'删除成功'
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
	/** 登录 */
	public String login(){
		//获取验证码
		/*String sessionVerifyCode=getSessionValue("theCalcResult").toString();
		String clienVerifyCode=ServletActionContext.getRequest().getParameter("verifyCode");
		 String resoultMsg="";
		 boolean flag=false;
		if(null != sessionVerifyCode && null !=clienVerifyCode && !sessionVerifyCode.equals(clienVerifyCode))
		{
			resoultMsg=ApplicationResources.getText("admin.system.user.validateError");
		}else{*/
		 String resoultMsg="";
		 boolean flag=false;
		cmsuser = serviceDispatcher.getCmsUserService().login(cmuName, Security.encryptMD5(cmuPassword));
		if(cmsuser!=null){
			//登陆成功后，把当前登录用户对象放入session中
			setSessionValue(CmsConstants.ADMIN_USER, cmsuser);
			if(PrivlegeUtil.isAdmins()==false){
				//非超级管理员 将权限值放到SESSION 
				List<CmsRolePrivi> datalist = serviceDispatcher.getCmsRolePriviService().queryRole(cmsuser.getCmuCmroRoles());
				Map<Integer,String> pmap = new HashMap<Integer,String>();
				for(int i=0;i<datalist.size();i++){
					CmsRolePrivi crp = datalist.get(i);
					pmap.put(crp.getCrpCmcId(), crp.getCrpPrivValue());
				}
				setSessionValue(CmsConstants.USER_PRIVLEGE_MENU, pmap);
			}
			
			int culCmuId=cmsuser.getCmuId();
			Date culLoginTime=new Date();
			cul.setCulCmuId(culCmuId);
			cul.setCulLoginTime(culLoginTime);
			serviceDispatcher.getCmsUserLoginService().add(cul);
			flag=true;
		}
		 //获取数据
        StringBuffer jsonString =new StringBuffer();
        if("".equals(resoultMsg))
        {
        	resoultMsg=flag?cmsuser.getCmuName():ApplicationResources.getText("admin.system.user.loginError");
        }
        jsonString.append("{");
        jsonString.append("success:"+flag);
        jsonString.append(",resoultMsg:'"+resoultMsg+"'");
        jsonString.append("}");
        PrintWriter out;
        try {
        	ServletActionContext.getResponse().setContentType("text/html");
        	ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
            out = ServletActionContext.getResponse().getWriter();
            out.print(jsonString.toString());
            out.flush();
            out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String logout(){
		setSessionValue(CmsConstants.ADMIN_USER, null);
		return SUCCESS;
	}
	public void islogin(){
		if(getSessionValue(CmsConstants.ADMIN_USER)!=null){
			this.renderText("true");
		}else{
			this.renderText("false");
		}
	}
	/**注销用户信息*/
	public void cancelLogin(){
		ServletActionContext.getRequest().getSession().invalidate();
		  //获取数据
        StringBuffer jsonString =new StringBuffer();
        jsonString.append("{");
        jsonString.append("success:true");
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
	private Integer cmuId;
	public Integer getCmuId() {
		return cmuId;
	}

	public void setCmuId(Integer cmuId) {
		this.cmuId = cmuId;
	}

	public CmsUser getUser() {
		return cmsuser;
	}

	public void setUser(CmsUser user) {
		this.cmsuser = user;
	}

//	public Long getId() {
//		return id;
//	}
//
//	public void setId(Long id) {
//		this.id = id;
//	}

	public List<CmsUser> getDatalist() {
		return datalist;
	}
	private String cmuName;
	public String getCmuName() {
		return cmuName;
	}

	public void setCmuName(String cmuName) {
		this.cmuName = cmuName;
	}

	private String cmuPassword;
	
	public String getCmuPassword() {
		return cmuPassword;
	}

	public void setCmuPassword(String cmuPassword) {
		this.cmuPassword = cmuPassword;
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
	/**
	 * 
	 */
	public CmsUserAction() {
	}
	
}
