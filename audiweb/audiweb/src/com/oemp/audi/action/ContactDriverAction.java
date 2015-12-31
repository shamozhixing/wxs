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

import com.oemp.audi.bean.ContactDriver;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.CommonUtil;
import com.oemp.cms.action.AdminAction;
import com.oemp.common.UtilTools;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsConstants;
import com.oemp.frame.util.CmsUtils;
import com.oemp.frame.util.DateUtil;

/**
 * 
 * @author Zhou
 *
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.action.ContactDriverAction")
public class ContactDriverAction extends AdminAction {
	
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	private int page;
	private int limit;
	private String rows;
	
	
	public String index(){
		return "index";
	}
	
	public String getList(){
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		Map map = new HashMap();
		Map<String,String> paramMap = new HashMap<String,String>();
		// 判断查询条件
		if(rows==null){
			paramMap.put("cdname", "");
		}else{
			JSONObject js = JSONObject.fromObject(rows);
			String cdname = js.getString("cdname");
			paramMap.put("cdname", cdname);
			paramMap.put("startTime", js.getString("startTime"));
			paramMap.put("endTime", js.getString("endTime"));
		}
		PageTools pt = audiServiceDispatcher.getContactDriverService().findPages(page, limit, paramMap);
		
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

	/**
	 * @return the page
	 */
	public int getPage() {
		return page;
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(int page) {
		this.page = page;
	}

	/**
	 * @return the limit
	 */
	public int getLimit() {
		return limit;
	}

	/**
	 * @param limit the limit to set
	 */
	public void setLimit(int limit) {
		this.limit = limit;
	}

	/**
	 * @return the rows
	 */
	public String getRows() {
		return rows;
	}

	/**
	 * @param rows the rows to set
	 */
	public void setRows(String rows) {
		this.rows = rows;
	}
	
	
	public String driverExport() {
		Map map = new HashMap();
		Map<String,String> paramMap=new HashMap<String, String>();
		// 判断查询条件
		if(rows==null){
			paramMap.put("cdname", "");
		}else{
			JSONObject js = JSONObject.fromObject(rows);
			String cdname = js.getString("cdname");
			paramMap.put("cdname", cdname);
			paramMap.put("startTime", js.getString("startTime"));
			paramMap.put("endTime", js.getString("endTime"));
		}
		List list = audiServiceDispatcher.getContactDriverService().findByScreen(paramMap);
		// 第一步，创建一个workbook，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("试驾用户列表");
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
		cell.setCellValue("生日");
		cell.setCellStyle(style);
		cell = row.createCell((short) 3);
		cell.setCellValue("手机");
		cell.setCellStyle(style);
		cell = row.createCell((short) 4);
		cell.setCellValue("意向车型");
		cell.setCellStyle(style);
		cell = row.createCell((short) 5);
		cell.setCellValue("意向经销商");
		cell.setCellStyle(style);
		cell = row.createCell((short) 6);
		cell.setCellValue("计划购买时间");
		cell.setCellStyle(style);
		cell = row.createCell((short) 7);
		cell.setCellValue("是否已经有车");
		cell.setCellStyle(style);
		cell = row.createCell((short) 8);
		cell.setCellValue("已有车辆品牌");
		cell.setCellStyle(style);
		cell = row.createCell((short) 9);
		cell.setCellValue("已有车辆型号");
		cell.setCellStyle(style);
		cell = row.createCell((short) 10);
		cell.setCellValue("车架号");
		cell.setCellStyle(style);
		cell = row.createCell((short) 11);
		cell.setCellValue("创建时间");
		cell.setCellStyle(style);
		
		String fileName = "";
		try {
			//省市
			Map<Long, String > cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryMap();
			//进销商
			Map<Long, String > dealMap = audiServiceDispatcher.getUtilDao().getDealerMap();
			for (int i = 0; i < list.size(); i++) {
				row = sheet.createRow((int) i + 1);
				ContactDriver cd = (ContactDriver) list.get(i);
				if(cd!=null){
					row.createCell((short) 0).setCellValue(CommonUtil.getCellString(cd.getCdName()));  //姓名
					row.createCell((short) 1).setCellValue(CommonUtil.getGender(cd.getCdGender())); //性别
					row.createCell((short) 2).setCellValue(CommonUtil.getCellString(cd.getCdBirthday()));
					row.createCell((short) 3).setCellValue(CommonUtil.getCellString(cd.getCdMobile()));  
					
					String intentom="";
					if(!CmsUtils.isEmpty(cd.getCdIntentmodels())){
						intentom=cacheMap.get(cd.getCdIntentmodels());
					}
					row.createCell((short) 4).setCellValue(intentom);
					String intentdealer="";
					if(!CmsUtils.isEmpty(cd.getCdIntentmodels())){
						intentdealer=dealMap.get(cd.getCdIntentmodels());
					}
					row.createCell((short) 5).setCellValue(intentdealer);
					row.createCell((short) 6).setCellValue(CommonUtil.getCellString(cd.getCdPlanbuytime()));
					row.createCell((short) 7).setCellValue(CommonUtil.yesOrNo(cd.getCdIscar()));
					String brand="";
					if(!CmsUtils.isEmpty(cd.getCdBrand())){
						brand=cacheMap.get(cd.getCdBrand());
					}
					row.createCell((short) 8).setCellValue(brand);
					String model="";
					if(!CmsUtils.isEmpty(cd.getCdModel())){
						model=cacheMap.get(cd.getCdModel());
					}
					row.createCell((short) 9).setCellValue(model);
					row.createCell((short) 10).setCellValue(CommonUtil.getCellString(cd.getCdFootnum()));
					row.createCell((short) 11).setCellValue(CommonUtil.getCellString(cd.getCdAddtime()));
				}
			}
			File filepath = new File(ServletActionContext.getServletContext().getRealPath(SAVEURL));
			if (!filepath.exists() && !filepath.isDirectory()) {
				filepath.mkdirs();
			}
			fileName = "driver"+DateUtil.getNowDate("yyyy-MM-dd") + ".xls";
			File file = new File(ServletActionContext.getServletContext()
					.getRealPath(SAVEURL)
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

	
}
