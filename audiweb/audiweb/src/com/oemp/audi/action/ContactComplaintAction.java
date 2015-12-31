package com.oemp.audi.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.ContactComplaint;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.CommonUtil;
import com.oemp.cms.action.AdminAction;
import com.oemp.common.UtilTools;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsConstants;
import com.oemp.frame.util.CmsUtils;
import com.oemp.frame.util.DateUtil;

/**
 * 后台 ： 投诉信息管理
 * 功能描述 ：  -查询 -导出
 * @author dang
 * 访问url ： complaint_index.action
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.action.ContactComplaintAction")
public class ContactComplaintAction extends AdminAction {
	
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	private int page;
	private int limit;
	private String rows;
	
	public String index(){
		return "index";
	}
	
	@SuppressWarnings("unchecked")
	public String getList(){
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		Map map = new HashMap();
		Map<String,String> paramMap = new HashMap<String,String>();
		// 判断查询条件
		if(rows==null){
			paramMap.put("caName", "");
		}else{
			JSONObject js= JSONObject.fromObject(rows);
			String ccName = js.getString("ccName");
			paramMap.put("ccName", ccName);
			paramMap.put("startTime", js.getString("startTime"));
			paramMap.put("endTime", js.getString("endTime"));
		}
		PageTools pt = audiServiceDispatcher.getContactComplaintService().findPages(page, limit, paramMap);
		
		map.put("list", pt.getList());
		map.put("totalCount", pt.getTotalCount());
		String jsonString = UtilTools.getJsonForObject(map);
		try {
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print(jsonString);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public String complaintExport() {
		Map map = new HashMap();
		Map<String,String> paramMap=new HashMap<String, String>();
		// 判断查询条件
		if(rows==null){
			paramMap.put("ccName", "");
		}else{
			JSONObject js = JSONObject.fromObject(rows);
			String ccName = js.getString("ccName");
			paramMap.put("ccName", ccName);
			paramMap.put("startTime", js.getString("startTime"));
			paramMap.put("endTime", js.getString("endTime"));
		}
		List list = audiServiceDispatcher.getContactComplaintService().findByScreen(paramMap);
		// 第一步，创建一个workbook，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("投诉信息列表");
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
		cell.setCellValue("手机号码");
		cell.setCellStyle(style);
		cell = row.createCell((short) 3);
		cell.setCellValue("出生日期");
		cell.setCellStyle(style);
		cell= row.createCell((short) 4);
		cell.setCellValue("投诉类型");
		cell.setCellStyle(style);
		cell = row.createCell((short) 5);
		cell.setCellValue("创建日期");
		cell.setCellStyle(style);
		cell = row.createCell((short) 6);
		cell.setCellValue("行驶里程");
		cell.setCellStyle(style);
		cell = row.createCell((short) 7);
		cell.setCellValue("经销商所在省");
		cell.setCellStyle(style);
		cell = row.createCell((short) 8);
		cell.setCellValue("经销商所在市");
		cell.setCellStyle(style);
		cell = row.createCell((short) 9);
		cell.setCellValue("经销商名称");
		cell.setCellStyle(style);
		cell = row.createCell((short) 10);
		cell.setCellValue("车辆型号");
		cell.setCellStyle(style);
		cell = row.createCell((short) 11);
		cell.setCellValue("车架号");
		cell.setCellStyle(style);
		cell = row.createCell((short) 12);
		cell.setCellValue("车牌号");
		cell.setCellStyle(style);
		cell = row.createCell((short) 13);
		cell.setCellValue("购车年份");
		cell.setCellStyle(style);
		cell = row.createCell((short) 14);
		cell.setCellValue("购车月份");
		cell.setCellStyle(style);
		cell = row.createCell((short) 15);
		cell.setCellValue("投诉内容");
		cell.setCellStyle(style);
		cell = row.createCell((short) 16);
		cell.setCellValue("编码");
		cell.setCellStyle(style);
		cell = row.createCell((short) 17);
		cell.setCellValue("联系时间");
		cell.setCellStyle(style);
		cell = row.createCell((short) 18);
		cell.setCellValue("具体时间");
		cell.setCellStyle(style);
		
		String fileName = "";
		try {
			//省市
			Map<Long, String > cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryMap();
			//进销商
			Map<Long, String > dealMap = audiServiceDispatcher.getUtilDao().getDealerMap();
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow((int) i + 1);
				ContactComplaint cd = (ContactComplaint) list.get(i);
				if(cd!=null){
					row.createCell((short) 0).setCellValue(CommonUtil.getCellString(cd.getCcType()));//姓名
					row.createCell((short) 1).setCellValue(CommonUtil.getGender(cd.getCcGender()));//性别
					row.createCell((short) 2).setCellValue(CommonUtil.getCellString(cd.getCcMobile()));//手机号码
					row.createCell((short) 3).setCellValue(CommonUtil.getCellString(cd.getCcBirthday()));//出生日期
					Long ct=cd.getCcType();
					String ctStr="";
					if(ct==1){
						ctStr="售前";
					}else if(ct==2){
						ctStr="售后";
					}else {
						ctStr= "二手车";
					}
					row.createCell((short) 4).setCellValue(ctStr);//投诉类型
					row.createCell((short) 5).setCellValue(CommonUtil.getCellString(cd.getCcAddtime()));//创建日期
					row.createCell((short) 6).setCellValue(CommonUtil.getCellString(cd.getCcKilometer()));//行驶里程
					String province="";
					if(!CmsUtils.isEmpty(cd.getCcProvince())){
						province=cacheMap.get(cd.getCcProvince());
					}
					row.createCell((short) 7).setCellValue(province);//经销商所在省
					String city="";
					if(!CmsUtils.isEmpty(cd.getCcCity())){
						city=cacheMap.get(cd.getCcCity());
					}
					row.createCell((short) 8).setCellValue(city);//经销商所在市
					String deac="";
					if(!CmsUtils.isEmpty(cd.getCcDealer())){
						deac=dealMap.get(cd.getCcDealer());
					}
					row.createCell((short) 9).setCellValue(deac);// 经销商名称
					row.createCell((short) 10).setCellValue(CommonUtil.getCellString(cd.getCcModel()));// 车辆型号
					row.createCell((short) 11).setCellValue(CommonUtil.getCellString(cd.getCcFootnum()));// 车架号
					row.createCell((short) 12).setCellValue(CommonUtil.getCellString(cd.getCcCarnum()));// 车牌号
					row.createCell((short) 13).setCellValue(CommonUtil.getCellString(cd.getCcBuyyear()));	// 购车年份
					row.createCell((short) 14).setCellValue(CommonUtil.getCellString(cd.getCcBuymonth()));// 购车月份
					row.createCell((short) 15).setCellValue(CommonUtil.getCellString(cd.getCcDescription()));// 投诉内容
					row.createCell((short) 16).setCellValue(CommonUtil.getCellString(cd.getCcCode()));	// 编码
					row.createCell((short) 17).setCellValue(cd.getCcWhen()!=null?(cd.getCcWhen().toString().equals("1")?"工作日":"周末"):"");// 联系时间
					row.createCell((short) 18).setCellValue(CommonUtil.getCellString(cd.getCcTiming()));	// 具体时间
				}
			}
			File filepath = new File(ServletActionContext.getServletContext().getRealPath(SAVEURL));
			if (!filepath.exists() && !filepath.isDirectory()) {
				filepath.mkdirs();
			}
			fileName = "contactcomplaint"+DateUtil.getNowDate("yyyy-MM-dd") + ".xls";
			File file = new File(ServletActionContext.getServletContext().getRealPath(SAVEURL) + "/" + fileName);
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
	
	private final String SAVEURL = CmsConstants.CONTENT_PATH + "/admin/uploadfiles/";
	
	public void downloadExcel(){
		  BufferedInputStream bis = null;
		  BufferedOutputStream bos = null;
		  OutputStream os = null;
		  InputStream is = null;
		try {
			ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
			String fileName=ServletActionContext.getRequest().getParameter("fileName");
			final File file = new File(ServletActionContext.getServletContext().getRealPath(SAVEURL)+"/"+fileName);
		
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



	public String getSAVEURL() {
		return SAVEURL;
	}

	//	生成 get、set 方法
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}
	
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}
	
}
