package com.oemp.audi.action.front;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.bean.Dealer;
import com.oemp.audi.dao.DealerDao;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.ChineseSpelling;
import com.oemp.audi.util.SendMessageUtil;

@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.action.front.ContactAudidealerinfoAction")
public class ContactAudidealerinfoAction extends ContactBaseAction{
	private String message = "";
	private long pid;
	private long cid;
	private long sid;
	private long nid;
	private String flag = "0";
	@SuppressWarnings("unchecked")
	Map provincelist;
	@SuppressWarnings("unchecked")
	Map citylist;
	@SuppressWarnings("unchecked")
	Map modellist;
	private String prostr="";
	private String layerid = "";
	private String dealername = "";
	private int pageSize = 10;
	private int pageNumber = 1;
//	private CommonFindPageRecord pagelist;
	@SuppressWarnings("unchecked")
	private List listlj;
	
	private HttpServletRequest request = ServletActionContext.getRequest ();
	private HttpServletResponse response = ServletActionContext.getResponse();
	private Dealer dealer = new Dealer();
	private static final String DEALERLIST = "dlif";
	private static final String DETAILDEALER = "adds";
	private static final String DEALER = "dealer";
	private static final String MAPDER = "mapder";
	
	
	@Autowired
	private DealerDao dealerDao;
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
//	private SqlstrDao sqlstrDao;
//	@Resource(name="SqlstrDaoIMP")
//	public void setSqlstrDao(SqlstrDao dao){
//		this.sqlstrDao = dao;
//	}
	
//	private DictionaryDao dictionaryDao;
//	@Resource(name="DictionaryDaoIMP")
//	public void setDictionaryDao(DictionaryDao dao){
//		this.dictionaryDao = dao;
//	}
	
//	private CommonDao commonDao;
//	@Resource(name="CommonDaoIMP")
//	public void setCommonDao(CommonDao dao){
//		this.commonDao = dao;
//	}
	
//	public String execute() throws Exception {
//		try {
//			GetProperties pro = new GetProperties("dictionary");
//			provincelist = sqlstrDao.dealerprovince(Long.parseLong(pro.getProp("provinceid")),"0");
//			Iterator it1 = provincelist.keySet().iterator();
//			if (it1.hasNext()) {
//				citylist = sqlstrDao.dealercity((Long) it1.next(),"0");
//				it1 = citylist.keySet().iterator();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return DEALER;
//	}

	public String dealer() throws Exception {
		try {
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String cxlx() throws Exception {
		
		return "dituss";
	}
	
	String provincename="";
	
	public String getProvincename() {
		return provincename;
	}

	public void setProvincename(String provincename) {
		this.provincename = provincename;
	}

	@SuppressWarnings("unchecked")
	public String pross() throws Exception {
		ServletActionContext.getResponse().setContentType("text/xml; charset=UTF-8"); 
		try {
			prostr="";
			ArrayList pros=new ArrayList();
		if(request.getParameter("lbids")!=null){
			String lbid=request.getParameter("lbids").toString();
			listlj=dealerDao.getDealerlist("", "", lbid);
			
			//省市
			Map<Long, String > cacheMap = null;
			
			if(request.getParameter("en")==null){
				cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryMap();
			} else {
				cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryEnMap();
			//进销商
			}
			
			
			
		    for(int i=0;i<listlj.size();i++){
		    	Dealer adif=(Dealer)listlj.get(i);
		    	
		    	//获得省份名称
				provincename = cacheMap.get(adif.getProvince()).toString();
				pros.add(adif.getProvince().toString()+"," + cacheMap.get(adif.getProvince()).toString() + "#");
		    	
		    	
		    }
		    if(pros!=null){
		    	pros=diff(pros);
		    	pros=(ArrayList) arraySortByPy(pros);
		    	for(int i=0;i<pros.size();i++){
		    		if(i==(pros.size()-1)){
		    			prostr+=pros.get(i).toString().replace("#", "");
		    		}else{
		    			prostr+=pros.get(i).toString();
		    		}
		    		//prostr+=pros.get(i).toString();
			    }
		    }
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 //System.out.println(prostr);
		//PrintWriter out = response.getWriter(); 
		PrintWriter pw = ServletActionContext.getResponse().getWriter();  
        pw.print(prostr);  
        pw.close(); 
		//out.print(prostr);
		return  null;
	}
	//拼音排序list
	private ArrayList arraySortByPy( List pros){
		//将pros(只含有id和省份中文名称) 改为chinaPy（含有id、省份中文名称、省份拼音）
		ArrayList chinaPy=new ArrayList();
		for (Object object : pros) {
			chinaPy.add(object.toString());
		}
		
		//对chinaPy（含有id、省份中文名称、省份拼音）排序
		Collections.sort(chinaPy, new Comparator() {
			public int compare(Object o1, Object o2) {
				String o1String = o1.toString().substring(o1.toString().lastIndexOf(",")+1).trim();
				String o2String = o2.toString().substring(o2.toString().lastIndexOf(",")+1).trim();
				String propinyin2="";
				String propinyin1="";
				if(ChineseSpelling.getInstance().getSelling(o1String).equals("zuozhou#")){
					propinyin1="luzhou";
				}else{
					 propinyin1=ChineseSpelling.getInstance().getSelling(o1String).equals("zhongqing")?"chongqing":ChineseSpelling.getInstance().getSelling(o1String);
					}
				if(ChineseSpelling.getInstance().getSelling(o2String).equals("zuozhou#")){
					 propinyin1="luzhou";
				}else{
					 propinyin2=ChineseSpelling.getInstance().getSelling(o2String).equals("zhongqing")?"chongqing":ChineseSpelling.getInstance().getSelling(o2String);
					}
				return propinyin1.compareTo(propinyin2);
			}
			
		});
		return chinaPy;
	}

	@SuppressWarnings("unchecked")
	public String ctiys() throws Exception {
		ServletActionContext.getResponse().setContentType("text/xml; charset=UTF-8");
		String prostr1="";
		try {
			ArrayList pros=new ArrayList();
		if(request.getParameter("pid")!=null){
			String lbid="";
			if(request.getParameter("lbids")!=null&&request.getParameter("lbids").toString()!=""){
				lbid=request.getParameter("lbids").toString();
			}
			String pid1=request.getParameter("pid").toString();
			listlj=dealerDao.getDealerlist(pid1,"",lbid);
			//中文
			Map<Long, String > cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryMap();
			//英文
			Map<Long, String > cacheEnMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryEnMap();
		    for(int i=0;i<listlj.size();i++){
		    	Dealer adif=(Dealer)listlj.get(i);
		    	if(request.getParameter("en")==null){
		    		pros.add(adif.getCity().toString()+"," + cacheMap.get(adif.getCity()).toString() + "#");
		    	}else
		    	{
		    		pros.add(adif.getCity().toString()+"," + cacheEnMap.get(adif.getCity()).toString() + "#");
		    	}
		    }
		    if(pros!=null){
		    	pros=diff(pros);
		    	ArrayList chinaPy=(ArrayList) arraySortByPy(pros);	 
		    	for(int i=0;i<chinaPy.size();i++){
		    		if(i==(chinaPy.size()-1)){
		    			prostr1+=chinaPy.get(i).toString().replace("#", "");
		    		}else{
		    			prostr1+=chinaPy.get(i).toString();
		    		}
		    		
			    }
		    }
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter pw = ServletActionContext.getResponse().getWriter();  
        pw.print(prostr1);  
        pw.close(); 
		
        return null;
	}
	
	//分页
	@SuppressWarnings("unchecked")
	public String fenye() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String retstr="procitylist";
		String sizefy="0";
		if(request.getParameter("sizefy")!=null){
			if(request.getParameter("xia")!=null){
				String a=request.getParameter("sizefy").toString();
				sizefy=(Integer.parseInt(a)+1)+"";
			}else{
				sizefy=request.getParameter("sizefy").toString();
			}
		}
		int listljsize=Integer.parseInt(session.getAttribute("listljsize").toString());
		
		
		List ls=(List)session.getAttribute("listljs");
		List listlj2=new ArrayList();
		if(Integer.parseInt(sizefy)==(listljsize-1)){
			
			for(int i=Integer.parseInt(sizefy)*10;i<ls.size();i++){
				Dealer adif=(Dealer)ls.get(i);
				listlj2.add(adif);
			}
		}else{
			
			for(int i=Integer.parseInt(sizefy)*10;i<(Integer.parseInt(sizefy)+1)*10;i++){
				Dealer adif=(Dealer)ls.get(i);
				listlj2.add(adif);
			}	
		}
		session.setAttribute("listlj", listlj2);
		session.setAttribute("listljnum", (Integer.parseInt(sizefy)+1)+"");
		if(request.getParameter("en")==null){
    	}else
    	{
    		retstr="ndl02_en";
    	}
		return retstr;
	}
	/**
	 * 搜索
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String seljxs() throws Exception {
		String proid="";
		String cityid="";
		String lbid="";
		String retstr="procitylist";
		if(request.getParameter("fw")!=null){
			lbid=request.getParameter("fw").toString();
		}
		if(request.getParameter("pid")!=null){
			proid=request.getParameter("pid").toString();
		}
		if(request.getParameter("cid")!=null){
			cityid=request.getParameter("cid").toString();
		}
		ArrayList pros=new ArrayList();
		ArrayList pros1=new ArrayList();
		ArrayList pros2=new ArrayList();
		ArrayList pros12=new ArrayList();
		String prostr1="";
		String crty1="";
		List listlj1=dealerDao.getDealerlist(proid, cityid, lbid);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("listljs", listlj1);
		session.setAttribute("selcount", listlj1.size());
		/*if(listlj1.size()>10){
			session.setAttribute("listljnum", "1");
			int a=listlj1.size()/10+1;
			session.setAttribute("listljsize", a+"");
			
			List listlj2=new ArrayList();
			for(int i=0;i<10;i++){
				Dealer adif=(Dealer)listlj1.get(i);
				listlj2.add(adif);
			}
			session.setAttribute("listlj", listlj2);
			
		}else{
			session.setAttribute("listlj", listlj1);
			session.setAttribute("listljnum", "");
		}*/
		
		session.setAttribute("listlj", listlj1);
		session.setAttribute("lbid", lbid);
		session.setAttribute("proid", proid);
		session.setAttribute("cityid", cityid);
		List list1=dealerDao.getDealerlist("","",lbid);
		List list2=dealerDao.getDealerlist(proid,"",lbid);
		
		//中文
		Map<Long, String > cacheMap = null; 
		if(request.getParameter("en")==null){
			cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryMap();
		} else {
			//英文
			cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryEnMap();
			retstr="ndl02_en";
		}
		
		for(int i=0;i<list1.size();i++){
		    Dealer adif=(Dealer)list1.get(i);
		    pros.add(adif.getProvince().toString()+"," + cacheMap.get(adif.getProvince()).toString());
		}
		for(int i=0;i<list2.size();i++){
		    Dealer adif=(Dealer)list2.get(i);
		    pros1.add(adif.getCity().toString()+"," + cacheMap.get(adif.getCity()).toString());
	    }
		
		if(pros!=null){
			//去掉重复的省份名称
			pros = diff(pros);
			
			//将pros(只含有id和省份中文名称) 改为chinaPy（含有id、省份中文名称、省份拼音）
			List chinaPy=new ArrayList();
			for (Object object : pros) {
				String o1String = object.toString().substring(object.toString().indexOf(",")+1).trim();
				
				String propinyin=ChineseSpelling.getInstance().getSelling(o1String).equals("zhongqing")?"chongqing":ChineseSpelling.getInstance().getSelling(o1String);
				
				chinaPy.add(object.toString()+","+propinyin);
			}
			
			//对chinaPy（含有id、省份中文名称、省份拼音）排序
			Collections.sort(chinaPy, new Comparator() {
				public int compare(Object o1, Object o2) {
					String o1String = o1.toString().substring(o1.toString().lastIndexOf(",")+1).trim();
					String o2String = o2.toString().substring(o2.toString().lastIndexOf(",")+1).trim();
					return o1String.compareTo(o2String);
				}
				
			});
		    for(int i=0;i<chinaPy.size();i++){
		    	String []q=chinaPy.get(i).toString().split(",");
		    	pros2.add(q);
		    }
		}
		if(pros1!=null){
		    pros1=diff(pros1);
		   // ArrayList chinaPy=(ArrayList) arraySortByPy(pros1);
		  //将pros(只含有id和省份中文名称) 改为chinaPy（含有id、省份中文名称、省份拼音）
			List chinaPy=new ArrayList();
			for (Object object : pros1) {
				String o1String = object.toString().substring(object.toString().indexOf(",")+1).trim();
				
				String propinyin=ChineseSpelling.getInstance().getSelling(o1String).equals("zuozhou")?"luzhou":ChineseSpelling.getInstance().getSelling(o1String);
				
				chinaPy.add(object.toString()+","+propinyin);
			}
			
			//对chinaPy（含有id、省份中文名称、省份拼音）排序
			Collections.sort(chinaPy, new Comparator() {
				public int compare(Object o1, Object o2) {
					String o1String = o1.toString().substring(o1.toString().lastIndexOf(",")+1).trim();
					String o2String = o2.toString().substring(o2.toString().lastIndexOf(",")+1).trim();
					return o1String.compareTo(o2String);
				}
				
			});
		    for(int i=0;i<chinaPy.size();i++){
		    	String []q=chinaPy.get(i).toString().split(",");
		    	pros12.add(q);
		    }
		}
		session.setAttribute("prostr1", pros2);
		session.setAttribute("crty1", pros12);
		
		return retstr;
	}
	
	@SuppressWarnings("unchecked")
	public String seljxs04() throws Exception {
		String retstr="procitydetail";
		HttpSession session = ServletActionContext.getRequest().getSession();
		Dealer da=new Dealer();
		try {
			if(session.getAttribute("listlj")!=null&&request.getParameter("n")!=null){
				
				List ls=(List)session.getAttribute("listlj");
				
				da=(Dealer)ls.get(Integer.parseInt(request.getParameter("n").toString()));

				List lss=(List)session.getAttribute("listljs");
				int dqs=Integer.parseInt(request.getParameter("n").toString());
				/*if(session.getAttribute("listljnum").toString().equals("2")){
					dqs=dqs+10;
				}
				lss.remove(dqs); */
				session.setAttribute("Ycnum",dqs);
				session.setAttribute("ListYc",lss);
			}
		} catch (RuntimeException e) {
			if(request.getParameter("n")!=null&&request.getParameter("en")!=null){
				retstr="ndl_en";
			}else{
				retstr="procity";
			}
			return retstr;
		}
		
		if(da!=null){
			session.setAttribute("dalj", da);
			//中文
			Map<Long, String > cacheMap = null; 
			if(request.getParameter("en")==null){
				cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryMap();
			} else {
				//英文
				cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryEnMap();
				retstr="ndl02_en";
			}
			provincename = cacheMap.get(da.getProvince());
		}
		
		
		if(request.getParameter("en")==null){
			
    	}else
    	{
    		retstr="ndl04_en";
    	}
		return retstr;
	}
	
	@SuppressWarnings("unchecked")
	public String seljxs08() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Dealer da=new Dealer();
		String retstr="procitydetail";
		if(session.getAttribute("listlj")!=null&&request.getParameter("n")!=null){
			
			List ls=(List)session.getAttribute("listljs");
			
			da=(Dealer)ls.get(Integer.parseInt(request.getParameter("n").toString()));


			int dqs=Integer.parseInt(request.getParameter("n").toString());
			
			session.setAttribute("Ycnum",dqs);
			session.setAttribute("ListYc",ls);
		}
		
		if(da!=null){
			session.setAttribute("dalj", da);
		}
		if(request.getParameter("en")==null){
    	}else
    	{
    		retstr="ndl04_en";
    	}
		
		return retstr;
	}
	
	public String seljxs05() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(request.getParameter("jss")!=null){
			Dealer da=new Dealer();
			String a=request.getParameter("jss").toString();
			Long aa=Long.parseLong(a);
			da=dealerDao.findbyid(aa);
			session.setAttribute("dalj", da);
		}else{
			return "";
		}
		
		return "";
	}
	
	//选择省份后获取城市列表 根据经销商类型
	@SuppressWarnings("unchecked")
	public String retss() throws Exception {
		try {
			ServletActionContext.getResponse().setContentType("text/xml; charset=UTF-8");
			if(request.getParameter("agency")!=null&&request.getParameter("agency").toString()!=""){
				String agency=request.getParameter("agency").toString();
				
				String hqlstr="from Dealer o where o.availabilityflag='1'  ";
				List ls=null;
				if(agency.equals("0")){
					//查所有
					//hqlstr+="  and o.availabilityflag='1' ";
				}else if(agency.equals("1")){
				   //查2手车的
					hqlstr+="     and  o.issecond='1'";
				}else if(agency.equals("2")){
					//查24小时救援的
					hqlstr+="   and o.isRescue='1'";
				}else {
					//查无效经销商
				}
				ls=dealerDao.getDealerlistbyhql(hqlstr +" order by ordernum ");
				ArrayList ac=new ArrayList();
				if(ls!=null){
					for(int i=0;i<ls.size();i++){
						ac.add(((Dealer)ls.get(i)).getProvince());
					}
				}
				ac=diff(ac);
				/*
				for(int i=0;i<ac.size();i++){
					System.out.println(ac.get(i).toString());
				}*/
				
				ArrayList acc=new ArrayList();
				if(ls!=null){
					for(int i=0;i<ls.size();i++){
						String  adif="";
						adif=((Dealer)ls.get(i)).getProvince().toString()
						+" "+((Dealer)ls.get(i)).getCity().toString();
						acc.add(adif);
					}
				}
				acc=diff(acc);
				ArrayList acs=new ArrayList();
				for(int i=0;i<acc.size();i++){
					String[] strs=(acc.get(i).toString()).split(" ");
					acs.add(strs);
				}
				
				Map<String,List> map=new HashMap<String,List>();
				if(ac!=null){
					for(int i=0;i<ac.size();i++){
						List listcitys=new ArrayList();
						for(int j=0;j<acs.size();j++){
							
							if(ac.get(i).toString().equals(((String[])acs.get(j))[0].toString())){
								listcitys.add(((String[])acs.get(j))[1].toString());
							}
						}
						map.put(ac.get(i).toString(), listcitys);
					
					}
					
				}
				
				String xmlstr="<?xml version=\"1.0\" encoding=\"UTF-8\" ?>   <provinceAndCity>";
				
				xmlstr+="";
				Iterator it=map.entrySet().iterator();
				while(it.hasNext()){
					Map.Entry entry=(Map.Entry)it.next();
					//System.out.println("键名");
					//System.out.println(entry.getKey());
					String str21=hqlstr+" and o.province = '"+entry.getKey()+"'";
					//String str2="from Dealer o where o.availabilityflag='1' and o.province = '"+entry.getKey()+"'";
					List  lsss=dealerDao.getDealerlistbyhql(str21 +" order by ordernum ");
					xmlstr+="<province id=\""+entry.getKey()+"\" name=\""+getnamebycid(entry.getKey().toString())+"\" total=\""+lsss.size()+"\">";
					for(int i=0;i<((List)entry.getValue()).size();i++){
						//System.out.println("键值");
						
						List lss=(List)entry.getValue();
						//String str22=hqlstr+" and o.dealerCity = '"+lss.get(i).toString()+"'";
						//List  lssss=dealerDao.getDealerlistbyhql(str22);
						xmlstr+="<city id=\""+lss.get(i).toString()+"\" name=\""+getnamebycid(lss.get(i).toString()).trim()+"\" /> ";
						//System.out.println(lss.get(i).toString());
					}
					xmlstr+=" </province>";
					//System.out.println("一个MAP");
				}
				
				xmlstr+="</provinceAndCity>";
				
				PrintWriter out = response.getWriter();   
		        out.print(xmlstr);  
		        
			
				
			}else{
				PrintWriter out = response.getWriter();   
				out.print("");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;//"te";
	}
	
//	选择省份后获取城市列表 根据经销商类型
//	public String retss_en() throws Exception {
//		try {
//			ServletActionContext.getResponse().setContentType("text/xml; charset=UTF-8");
//			if(request.getParameter("agency")!=null&&request.getParameter("agency").toString()!=""){
//				String agency=request.getParameter("agency").toString();
//				
//				String hqlstr="from Dealer o where o.availabilityflag='1'  ";
//				List ls=null;
//				if(agency.equals("0")){
//					//查所有//
//					//hqlstr+="  and o.availabilityflag='1' ";
//				}else if(agency.equals("1")){
//				   //查2手车的//
//					hqlstr+="     and  o.issecond='1'";
//				}else if(agency.equals("2")){
//					//查24小时救援的//
//					hqlstr+="   and o.isRescue='1'";
//				}else {
//					//查无效经销商//
//				}
//				ls=dealerDao.getDealerlistbyhql(hqlstr);
//				ArrayList ac=new ArrayList();
//				if(ls!=null){
//					for(int i=0;i<ls.size();i++){
//						ac.add(((Dealer)ls.get(i)).getProvince().getCid());
//					}
//				}
//				ac=diff(ac);
//				/*
//				for(int i=0;i<ac.size();i++){
//					System.out.println(ac.get(i).toString());
//				}*/
//				
//				ArrayList acc=new ArrayList();
//				if(ls!=null){
//					for(int i=0;i<ls.size();i++){
//						String  adif="";
//						adif=((Dealer)ls.get(i)).getProvince().getCid().toString()
//						+" "+((Dealer)ls.get(i)).getCity().getCid().toString();
//						acc.add(adif);
//					}
//				}
//				acc=diff(acc);
//				ArrayList acs=new ArrayList();
//				for(int i=0;i<acc.size();i++){
//					String[] strs=(acc.get(i).toString()).split(" ");
//					acs.add(strs);
//				}
//				
//				Map<String,List> map=new HashMap<String,List>();
//				if(ac!=null){
//					for(int i=0;i<ac.size();i++){
//						List listcitys=new ArrayList();
//						for(int j=0;j<acs.size();j++){
//							
//							if(ac.get(i).toString().equals(((String[])acs.get(j))[0].toString())){
//								listcitys.add(((String[])acs.get(j))[1].toString());
//							}
//						}
//						map.put(ac.get(i).toString(), listcitys);
//					
//					}
//					
//				}
//				
//				String xmlstr="<?xml version=\"1.0\" encoding=\"UTF-8\" ?>   <provinceAndCity>";
//				
//				xmlstr+="";
//				Iterator it=map.entrySet().iterator();
//				while(it.hasNext()){
//					Map.Entry entry=(Map.Entry)it.next();
//					//System.out.println("键名");
//					//System.out.println(entry.getKey());
//					String str21=hqlstr+" and o.province = '"+entry.getKey()+"'";
//					//String str2="from Dealer o where o.availabilityflag='1' and o.province = '"+entry.getKey()+"'";
//					List  lsss=dealerDao.getDealerlistbyhql(str21);
//					xmlstr+="<province id=\""+entry.getKey()+"\" name=\""+getnamebycid_en(entry.getKey().toString())+"\" total=\""+lsss.size()+"\">";
//					for(int i=0;i<((List)entry.getValue()).size();i++){
//						//System.out.println("键值");
//						
//						List lss=(List)entry.getValue();
//						//String str22=hqlstr+" and o.dealerCity = '"+lss.get(i).toString()+"'";
//						//List  lssss=dealerDao.getDealerlistbyhql(str22);
//						xmlstr+="<city id=\""+lss.get(i).toString()+"\" name=\""+getnamebycid_en(lss.get(i).toString()).trim()+"\" /> ";
//						//System.out.println(lss.get(i).toString());
//					}
//					xmlstr+=" </province>";
//					//System.out.println("一个MAP");
//				}
//				
//				xmlstr+="</provinceAndCity>";
//				
//
//				
//				PrintWriter out = response.getWriter();   
//		        out.print(xmlstr);  
//		        
//			
//				
//			}else{
//				PrintWriter out = response.getWriter();   
//				out.print("");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;//"te";
//	}
	
	
	
	//根据ID查省市的名字
	@SuppressWarnings("unchecked")
	public String getnamebycid(String cid)
    {
        try
        {
        	List list= dealerDao.getDealerlistbyhql("from CmsDictionary o  where o.cid="+cid+"");
			CmsDictionary cmsDictionary=(CmsDictionary)list.get(0);
			
            return cmsDictionary.getCnname();
        }
        catch (Exception ex)
        {
            return null;
        }
    } 
	

	
	//list去重复
	@SuppressWarnings("unchecked")
	public ArrayList diff(ArrayList arrayNew)
    {
        try
        {
            ArrayList Array = new ArrayList();
            if (arrayNew == null)
            {
                return Array;
            }
           // Array = arrayNew;
            for (int i = 0; i < arrayNew.size(); i++)
            {
                for (int j = 0; j < i; j++)
                {
                    if (arrayNew.get(j).equals( arrayNew.get(i)))
                    {
                   arrayNew.remove(i);
                   i--;
                     break;
                    }
                }
            }
            return arrayNew;
        }
        catch (Exception ex)
        {
            return null;
        }
    } 

	public String dealeren() throws Exception {
		try {/*
			
*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ndl03";
	}
	@SuppressWarnings("unchecked")
	public String procity() throws Exception{
		ServletActionContext.getResponse().setContentType("text/html; charset=UTF-8");
		String retstr = "procity";
		ArrayList pros = new ArrayList();
		ArrayList pros2 = new ArrayList();
		String dalj1 = "0";
		if (request.getParameter("lbid") != null) {
			if (request.getParameter("lbid").toString().equals("1")
					|| request.getParameter("lbid").toString().equals("2")) {
				dalj1 = request.getParameter("lbid").toString();
			}
		}
		sid = Long.parseLong(dalj1);
		List listljs = dealerDao.getDealerlist("", "", dalj1);
		if (listljs == null) {
			return retstr;
		}
		// 中文
		Map<Long, String> cacheMap = null;
		if (request.getParameter("en") == null) {
			cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryMap();
		} else {
			cacheMap = audiServiceDispatcher.getUtilDao().getCacheDictionaryEnMap();
			retstr = "ndl_en";
		}
		
		for (int i = 0; i < listljs.size(); i++) {
			Dealer adif = (Dealer) listljs.get(i);
			pros.add(adif.getProvince().toString() + ","
						+ cacheMap.get(adif.getProvince()).toString());
			
		}
		
		
		//pros 是 id,省份名称 的容器
		if (pros != null) {
			
			//去掉重复的省份名称
			pros = diff(pros);
			
			//将pros(只含有id和省份中文名称) 改为chinaPy（含有id、省份中文名称、省份拼音）
			List chinaPy=new ArrayList();
			for (Object object : pros) {
				String o1String = object.toString().substring(object.toString().indexOf(",")+1).trim();
				
				String propinyin=ChineseSpelling.getInstance().getSelling(o1String).equals("zhongqing")?"chongqing":ChineseSpelling.getInstance().getSelling(o1String);
				
				chinaPy.add(object.toString()+","+propinyin);
			}
			
			//对chinaPy（含有id、省份中文名称、省份拼音）排序
			Collections.sort(chinaPy, new Comparator() {
				public int compare(Object o1, Object o2) {
					String o1String = o1.toString().substring(o1.toString().lastIndexOf(",")+1).trim();
					String o2String = o2.toString().substring(o2.toString().lastIndexOf(",")+1).trim();
					return o1String.compareTo(o2String);
				}
				
			});
						
			for (int i = 0; i < chinaPy.size(); i++) {
				String[] q = chinaPy.get(i).toString().split(",");
				
				pros2.add(q);
			}
		}
		// sid=Long.parseLong(dalj1);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("prostr1", pros2);
		session.setAttribute("lbid01", dalj1);
		return retstr;
	}
	
	

//	public String minit() throws Exception {
//		try {
//			GetProperties pro = new GetProperties("dictionary");
//			provincelist = StaticVar.getByUIDMap("province", Long.parseLong(pro.getProp("provinceid")));
//			citylist = StaticVar.getByUIDMap("city", pid);			
//			//boolean bo=true;
//			
//			String sql = " from Dealer  o where 1=1";
//			//System.out.println("++++++++++++++++++++++++++++++");
//			if(request.getParameter("pid")!=null&&request.getParameter("pid").toString()!=""){
//				sql += " and o.province = '"+ request.getParameter("pid").toString() + "'";
//				
//			}
//			if(request.getParameter("cid")!=null&&request.getParameter("cid").toString()!=""){
//				sql += " and o.city = '"+ request.getParameter("cid").toString() + "'";
//			}
//			
//			if(request.getParameter("dealername")!=null&&request.getParameter("dealername").toString()!=""){
//				sql += " and o.dealername like '%"+ request.getParameter("dealername").toString().trim() + "%'";
//				dealername=request.getParameter("dealername").toString();
//			}
//			
//			if(request.getParameter("fw")!=null&&request.getParameter("fw").toString().equals("1")){
//				sql += "  and o.issecond = '1'";
//				sid=Long.parseLong(request.getParameter("fw").toString());
//			}
//			if(request.getParameter("fw")!=null&&request.getParameter("fw").toString().equals("2")){
//				sql += " and o.isRescue = '1'";
//				sid=Long.parseLong(request.getParameter("fw").toString());
//			}
//			sql += " order by o.ordernum";
//			pagelist = commonDao.findAll(sql, pageSize, pageNumber);
//			HttpSession session = ServletActionContext.getRequest().getSession();
//			
//			if(nid==0){
//				session.setAttribute("sqlstr", sql);
//			}else{
//				pagelist = commonDao.findAll(session.getAttribute("sqlstr").toString(), pageSize, pageNumber);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return DEALERLIST;
//	}

//	public String minit1() throws Exception {
//		try {
//			String sql = " from Dealer  where 1=1 order by ordernum desc";
//			pagelist = commonDao.findAll(
//					sql, pageSize, pageNumber);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return DEALERLIST;
//	}

//	public String mdetail() throws Exception {
//		try {
//			if (request.getParameter("flag")!=null&&request.getParameter("flag").toString().equals("1")) {
//				if(request.getParameter("adUid")!=null&&request.getParameter("adUid").toString()!=""){
//					
//					dealer=dealerDao.findbyid(Long.parseLong(request.getParameter("adUid").toString()));
//				
//				}
//			}
//			GetProperties gp = new GetProperties("dictionary");
//
//			provincelist = StaticVar.getByUIDMap("province", Long.parseLong(gp.getProp("provinceid")));
//			Iterator it = provincelist.keySet().iterator();
//			long tempid = -1;
//			if (it.hasNext()) {
//				tempid = (Long) it.next();
//			}
//			if (dealer != null && dealer.getProvince() != null) {
//				tempid = dealer.getProvince().getCid();
//			}
//			
//			
//			String condtionsql = "upid="+ gp.getProp("audionetype")+ " and availabilityflag='1'";
//			
//			List list = dictionaryDao.getList(condtionsql);
//			CmsDictionary cd = new CmsDictionary();
//			modellist = new HashMap();
//			if(list.size()>0){
//				for(int i=0;i<list.size();i++){
//					cd = (CmsDictionary)list.get(i);
//					modellist.put(cd.getCid(),cd.getCnname());
//				}
//			}
//			
//			citylist =StaticVar.getByUIDMap("city"+tempid, tempid);
//			
//			if(request.getParameter("adUid")!=null&&request.getParameter("adUid").toString().equals("0")){
//				
//				return "adds";
//			}
//			return DETAILDEALER;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return DETAILDEALER;
//
//	}

//	public String madd() throws Exception {
//		try {
//			if (request.getParameter("flag1")!=null&&!request.getParameter("flag1").toString().equals("0")) {
//				//dealer.setCreateDate(new Date());
//				Dealer adif = new Dealer();
//				adif.setAddtime(new Date());
//				if(request.getParameter("pid")!=null&&request.getParameter("pid").toString()!=""){
//					//System.out.println(request.getParameter("pid").toString()+"+++++++++");
//					adif.setProvince(dictionaryDao.findByID(Long.parseLong(request.getParameter("pid").toString())));
//				}
//				if(request.getParameter("cid")!=null&&request.getParameter("cid").toString()!=""){
//					adif.setCity(dictionaryDao.findByID(Long.parseLong(request.getParameter("cid").toString())));
//				}
//				adif.setAddress( dc("address"));
//				if(dc("dealerLongitude")!=""){
//					adif.setDealerLongitude(dc("dealerLongitude"));
//				}
//				if(dc("dealerDimension")!=""){
//					adif.setDealerDimension(dc("dealerDimension"));
//				}
//				adif.setDealername(dc("dealername"));
//				adif.setPostalcode(dc("postalcode"));
//				adif.setContactEn(dc("contactEn"));
//				adif.setUrl(dc("url"));
//				adif.setPhone(dc("phone"));
//				adif.setServicephone(dc("servicephone"));
//				adif.setFax(dc("fax"));
//				adif.setModel(dc("model"));
//				adif.setIssecond(dc("issecond"));
//				adif.setContact(dc("contact"));
//				adif.setContactPhone(dc("contactPhone"));
//				adif.setContactTel(dc("contactTel"));
//				adif.setContactEmail(dc("contactEmail"));
//				adif.setIsRescue(dc("isRescue"));
//				adif.setRescuePhone(dc("rescuePhone"));
//				adif.setRescueTel(dc("rescueTel"));
//				adif.setAvailabilityflag(Long.parseLong(dc("availabilityflag")));
//				
//				adif.setAreanum(dc("areanum"));
//				adif.setDealerenname(dc("dealerenname"));
//				adif.setEnaddress(dc("enaddress"));
//				adif.setIsr8(dc("isr8"));
//				adif.setIslimit("1");
//				//adif.setDealersCode(dc("dealersCode"));
//				if(dc("ordernum")!=""){
//					adif.setOrdernum(Long.parseLong((dc("ordernum"))));
//				}else{
//					adif.setOrdernum(Long.parseLong("0"));
//				}
//				Map session = ActionContext.getContext().getSession();
//				CmsUsers cu = new CmsUsers();
//				cu=(CmsUsers)session.get("adminuser");
//				if(cu!=null){
//					adif.setLastmodify(cu.getAid());
//				}
//				//adif.setCreateUserid(Long.parseLong((dc("createUserid"))));
//				
//				//String   str= dc("createDate"); 
//				//java.text.SimpleDateFormat   format   =   new   java.text.SimpleDateFormat("yyyy-MM-dd"); 
//				//java.util.Date   date   =   (java.util.Date)   format.parse(str); 
//				//adif.setAddtime(date);
//
//				adif.setAid(Long.parseLong(request.getParameter("flag1").toString()));				
//				if (commonDao.mod(adif)) {
//				    return "cg";
//				} else {
//					return ERROR;
//				}
//				
//				/*
//				if (commonDao.mod(dealer)) {
//					//message = "修改成功!<br><br><a href='sizes!minit.action?pageNumber="+pageNumber+"&layerid="+layerid+"&message=back'>返回</a>";
//					return "cg";
//				} else {
//					//message = "修改失败!<br><br><a href='sizes!minit.action?pageNumber="+pageNumber+"&layerid="+layerid+"&message=back'>返回</a>";
//					return ERROR;
//				}*/
//			} else{
//				Dealer adif = new Dealer();
//				adif.setLasttime(new Date());
//				if(request.getParameter("pid")!=null&&request.getParameter("pid").toString()!=""){
//					//String spid=dealerDao.getProByid(request.getParameter("pid").toString().trim());
//					//adif.getCity(spid);
//					adif.setProvince(dictionaryDao.findByID(Long.parseLong(request.getParameter("pid").toString())));
//				}
//				if(request.getParameter("cid")!=null&&request.getParameter("cid").toString()!=""){
//					//String scid=dealerDao.getProByid(request.getParameter("cid").toString().trim());
//					//adif.setDealerCity(scid);
//					adif.setCity(dictionaryDao.findByID(Long.parseLong(request.getParameter("cid").toString())));
//				}
//				adif.setAddress( dc("address"));
//				if(dc("dealerLongitude")!=""){
//					adif.setDealerLongitude(dc("dealerLongitude"));
//				}
//				if(dc("dealerDimension")!=""){
//					adif.setDealerDimension(dc("dealerDimension"));
//				}
//				adif.setDealername(dc("dealername"));
//				adif.setPostalcode(dc("postalcode"));
//				
//				adif.setUrl(dc("url"));
//				adif.setPhone(dc("phone"));
//				adif.setServicephone(dc("servicephone"));
//				adif.setFax(dc("fax"));
//				adif.setModel(dc("model"));
//				adif.setIssecond(dc("isSecond"));
//				adif.setContact(dc("contact"));
//				adif.setContactEn(dc("contactEn"));
//				adif.setContactPhone(dc("contactPhone"));
//				adif.setContactTel(dc("contactTel"));
//				adif.setContactEmail(dc("contactEmail"));
//				adif.setIsRescue(dc("isRescue"));
//				adif.setRescuePhone(dc("rescuePhone"));
//				adif.setRescueTel(dc("rescueTel"));
//				
//				adif.setAreanum(dc("areanum"));
//				adif.setDealerenname(dc("dealerenname"));
//				adif.setEnaddress(dc("enaddress"));
//				adif.setIsr8(dc("isr8"));
//				adif.setIslimit("1");
//				
//				adif.setAvailabilityflag(Long.parseLong(dc("availabilityflag")));
//				//adif.setDealersCode(dc("dealersCode"));
//				if(dc("ordernum")!=""){
//					adif.setOrdernum(Long.parseLong((dc("ordernum"))));
//				}else{
//					adif.setOrdernum(Long.parseLong("100"));
//				}
//				Map session = ActionContext.getContext().getSession();
//				
//				CmsUsers cu = new CmsUsers();
//				cu=(CmsUsers)session.get("adminuser");
//				if(cu!=null){
//					adif.setBid(cu.getAid());
//				}
//				
//				adif.setAid(dealerDao.findadUid());				
//				if (commonDao.add(adif)) {
//					//message = "添加成功!<br><br><a href='sizes!minit.action?layerid="+layerid+"&message=back'>返回</a>";
//					return "cg";
//				} else {
//					//message = "添加失败!<br><br><a href='sizes!minit.action?layerid="+layerid+"&message=back'>返回</a>";
//					return ERROR;
//				}
//				
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			message = "操作失败!<br><br><a href='sizes!minit.action?pageNumber="+pageNumber+"&layerid="+layerid+"&message=back'>返回</a>";
//			return ERROR;					
//		}
//	}
	
	public String dc(String str){
		if(request.getParameter(str)!=null&&request.getParameter(str).toString()!=""){
			return request.getParameter(str).toString().trim();
		}else{
			return "";
		}
	}
	

//	public String mdel() throws Exception {
//		try {
//			/*
//			if (ServletActionContext.getServletContext().getInitParameter("dynamic_popedom").equals("1")) {
//				if (!PopedomValidate.validate(layerid, "del")) {
//					return "popedom";
//				}
//			}*/
//			String adUids="";
//			if(request.getParameter("aid")!=null&&request.getParameter("aid").toString()!=""){
//				adUids=request.getParameter("aid").toString();
//			}
//			if (dealerDao.delTbAudiinof(adUids)){
//				//message = "删除成功!<br><br><a href='sizes!minit.action?layerid="+layerid+"&message=back'>返回</a>";
//				return "cg";
//			} else {
//				//message = "删除失败!<br><br><a href='sizes!minit.action?layerid="+layerid+"&message=back'>返回</a>";
//				return ERROR;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			//message = "操作失败!<br><br><a href='sizes!minit.action?layerid="+layerid+"&message=back'>返回</a>";
//			return ERROR;				
//		}
//	}

	public Object getModel() {
		// TODO Auto-generated method stub
		return dealer;
	}

	

	public Dealer getDealer() {
		return dealer;
	}

	public void setDealer(Dealer dealer) {
		this.dealer = dealer;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

//	public CommonFindPageRecord getPagelist() {
//		return pagelist;
//	}
//
//	public void setPagelist(CommonFindPageRecord pagelist) {
//		this.pagelist = pagelist;
//	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getCid() {
		return cid;
	}

	public void setCid(long cid) {
		this.cid = cid;
	}

	public long getPid() {
		return pid;
	}

	public void setPid(long pid) {
		this.pid = pid;
	}

	@SuppressWarnings("unchecked")
	public Map getCitylist() {
		return citylist;
	}

	@SuppressWarnings("unchecked")
	public void setCitylist(Map citylist) {
		this.citylist = citylist;
	}

	@SuppressWarnings("unchecked")
	public Map getProvincelist() {
		return provincelist;
	}

	@SuppressWarnings("unchecked")
	public void setProvincelist(Map provincelist) {
		this.provincelist = provincelist;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@SuppressWarnings("unchecked")
	public Map getModellist() {
		return modellist;
	}

	@SuppressWarnings("unchecked")
	public void setModellist(Map modellist) {
		this.modellist = modellist;
	}

	public String getLayerid() {
		return layerid;
	}

	public void setLayerid(String layerid) {
		this.layerid = layerid;
	}
	public String getDealername() {
		return dealername;
	}
	public void setDealername(String dealername) {
		this.dealername = dealername;
	}
	public long getSid() {
		return sid;
	}
	public void setSid(long sid) {
		this.sid = sid;
	}
	public long getNid() {
		return nid;
	}
	public void setNid(long nid) {
		this.nid = nid;
	}
	@SuppressWarnings("unchecked")
	public List getListlj() {
		return listlj;
	}
	@SuppressWarnings("unchecked")
	public void setListlj(List listlj) {
		this.listlj = listlj;
	}
	public String getProstr() {
		return prostr;
	}
	public void setProstr(String prostr) {
		this.prostr = prostr;
	}
	
	private Long id;
	public void setId(Long id) {
		this.id = id;
	}
	private String name;
	private Long mobile;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getMobile() {
		return mobile;
	}

	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}
	/** 
	 * 发送经销商到手机 
	 * @return
	 */
	public String send() {
		String MsgContent="";
		Dealer dealer = dealerDao.get(id);
		if(request.getParameter("en")==null){
			MsgContent = "尊敬的" + name + "阁下，您查询的一汽-大众奥迪特许经销商信息如下。经销商: " + dealer.getDealername() + ",销售热线：" + dealer.getAreanum()+ "-" + dealer.getPhone()+ ",地址：" + dealer.getAddress();
		}else {
			MsgContent = "Dear" + name + ",This is the FAW - Volkswagen Audi authorized dealer that you have searched:  " + dealer.getDealerenname()  + "," + dealer.getAreanum() + "-" + dealer.getPhone() + "," + dealer.getEnaddress();
		}
		SendMessageUtil.sendMsg(String.valueOf(mobile), MsgContent);
		renderText("true");
		return null;
	}

}
