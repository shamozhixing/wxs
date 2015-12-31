package com.oemp.audi.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.ContactProductbook;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.FileUpload;
import com.oemp.cms.action.AdminAction;
import com.oemp.cms.util.ServiceDispatcher;
import com.oemp.common.UtilTools;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;
import com.oemp.frame.util.DateUtil;

/**
 * 产品手册
 * @author Administrator
 * 
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.action.ContactProductbookAction")
public class ContactProductbookAction extends AdminAction {

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
			String cpBookname=js.get("cpBookname")==null?"":js.getString("cpBookname");
			String cpType=js.get("cpType")==null?"":js.getString("cpType");
			screenMap.put("cpBookname", CmsUtils.isEmpty(cpBookname)?"":cpBookname);
			screenMap.put("cpType", CmsUtils.isEmpty(cpType)?"":cpType);
			screenMap.put("startTime", js.getString("startTime"));
			screenMap.put("endTime", js.getString("endTime"));
			
		}
		pt = audiServiceDispatcher.getContactProductbookService().findByHql(page, limit, screenMap);
		Map map = new HashMap();
		map.put("ROOT", pt.getList());
		map.put("totalCount", pt.getTotalCount());
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
		return null;
	}

	/**
	 * 添加
	 * @return
	 */
	public String add(){
		
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		Map map = new HashMap();
		try {
			if(CmsUtils.isEmpty(cpPdf)){
				map.put("success", "true");
				map.put("isSuc", "false");
				map.put("msg", "请填写完整信息!");
			}
			else if (rows != null) {
				net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
				ContactProductbook cpBean=new ContactProductbook();
				boolean imgIsUpload=true,pdfIsUpload=true;
				if(!CmsUtils.isEmpty(cpImg)){
					imgIsUpload=FileUpload.imgFileSave(cpImg, getRootPathDir(UPLOADDIR)+"/"+cpImgFileName);
					cpBean.setCpImg(UPLOADDIR+cpImgFileName);
				}
				
				pdfIsUpload=FileUpload.fileSave(cpPdf, getRootPathDir(UPLOADDIR)+"/"+cpPdfFileName);
				if(!pdfIsUpload || !imgIsUpload){
					map.put("success", "true");
					map.put("isSuc", "false");
					map.put("msg", "文件上传失败!");
				}else{
					cpBean.setCpAddtime(DateUtil.getNowDate());
					cpBean.setCpOrder(js.getInt("cpOrder"));
					cpBean.setCpBookname(js.getString("cpBookname"));
					cpBean.setCpIntentcars(js.getInt("cpIntentcars"));
					cpBean.setCpIspub(js.getInt("cpIspub"));
					cpBean.setCpPagename(js.getString("cpPagename"));
					cpBean.setCpPdf(UPLOADDIR+cpPdfFileName);
					cpBean.setCpType(js.getString("cpType"));
					cpBean.setCpIntentname(js.getString("cpIntentname"));
					audiServiceDispatcher.getContactProductbookService().saveOrUpdate(cpBean);
					map.put("success", "true");
					map.put("isSuc", "true");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "true");
			map.put("isSuc", "false");
			map.put("msg", e.getMessage());
		}
		String jsonString = UtilTools.getJsonForObject(map);
		PrintWriter out;
		try {
			ServletActionContext.getResponse().setContentType("text/html");
			out = ServletActionContext.getResponse().getWriter();
			out.print(jsonString);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 更新信息
	 */
	public String update() {
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		Map map = new HashMap();
		try {
			if (rows != null) {
				net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
				Integer cpId=js.getInt("cpId");
				ContactProductbook cpBean=audiServiceDispatcher.getContactProductbookService().getById(cpId);
				if(cpBean!=null){
						Boolean isUpCpImg=js.getBoolean("isUpCpImg");
						Boolean isUpCpPdf=js.getBoolean("isUpCpPdf");
						boolean imgIsUpload=true,pdfIsUpload=true;
						if(isUpCpImg){
							imgIsUpload=FileUpload.imgFileSave(cpImg, getRootPathDir(UPLOADDIR)+"/"+cpImgFileName);
							cpBean.setCpImg(UPLOADDIR+cpImgFileName);
						}
						if(isUpCpPdf){
							pdfIsUpload=FileUpload.fileSave(cpPdf, getRootPathDir(UPLOADDIR)+"/"+cpPdfFileName);
							cpBean.setCpPdf(UPLOADDIR+cpPdfFileName);
						}
						if(!imgIsUpload || !pdfIsUpload){
							map.put("success", "true");
							map.put("isSuc", "false");
							map.put("msg", "文件上传失败!");
						}else{
							cpBean.setCpOrder(js.getInt("cpOrder"));
							cpBean.setCpBookname(js.getString("cpBookname"));
							cpBean.setCpIntentcars(js.getInt("cpIntentcars"));
							cpBean.setCpIspub(js.getInt("cpIspub"));
							cpBean.setCpPagename(js.getString("cpPagename"));
							cpBean.setCpType(js.getString("cpType"));
							cpBean.setCpIntentname(js.getString("cpIntentname"));
							audiServiceDispatcher.getContactProductbookService().saveOrUpdate(cpBean);
							map.put("success", "true");
							map.put("isSuc", "true");
						}
					}else{
						map.put("success", "true");
						map.put("isSuc", "false");
						map.put("msg", "请填写完整信息!");
					}
				}else{
					map.put("success", "true");
					map.put("isSuc", "false");
					map.put("msg", "不存在该信息");
				}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "true");
			map.put("isSuc", "false");
			map.put("msg", e.getMessage());
		}
		String jsonString = UtilTools.getJsonForObject(map);
		PrintWriter out;
		try {
			ServletActionContext.getResponse().setContentType("text/html");
			out = ServletActionContext.getResponse().getWriter();
			out.print(jsonString);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String updateStatus(){
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		Map map = new HashMap();
		try {
			if (rows != null) {
				net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
				Integer cpId=js.getInt("cpId");
				ContactProductbook cpBean=audiServiceDispatcher.getContactProductbookService().getById(cpId);
				if(cpBean!=null){
					Integer cpIspub = cpBean.getCpIspub()==0?1:0;
					cpBean.setCpIspub(cpIspub);
					audiServiceDispatcher.getContactProductbookService().saveOrUpdate(cpBean);
					map.put("success", "true");
					map.put("isSuc", "true");
				}else{
					map.put("success", "true");
					map.put("isSuc", "false");
					map.put("msg", "请填写完整信息!");
				}
			}else{
				map.put("success", "true");
				map.put("isSuc", "false");
				map.put("msg", "不存在该信息");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "true");
			map.put("isSuc", "false");
			map.put("msg", e.getMessage());
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	private int start;// 分页开始
	private int limit;// 每页显示量
	private int page; // 当前页
	private String rows; // 前端提交信息
	private PageTools<ContactProductbook> pt;
	//--------------------上传文件start
	// 上传文件存放路径
	public final static String UPLOADDIR = "/uploadfiles/product/";
	// 上传文件
	private File cpImg;
	// 上传文件名
	private String cpImgFileName;
	// 上传文件内容类型
	private String cpImgContentType;
	
	// 上传文件
	private File cpPdf;
	// 上传文件名
	private String cpPdfFileName;
	// 上传文件内容类型
	private String cpPdfContentType;
	//--------------------上传文件end

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

	/**
	 * @return the cpImg
	 */
	public File getCpImg() {
		return cpImg;
	}

	/**
	 * @param cpImg the cpImg to set
	 */
	public void setCpImg(File cpImg) {
		this.cpImg = cpImg;
	}

	/**
	 * @return the cpImgFileName
	 */
	public String getCpImgFileName() {
		return cpImgFileName;
	}

	/**
	 * @param cpImgFileName the cpImgFileName to set
	 */
	public void setCpImgFileName(String cpImgFileName) {
		this.cpImgFileName = cpImgFileName;
	}

	/**
	 * @return the cpImgContentType
	 */
	public String getCpImgContentType() {
		return cpImgContentType;
	}

	/**
	 * @param cpImgContentType the cpImgContentType to set
	 */
	public void setCpImgContentType(String cpImgContentType) {
		this.cpImgContentType = cpImgContentType;
	}

	/**
	 * @return the cpPdf
	 */
	public File getCpPdf() {
		return cpPdf;
	}

	/**
	 * @param cpPdf the cpPdf to set
	 */
	public void setCpPdf(File cpPdf) {
		this.cpPdf = cpPdf;
	}

	/**
	 * @return the cpPdfName
	 */
	public String getCpPdfFileName() {
		return cpPdfFileName;
	}

	/**
	 * @param cpPdfName the cpPdfName to set
	 */
	public void setCpPdfFileName(String cpPdfFileName) {
		this.cpPdfFileName = cpPdfFileName;
	}

	/**
	 * @return the cpPdfContentType
	 */
	public String getCpPdfContentType() {
		return cpPdfContentType;
	}

	/**
	 * @param cpPdfContentType the cpPdfContentType to set
	 */
	public void setCpPdfContentType(String cpPdfContentType) {
		this.cpPdfContentType = cpPdfContentType;
	}

	
	



}
