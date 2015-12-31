package com.oemp.audi.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.CommonUtil;
import com.oemp.cms.action.AdminAction;
import com.oemp.cms.bean.CmsLog;
import com.oemp.cms.bean.CmsUser;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.common.UtilTools;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;
import com.oemp.frame.util.DateUtil;

/**
 * 用户管理
 * @author Administrator
 * 
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.action.TbRegUserAction")
public class TbRegUserAction extends AdminAction {

	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;

	@Autowired
	protected ServiceDispatcher serviceDispatcher;
	/** 跳转 */
	public String index() {
		return "index";
	}

	/** 获取信息 */
	public String query() {
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		page = page == 0 ? 0 : page;
		limit = limit == 0 ? 50 : limit;
		Map<String, String> screenMap = new HashMap<String, String>();
		if (rows != null) { // 如果由检索条件
			net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
			String email=js.getString("email");
			screenMap.put("email", CmsUtils.isEmpty(email)?"":email);
			screenMap.put("username", js.getString("username"));
			screenMap.put("status",js.getString("availabilityflag"));
			screenMap.put("startTime", js.getString("startTime"));
			screenMap.put("endTime", js.getString("endTime"));
			
		}
		pt = audiServiceDispatcher.getRegUserService().findByHql(page, limit, screenMap);
		Map map = new HashMap();
		map.put("ROOT", pt.getList());
		map.put("totalCount", pt.getTotalCount());
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
		return null;
	}

	
	/**
	 * 更新信息
	 */
	public String update() {
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		CmsUser cmsuserForSession =  getCmsUser();
		String	user = cmsuserForSession.getCmuName();
		//写日志
		CmsLog log=UtilTools.buildLog("会员管理",CmsLog.MODIFY, "修改用户的状态", user);
		serviceDispatcher.getCmsLogService().add(log);
		
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);	
		Long userid = js.getLong("userid");
		String status=js.getString("availabilityflag");
		TbRegUser tbRegUser=audiServiceDispatcher.getRegUserService().getUserById(userid);
		if(!CmsUtils.isEmpty(status)){
			tbRegUser.setAvailabilityflag(status);
		}else{
			tbRegUser.setAvailabilityflag("1");
		}
		boolean isSuc=audiServiceDispatcher.getRegUserService().modify(tbRegUser);
		this.renderJson("{success:true,msg:'修改成功!',error:"+isSuc+"}");
		return null;
	}
	
	/**生成excel*/
	public String export() {
		Map map = new HashMap();
		Map<String,String> screenMap=new HashMap<String, String>();
		// 判断查询条件
		if(rows!=null){
			net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
			String email=js.getString("email");
			screenMap.put("email", CmsUtils.isEmpty(email)?"":email);
			screenMap.put("username", js.getString("username"));
			screenMap.put("status",js.getString("availabilityflag"));
			screenMap.put("startTime", js.getString("startTime"));
			screenMap.put("endTime", js.getString("endTime"));
		}
		//导出的list
		List list = audiServiceDispatcher.getRegUserService().findByScreen(screenMap);
		// 第一步，创建一个workbook，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("用户列表");
		// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
		HSSFRow row = sheet.createRow((int) 0);
		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue("姓名");
		cell.setCellStyle(style);
		cell = row.createCell((short) 1);
		cell.setCellValue("性别");
		cell.setCellStyle(style);
		cell = row.createCell((short) 2);
		cell.setCellValue("邮箱");
		cell.setCellStyle(style);
		cell = row.createCell((short) 3);
		cell.setCellValue("手机");
		cell.setCellStyle(style);
		cell = row.createCell((short) 4);
		cell.setCellValue("所在省");
		cell.setCellStyle(style);
		cell = row.createCell((short) 5);
		cell.setCellValue("所在市");
		cell.setCellStyle(style);
		cell = row.createCell((short) 6);
		cell.setCellValue("地址");
		cell.setCellStyle(style);
		cell = row.createCell((short) 7);
		cell.setCellValue("邮编");
		cell.setCellStyle(style);
		
		cell = row.createCell((short) 8);
		cell.setCellValue("出生日期");
		cell.setCellStyle(style);
		
		cell = row.createCell((short) 9);
		cell.setCellValue("电话");
		cell.setCellStyle(style);
		
		cell = row.createCell((short) 10);
		cell.setCellValue("注册时间");
		cell.setCellStyle(style);
		
		cell = row.createCell((short) 11);
		cell.setCellValue("是否有车");
		cell.setCellStyle(style);
		cell = row.createCell((short) 12);
		cell.setCellValue("是否有效");
		cell.setCellStyle(style);
		cell = row.createCell((short) 13);
		cell.setCellValue("是否车主");
		cell.setCellStyle(style);
		String fileName = "";
		try {
			//省市
			Map<Long, String > cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryMap();
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow((int) i + 1);
				TbRegUser bean = (TbRegUser) list.get(i);
				if(bean!=null){
					row.createCell((short) 0).setCellValue(CommonUtil.getCellString(bean.getUsername()));  //姓名
					row.createCell((short) 1).setCellValue(CommonUtil.getGender(bean.getGender()));    //性别
					row.createCell((short) 2).setCellValue(CommonUtil.getCellString(bean.getEmail()));//邮箱
					row.createCell((short) 3).setCellValue(CommonUtil.getCellString(bean.getMobile()));  //手机
					String province="";
					if(!CmsUtils.isEmpty(bean.getProvince())){
						province=cacheMap.get(bean.getProvince());
					}
					row.createCell((short) 4).setCellValue(province);//所在省
					String city="";
					if(!CmsUtils.isEmpty(bean.getCity())){
						city=cacheMap.get(bean.getCity());
					}
					row.createCell((short) 5).setCellValue(city);//所在市
					row.createCell((short) 6).setCellValue(CommonUtil.getCellString(bean.getAddress()));//地址
					row.createCell((short) 7).setCellValue(CommonUtil.getCellString(bean.getPostcode()));//邮编
					String birth="";
					if(!CmsUtils.isEmpty(bean.getBirthdayy())){
						birth+=CommonUtil.getCellString(bean.getBirthdayy());
					}
					if(!CmsUtils.isEmpty(bean.getBirthdaym())){
						if(birth!=""){
							birth+="-";
						}
						birth+=CommonUtil.getCellString(bean.getBirthdaym());
					}
					if(!CmsUtils.isEmpty(bean.getBirthdayd())){
						if(birth!=""){
							birth+="-";
						}
						birth+=CommonUtil.getCellString(bean.getBirthdayd());
					}
					
					row.createCell((short) 8).setCellValue(birth);//出生日期
					String tell="";
					if(!CmsUtils.isEmpty(bean.getAreanum())){
						tell+=CommonUtil.getCellString(bean.getAreanum());
					}
					if(!CmsUtils.isEmpty(bean.getPhone())){
						if(tell!=""){
							tell+="-";
						}
						tell+=CommonUtil.getCellString(bean.getPhone());
					}
					if(!CmsUtils.isEmpty(bean.getExt())){
						if(tell!=""){
							tell+="-";
						}
						tell+=CommonUtil.getCellString(bean.getExt());
					}
					row.createCell((short) 9).setCellValue(tell);//电话
					row.createCell((short) 10).setCellValue(CommonUtil.getCellString(bean.getRegtime()));//注册时间
					row.createCell((short) 11).setCellValue(CommonUtil.yesOrNo(bean.getIscar()));//是否有车
					row.createCell((short) 12).setCellValue(CommonUtil.yesOrNo(bean.getAvailabilityflag()));//是否有效
					row.createCell((short) 12).setCellValue(CommonUtil.yesOrNo(bean.getAuditingcar()));//是否车主
				}
			}
			File filepath = new File(ServletActionContext.getServletContext().getRealPath(CommonUtil.SAVEURL));
			if (!filepath.exists() && !filepath.isDirectory()) {
				filepath.mkdirs();
			}
			fileName = "member"+DateUtil.getNowDate("yyyy-MM-dd") + ".xls";
			File file = new File(ServletActionContext.getServletContext()
					.getRealPath(CommonUtil.SAVEURL)
					+ "/" + fileName);
			if (file.isFile()) {
				file.delete();
			}
			FileOutputStream fout = new FileOutputStream(file);
			wb.write(fout);
			fout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("success", "true");
		map.put("fileName", fileName);
		String text = UtilTools.encodeObject2Json(map);
		renderText(text);
		return null; 
	}
	/**下载excel*/
	public void downloadExcel(){
		  BufferedInputStream bis = null;
		  BufferedOutputStream bos = null;
		  OutputStream os = null;
		  InputStream is = null;
		try {
			ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
			String fileName=ServletActionContext.getRequest().getParameter("fileName");
			final File file = new File(ServletActionContext.getServletContext().getRealPath(CommonUtil.SAVEURL)+"/"+fileName);
		
			 is = new FileInputStream(file);
	         bis = new BufferedInputStream(is);
	         os =  ServletActionContext.getResponse().getOutputStream();
	         bos = new BufferedOutputStream(os);
	         ServletActionContext.getResponse().reset();
		     ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		     
		     ServletActionContext.getResponse().setContentType("application/octet-stream");//文件类型contenttype
		     ServletActionContext.getRequest().setCharacterEncoding("GB2312");
		     fileName = new String(fileName .getBytes("GB2312"), "ISO8859-1");
		     ServletActionContext.getResponse().setHeader("Content-Disposition","attachment; filename=\"" + fileName+"\"");  //关键部分，打开一个下载框
		     int bytesRead = 0;
	         byte[] buffer = new byte[8192];
	         
	         while((bytesRead = bis.read(buffer,0,8192)) != -1)
	         {
	          bos.write(buffer, 0, bytesRead);
	         }
	         bos.flush();   
	         is.close();
	         bis.close();
	         os.close();
	         bos.close();
	       if(file.isFile()){
	    	   file.delete();
	       }
		} catch (Exception e) {
			e.printStackTrace();
		}
		   System.gc();
	        return;
	}
	private int start;// 分页开始
	private int limit;// 每页显示量
	private int page; // 当前页
	private String rows; // 前端提交信息
	private PageTools<TbRegUser> pt;
	

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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	
	



}
