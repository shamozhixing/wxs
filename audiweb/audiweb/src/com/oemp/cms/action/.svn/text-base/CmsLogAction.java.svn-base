package com.oemp.cms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.cms.bean.CmsLog;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.common.JSONBean;
import com.oemp.common.MetaData;
import com.oemp.common.UtilTools;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("cms.action.CmsLogAction")
public class CmsLogAction extends AdminAction {
	@Autowired
	protected ServiceDispatcher serviceDispatcher;
	private String rows;//前台以JSON的形式传递数据
	private int start;//分页开始
	private int page;	//当前页
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	private int limit;//每页显示量
	
	/**实例化 bean 中实体类*/
	private CmsLog cmslog = new CmsLog();
	
	/**返回分页 优化查询*/
	private PageTools<CmsLog> pt;
	
	//转到页面中
    public String index()
    {
    	return "log";
    }
	/** 查询 */
	public void query(){
		//设置页面编码
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		//查询条件为空时
		if(rows == null || rows.equals("{\"cmlTime\":\"\",\"startTime\":\"\",\"endTime\":\"\"}")){
			pt = serviceDispatcher.getCmsLogService().query(page,limit);
		}else   //查询条件为不空时
		{
			net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
			System.out.println(rows);
			Map<String,String> screenMap = new HashMap<String, String>();
			//screenMap.put("cmlTime",js.getString("cmlTime"));		/**rows 里面 是否有排序所需的条件*/
			screenMap.put("startTime",js.getString("startTime"));
			screenMap.put("endTime",js.getString("endTime"));
			
			/**构建 HQL 查询语句*/
			String hql01 = " from com.oemp.cms.bean.CmsLog cmslog where ";
			String hql02 = "";
			if(!"".equals(screenMap.get(""))){			//依据修改时间查询
				hql02 = " cmslog.cmlTime like '%" + CmsUtils.SqlReplace(screenMap.get("cmlTime")) + "%'";//过滤查询条件: 问题
			}
			String hql03 = "";
			if(!"".equals(screenMap.get("startTime"))){		
				hql03 = " and CONVERT(varchar(100), cmslog.cmlTime, 23)>=convert(date,'"+CmsUtils.SqlReplace(screenMap.get("startTime"))+"')";
			}
			String hql04 = "";
			if(!"".equals(screenMap.get("endTime"))){
				hql04 = " and  CONVERT(varchar(100), cmslog.cmlTime, 23)<=convert(date,'"+CmsUtils.SqlReplace(screenMap.get("endTime"))+"')";
			}
			String hql = hql01.concat(hql02).concat(hql03).concat(hql04);
			String orderBy = " order by cmslog.cmlTime desc";
			pt = serviceDispatcher.getCmsLogService().findByHql(page, limit, hql, orderBy);
		}
		
		JSONBean jbean = new JSONBean();
		MetaData md = new MetaData();

		md.setIdProperty("cmlId");//关联将要显示列表对应的bean实体的主键ID
		md.reflectFields("com.oemp.cms.bean.CmsLog");//关联将要显示列表对应的bean实体
		jbean.setMetaData(md);
		jbean.setRows(pt.getList());
		jbean.setSuccess(true);
		jbean.setTotal(pt.getTotalCount());

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
	
	/** 新增 */
//	public void add(){
//		
//		//获取当前系统时间
//		String logTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
//		
//		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
//		String cmlFunction = js.getString("cmlFunction");	//日志操作功能
//		String cmlType = js.getString("cmlType");			//日志类型
//		String cmlDesc = js.getString("cmlDesc");			//日志描述		
//		//Date cmlTime = UtilTools.getCurrrentDate();			//日志日期
//		String cmlUser = js.getString("cmlUser");			//日志添加人
//		
//		cmslog.setCmlFunction(cmlFunction);
//		cmslog.setCmlType(cmlType);
//		cmslog.setCmlDesc(cmlDesc);
//		//cmslog.setCmlTime(cmlTime);		//添加日志日期
//		cmslog.setCmlUser(cmlUser);
//		
//		CmsLog cmsLog = serviceDispatcher.getCmsLogService().add(cmslog);
//		JSONBean bean = new JSONBean();
//		bean.setSuccess(true);
//		// 需要新建一个具有id的vo返回给前台以便通知前台保存成功，不然前台一直处于编辑状态
//		List rows = new ArrayList();
//		rows.add(cmsLog);
//		bean.setRows(rows);
//		//String jsonString = UtilTools.encodeObject2Json(bean);
//		String jsonString = UtilTools.encodeObject2Json(bean,"MM/dd/yyyy HH:mm:ss");
//		
//		PrintWriter out;
//		try {
//			out = ServletActionContext.getResponse().getWriter();
//			out.print(jsonString);
//			out.flush();
//			out.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		//return "detail";
//	}
	
	/** 修改 */
//	public void modify(){
//		
//		//获取当前系统时间
//		//String logTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
//		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
//		Integer cmlId = js.getInt("cmlId");
//		String cmlFunction = js.getString("cmlFunction");
//		String cmlType = js.getString("cmlType");
//		String cmlDesc = js.getString("cmlDesc");
//		//Date cmlTime = js.getString("cmlTime");		//获取添加日志日期
//		String cmlUser = js.getString("cmlUser");
//		
//		cmslog.setCmlId(Integer.valueOf(cmlId));
//		cmslog.setCmlFunction(cmlFunction);
//		cmslog.setCmlType(cmlType);
//		cmslog.setCmlDesc(cmlDesc);
//		//cmslog.setCmlTime(cmlTime);		//将添加日期封装成cmslog对象
//		cmslog.setCmlUser(cmlUser);
//
//		serviceDispatcher.getCmsLogService().modify(cmslog);
//		JSONBean bean = new JSONBean();
//		bean.setSuccess(true);
//		//String jsonString = UtilTools.encodeObject2Json(bean);
//		String jsonString = UtilTools.encodeObject2Json(bean,"MM/dd/yyyy HH:mm:ss");
//		
//		PrintWriter out;
//		try {
//			out = ServletActionContext.getResponse().getWriter();
//			out.print(jsonString);
//			out.flush();
//			out.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		//return "detail";
//	}
	
	private Integer cmlId;
	
	public Integer getCmlId() {
		return cmlId;
	}

	public void setCmlId(Integer cmlId) {
		this.cmlId = cmlId;
	}

	public CmsLog getCmslog() {
		return cmslog;
	}

	public void setCmslog(CmsLog cmslog) {
		this.cmslog = cmslog;
	}


	/** 删除 */
//	public void del(){
//		rows = rows.replace("[", "");
//		rows = rows.replace("]", "");
//		String arry[] =rows.split(",");
//		for(int i=0;i<arry.length;i++)
//		{
//			cmlId = Integer.valueOf(arry[i]) ;
//			serviceDispatcher.getCmsLogService().del(cmlId);
//		}
//		JSONBean bean = new JSONBean();
//		bean.setSuccess(true);
//		//String jsonString = UtilTools.encodeObject2Json(bean);
//		String jsonString = UtilTools.encodeObject2Json(bean,"MM/dd/yyyy HH:mm:ss");
//		
//		PrintWriter out;
//		try {
//			out = ServletActionContext.getResponse().getWriter();
//			out.print(jsonString);
//			out.flush();
//			out.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	 /** 删除 */
    public void del(){
    	net.sf.json.JSONArray objArr = net.sf.json.JSONArray.fromObject(rows);
        for(int i=0;i<objArr.size();i++)
        {
        	net.sf.json.JSONObject js = objArr.getJSONObject(i);
        	//将 String 转化为 Integer 删除
        	String cmlid = js.getString("cmlId");
        	Integer cmlId = Integer.valueOf(cmlid);
            serviceDispatcher.getCmsLogService().del(cmlId);
        }
        //获取数据
        StringBuffer jsonString =new StringBuffer();
        jsonString.append("{");
        jsonString.append("success:true,");
        jsonString.append("msg:'删除成功'");
        jsonString.append("}");
        /**
		 * 系统日志，不需要写日志
		 */
//        CmsUser cmsuser = (CmsUser)ServletActionContext.getRequest().getSession().getAttribute(CmsConstants.ADMIN_USER);
//		String	cmdAdduser = cmsuser.getCmuName();
//        CmsLog  log = UtilTools.buildLog("系统日志管理", CmsLog.DELETE, "删除某一条日志", cmdAdduser);
//		serviceDispatcher.getCmsLogService().add(log);
		
        PrintWriter out;
        try {
        	ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
            out = ServletActionContext.getResponse().getWriter();
            out.print(jsonString.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
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
	

	
}
