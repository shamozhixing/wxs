package com.oemp.audi.action;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.CommonUtil;
import com.oemp.cms.action.AdminAction;
import com.oemp.common.UtilTools;
import com.oemp.frame.page.PageTools;

/**
 * 字典管理
 * @author Administrator
 * 
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.action.CmsDictionaryAction")
public class CmsDictionaryAction extends AdminAction {

	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	private long cid=0;
	/** 跳转 */
	public String index() {
		return "index";
	}

	/** 获取信息 */
	public String query() {
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		page = page == 0 ? 0 : page;
		limit = limit == 0 ? 50 : limit;
		Map<String, Object> screenMap = new HashMap<String, Object>();
		if (rows != null) { // 如果由检索条件
			net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
			screenMap.put("upid", js.getLong("upid"));
		}
		pt = audiServiceDispatcher.getCmsDictionaryService().findByHql(page, limit, screenMap);
		Map map = new HashMap();
		map.put("ROOT", pt.getList());
		map.put("TOTALCOUNT", pt.getTotalCount());
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
		return null;
	}

	/**
	 * 获取子信息
	 * @return
	 */
	public String queryByUpid(){
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		page = page == 0 ? 0 : page;
		limit = limit == 0 ? 50 : limit;
		//是否按照条件检索数据
		if(null!=js && !js.isEmpty())
		{
			query();
			return null;
		}
		Map<String, Object> screenMap = new HashMap<String, Object>();
		screenMap.put("upid",cid);
		pt=audiServiceDispatcher.getCmsDictionaryService().findByHql(page, limit, screenMap);
		Map map=new HashMap();
		map.put("ROOT", pt.getList());
		map.put("TOTALCOUNT", pt.getTotalCount());
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderText(jsonString);
		return null;
	}
	
	public String getDictionaryTypeData(){
		List<CmsDictionary> list=audiServiceDispatcher.getCmsDictionaryService().getByUpid(Long.valueOf(0));
		String jsonStr="";
		for (CmsDictionary dic : list) {
			if(jsonStr!=""){
				jsonStr+=",";
			}
			jsonStr+="{value:"+dic.getCid()+",text:\""+dic.getCnname()+"\"}";
		}
		return jsonStr;
		
	}
	
	public String getDictionaryTreeById(){
		String jsonTree=audiServiceDispatcher.getCmsDictionaryService().getDictionaryTreeByUpid(cid);
		this.renderJson(jsonTree);
		return null;
	}
	/**
	 * 更新信息
	 */
	public String saveOrUpdate() {
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		 
		
		Map map = new HashMap();
		boolean isSuc=true;
		try {
			 Long cid=js.containsKey("cid")?js.getLong("cid"):null;//主键
			  Long upid=js.containsKey("upid")?js.getLong("upid"):null;//父级id
			  String cnname=js.containsKey("cnname")?js.getString("cnname"):null;//中文名称
			  String enname=js.containsKey("enname")?js.getString("enname"):null;//英文名称
			  String remark=js.containsKey("remark")?js.getString("remark"):null;//备注
			  Long availabilityflag=js.containsKey("availabilityflag")?js.getLong("availabilityflag"):null;//是否有效
			  Long ordernum=js.containsKey("ordernum")?js.getLong("ordernum"):null;//排序
			  String standby1=js.containsKey("standby1")?js.getString("standby1"):null;//备用字段
			  String standby2=js.containsKey("standby2")?js.getString("standby2"):null;//备用字段
			CmsDictionary dic=new CmsDictionary(upid, cnname, enname, remark, availabilityflag, ordernum, standby1, standby2);
			if(null!=cid){
				dic.setCid(cid);
			}
			isSuc=audiServiceDispatcher.getCmsDictionaryService().saveOrUpdate(dic);
			map.put("success", "true");
			map.put("isSuc", isSuc);
			map.put("msg", "操作成功!");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "true");
			map.put("isSuc", false);
			map.put("msg", e.getMessage());
		}
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
		return null;
	}
	private void savsJs(Long upid, String filename, String pname, String name){
			String path = ServletActionContext.getServletContext().getRealPath(CommonUtil.downJsPath);
			File pathFile=new File(path);
			if(!pathFile.exists()){
				pathFile.mkdirs();
			}
			String fileName = path + File.separator + filename;
			StringBuffer fileContent = new StringBuffer("var "+pname+" = [];var "+name+"=[];\n");
			List datalist = audiServiceDispatcher.getCmsDictionaryService().getByUpidByFlag(upid);
			for(int i=0;i<datalist.size();i++){
				CmsDictionary cd = (CmsDictionary)datalist.get(i);
				List cdatalist = audiServiceDispatcher.getCmsDictionaryService().getByUpidByFlag(cd.getCid());
				fileContent.append(pname+"["+i+"]=['"+cd.getCid()+"','"+cd.getCnname().trim()+"'];\n");
				fileContent.append(name+"['"+cd.getCid()+"']=[");
				for(int c=0;c<cdatalist.size();c++){
					CmsDictionary ccd = (CmsDictionary)cdatalist.get(c);
					fileContent.append("['"+ccd.getCid()+"','"+ccd.getCnname().trim()+"']");
					if(c<cdatalist.size()-1){
						fileContent.append(",");
					}
				}
				fileContent.append("];\n");
			}
			CommonUtil.write(fileName,fileContent.toString());
	}
	private void saveCitysJs(Long upid){
		savsJs(upid, "dict_citys.js", "provinces", "citys");
	}
	private void saveBrandJs(Long upid){
		savsJs(upid, "dict_brands.js", "brands", "brandmodels");
	}
	private void saveModelJs(Long upid){
		savsJs(upid, "dict_autos.js", "autos", "autosmodel");
	}
	
	/**
	 * downjs
	 */
	public void downJs(){
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		net.sf.json.JSONObject js = net.sf.json.JSONObject.fromObject(rows);
		Map map=new HashMap();
		try {
			int jsType=js.getInt("jstype");
			//省市
			if(jsType==0){
				saveCitysJs(CommonUtil.provinceid);
			}else if(jsType==1){//品牌
				saveBrandJs(CommonUtil.brandid);
			}else if(jsType==2){//audi汽车
				saveModelJs(CommonUtil.audionetype);
			}
			map.put("msg", "生成成功!");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "生成失败!"+e.getLocalizedMessage());
		}
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
	}
	
	private int start;// 分页开始
	private int limit;// 每页显示量
	private int page; // 当前页
	private String rows; // 前端提交信息
	private PageTools<CmsDictionary> pt;
	

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
	 * @return the cid
	 */
	public long getCid() {
		return cid;
	}

	/**
	 * @param cid the cid to set
	 */
	public void setCid(long cid) {
		this.cid = cid;
	}

	



}
