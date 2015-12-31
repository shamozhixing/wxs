/**
 * 
 */
package com.oemp.audi.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.bean.Dealer;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.CommonUtil;
import com.oemp.cms.action.AdminAction;
import com.oemp.common.UtilTools;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;
import com.oemp.frame.util.DateUtil;

/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-5-20
 */
@Controller("audi.action.DealerAction")
@Scope("prototype")
public class DealerAction extends AdminAction{
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	private int page;
	private int limit;
	private String rows;
	private Dealer dealer=new Dealer();
	PageTools<Dealer> pt;
	//checkbox
	public Map getModellist(){
		List list = audiServiceDispatcher.getCmsDictionaryService().getByUpidByFlag(CommonUtil.audionetype);
		CmsDictionary cd = new CmsDictionary();
		Map modellist = new HashMap();
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				cd = (CmsDictionary)list.get(i);
				modellist.put(cd.getCid(),cd.getCnname());
			}
		}
		return modellist; 
	}
	//初始化页面
	public String init(){
		return SUCCESS;
	}
	//分页查询
	@SuppressWarnings("unchecked")
	public String query(){
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		page = page == 0 ? 0 : page;
		limit = limit == 0 ? 50 : limit;
		Map screenMap=new HashMap();
		if(rows==null){			
			screenMap.put("dealerName","");
		}else{
			JSONObject js=JSONObject.fromObject(rows);
			String province=js.getString("province");
			String city=js.getString("city");
			String type=js.getString("type");
			screenMap.put("dealerName",js.getString("dealername"));
			screenMap.put("province",province);
			screenMap.put("city",city);
			screenMap.put("type",type);
			screenMap.put("startTime", js.getString("startTime"));
			screenMap.put("endTime", js.getString("endTime"));
		}
		pt=audiServiceDispatcher.getDealerService().findByHql(page, limit, screenMap);
		Map map = new HashMap();
		map.put("ROOT", pt.getList());
		map.put("totalCount", pt.getTotalCount());
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
		return null;
	}
	/**
	 * 删除
	 */
    public void del(){
    	boolean del=false;
    	net.sf.json.JSONArray objArr = net.sf.json.JSONArray.fromObject(rows);
        for(int i=0;i<objArr.size();i++)
        {
        	net.sf.json.JSONObject js = objArr.getJSONObject(i);
        	//将 String 转化为 Integer 删除
        	String strid = js.getString("aid");
        	long id=Long.parseLong(strid);
        	 del=audiServiceDispatcher.getDealerService().delete(id);
        	if(!del){
        		break;
        	}
        }
        //获取数据
        StringBuffer jsonString =new StringBuffer();
        if(del){
        		jsonString.append("{");
		        jsonString.append("success:true,");
		        jsonString.append("msg:'删除成功'");
		        jsonString.append("}");
        }else{
        	jsonString.append("{");
	        jsonString.append("success:false,");
	        jsonString.append("msg:'删除失败'");
	        jsonString.append("}");
        }
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
    
    
    public List<CmsDictionary> getProvinceAll(){
    	List<CmsDictionary>  prolist=audiServiceDispatcher.getDealerService().getProvinceAll();
    	return prolist;
    	
    }
    private long provinceId ;//省份id
    /**
     * 获取全部省份
     */
    public void getCityByPid(){
    	List<CmsDictionary>  list=new ArrayList<CmsDictionary>();
    	 Map map = new HashMap();
    	if(provinceId==0){
    		map.put("list",new ArrayList());
			map.put("totalCount", 0);
    	}else{
    	 list=audiServiceDispatcher.getDealerService().getCityAll(provinceId);
			map.put("list",list);
			map.put("totalCount", list.size());
    	}
    	String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
    }
    /**
     * 保存或修改经销商
     * 
     */
    public String saveOrUpdate(){
    	ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
    	//数据
    	JSONObject js=JSONObject.fromObject(rows);
    	 Long city=js.getLong("city");//城市ID(CMS_DICTIONARY外键)
		 Long province=js.getLong("province");//省ID(CMS_DICTIONARY外键)
		 String dealername=js.getString("dealername");//经销商名称
		 String dealerenname=js.getString("dealerenname");//经销商英文名称
		 String address=js.getString("address");//经销商地址
		 String enaddress=js.getString("enaddress");//经销商英文地址
		 String dealerLongitude=js.getString("dealerLongitude");//经度
		 String dealerDimension=js.getString("dealerDimension"); //纬度
		 String postalcode=js.getString("postalcode"); //邮编
		 String url=js.getString("url"); //经销商网址
		 String areanum=js.getString("areanum"); //区号
		 String phone=js.getString("phone"); //销售电话
		 String servicephone=js.getString("servicephone");//服务电话
		 String fax=js.getString("fax");//传真
		 String model=js.getString("model").replaceAll(",", "，");//销售车型
		 String issecond=js.containsKey("issecond")?js.getString("issecond"):"";//是否二手车服务  1：是；0：否。
		 String contact=js.getString("contact");//二手车服务人姓名
		 //String contactEn=js.getString("contactEn");//二手车主管英文姓名
		 String contactPhone=js.getString("contactPhone");//二手车服务手机
		 String contactTel=js.getString("contactTel");//二手车服务电话
		 String contactEmail=js.getString("contactEmail");//二手车服务邮箱
		 String isRescue=js.containsKey("isRescue")?js.getString("isRescue"):"";	//是否24小时救援
		 String rescuePhone=js.getString("rescuePhone");//24小时救援手机
		 String rescueTel=js.getString("rescueTel");//24小时救援电话
		 Integer availabilityflag=js.containsKey("availabilityflag")?js.getInt("availabilityflag"):0;//经销商是否有效  1：是；0：否。
		 Long ordernum=CmsUtils.isEmpty(js.get("ordernum"))?100:js.getLong("ordernum");//序号
		 String isr8=js.containsKey("isr8")?js.getString("isr8"):"";//是否R8经销商 1：是；0：否。
		 String islimit=js.containsKey("islimit")?js.getString("islimit"):"";//单向服务 1:双向；0：单向。
		 String businessTime=js.getString("businessTime");		//服务时间
		// String businessTime1=js.getString("");		//服务时间1
		
		 Integer bid=0;				// 隐藏域
		 if(getCmsUser()!=null){
			 bid=getCmsUser().getCmuId();
			}
		 Date addtime=DateUtil.getNowDate();//添加时间
		 Integer lastmodify=0;
		 if(getCmsUser()!=null){
			 lastmodify=getCmsUser().getCmuId();//最后修改人
		 }
		 Date lasttime=DateUtil.getNowDate();			//最后修改时间
		 Dealer de=new Dealer();
			de.setCity(city);			//城市ID(CMS_DICTIONARY外键)
			de.setProvince(province);		//省ID(CMS_DICTIONARY外键)
			de.setDealername(dealername);			//经销商名称
			de.setDealerenname(dealerenname);		//经销商英文名称
			de.setAddress(address);				//经销商地址
			de.setEnaddress(enaddress);			//经销商英文地址
			de.setDealerLongitude(dealerLongitude);		//经度
			de.setDealerDimension(dealerDimension);		//纬度
			de.setPostalcode(postalcode);			//邮编
			de.setUrl(url);					//经销商网址
			de.setAreanum(areanum);				//区号
			de.setPhone(phone);				//销售电话
			de.setServicephone(servicephone);		//服务电话
			de.setFax(fax);					//传真
			de.setModel(model);				//销售车型
			de.setIssecond(issecond);			//是否二手车服务  1：是；0：否。
			de.setContact(contact);				//二手车服务人姓名
			de.setContactPhone(contactPhone);		//二手车服务手机
			de.setContactTel(contactTel);			//二手车服务电话
			de.setContactEmail(contactEmail);		//二手车服务邮箱
			de.setIsRescue(isRescue);			//是否24小时救援
			de.setRescuePhone(rescuePhone);			//24小时救援手机
			de.setRescueTel(rescueTel);			//24小时救援电话
			de.setAvailabilityflag(availabilityflag);	//经销商是否有效  1：是；0：否。
			de.setOrdernum(ordernum);				//序号
			de.setIsr8(isr8);				//是否R8经销商 1：是；0：否。
			de.setIslimit(islimit);				//单向服务 1:双向；0：单向。
			de.setBusinessTime(businessTime);		//服务时间
			de.setLasttime(lasttime);				//最后修改时间
    	//是修改
		if(js.containsKey("aid")){
			long aid=js.getLong("aid");
			de.setAid(aid);
			de.setLastmodify(lastmodify);			//最后修改人
		}else{
			de.setAddtime(addtime);				//添加时间
			de.setBid(bid);	// 隐藏域
		}
		Dealer obj=audiServiceDispatcher.getDealerService().saveOrUpdate(de);
		boolean isSuc=true;
		String msg="操作成功!";
		if(CmsUtils.isEmpty(obj)){
			isSuc=false;
			msg="操作失败!";
		}
		Map map = new HashMap();
		map.put("msg",msg);
		map.put("success", true);
		map.put("isSuc", isSuc);
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
    	return null;
    }
    
    /**生成js*/
    public void downJs(){
    	Map map=new HashMap();
		try{
			Map provincelist = audiServiceDispatcher.getDealerService().dealerprovince(CommonUtil.provinceid);
			StringBuffer fileContent = new StringBuffer("");
			fileContent.append("var dprovinces = [];\n var dcitys = [];\n var dealers = [];\n");
			Iterator e = provincelist.keySet().iterator();
			int i=0;
			StringBuffer sb = new StringBuffer("");
			while(e.hasNext()){
				Object key = e.next();
				fileContent.append("dprovinces["+i+"]=['"+key+"','"+provincelist.get(key)+"'];\n");
				Map citylist = audiServiceDispatcher.getDealerService().dealercity(Long.parseLong(key.toString()));
				Iterator ec = citylist.keySet().iterator();
				fileContent.append("dcitys['"+key+"']=[");
				while(ec.hasNext()){
					Object ckey = ec.next();
					fileContent.append("['"+ckey+"','"+citylist.get(ckey)+"'],");
					sb.append("dealers['"+ckey+"']=[");
					Map dealermap = audiServiceDispatcher.getDealerService().dealer(Long.parseLong(ckey.toString()));
					Iterator de = dealermap.keySet().iterator();
					while(de.hasNext()){
						Object dkey = de.next();
						sb.append("['"+dkey+"','"+dealermap.get(dkey)+"'],");
					}
					sb.deleteCharAt(sb.length()-1);
					sb.append("];\n");
				}
				fileContent.deleteCharAt(fileContent.length()-1);
				fileContent.append("];\n");
				
				i++;
			}
			fileContent.append(sb.toString());
			String path = ServletActionContext.getServletContext().getRealPath(CommonUtil.downJsPath);
			File pathFile=new File(path);
			if(!pathFile.exists()){
				pathFile.mkdirs();
			}
			String fileName = path + File.separator + "tb_dealer.js";
			CommonUtil.write(fileName,fileContent.toString());
			map.put("msg", "生成成功!");
		}catch(Exception e){
			e.printStackTrace();
			map.put("msg", "生成失败!"+e.getLocalizedMessage());
		}
		String jsonString = UtilTools.getJsonForObject(map);
		this.renderJson(jsonString);
	}
    
	/**
	 * @return the dealer
	 */
	public Dealer getDealer() {
		return dealer;
	}
	/**
	 * @param dealer the dealer to set
	 */
	public void setDealer(Dealer dealer) {
		this.dealer = dealer;
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

	/**
	 * @return the provinceId
	 */
	public long getProvinceId() {
		return provinceId;
	}
	/**
	 * @param provinceId the provinceId to set
	 */
	public void setProvinceId(long provinceId) {
		this.provinceId = provinceId;
	}
	
}
