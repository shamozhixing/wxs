/**
 * 
 */
package com.oemp.audi.dao.impl;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.bean.Dealer;
import com.oemp.audi.dao.DealerDao;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;

/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-5-16
 */
@Repository
public class DealerDaoImpl extends BaseDaoImpl<Dealer> implements DealerDao{

	/**
	 * @see com.oemp.audi.dao.DealerDao#findPageList(int, int, java.util.Map)
	 */
	public PageTools<Dealer> findByHql(int page, int limit,Map<String, String> screenMap) {
		StringBuffer hql=new StringBuffer();
		hql.append("from com.oemp.audi.bean.Dealer d where 1=1 ");
		String dealerName=screenMap.get("dealerName");
		String province=screenMap.get("province");
		String city=screenMap.get("city");
		String type=screenMap.get("type");
		
		if(!CmsUtils.isEmpty(dealerName)){
			hql.append(" and dealername like '%" +CmsUtils.SqlReplace(dealerName) + "%'");
		}
		if(!CmsUtils.isEmpty(province)){
			hql.append(" and  province= " +province);
		}
		if(!CmsUtils.isEmpty(city)){
			hql.append(" and city = " +city);
		}
		
		if(!CmsUtils.isEmpty(type) && !"0".equals(type))
		if(type.equals("1")){
			hql.append(" and  issecond= 1");
		}
		
		else if(type.equals("2")){
			hql.append(" and  isRescue= 1");
		}
		
		if(!CmsUtils.isEmpty(screenMap.get("startTime")) && !CmsUtils.isEmpty(screenMap.get("endTime"))){
			hql.append(" and addtime >= to_date('"+screenMap.get("startTime")+"','yyyy-mm-dd') " +
					"and addtime <= to_date('" + screenMap.get("endTime")+"','yyyy-mm-dd')+1 ");
		}
		
		StringBuffer orderBy = new StringBuffer();
		orderBy.append(" order by ordernum asc");
		return findByHql(page, limit, hql.toString(),orderBy.toString());
	}
	/**
	 * @see com.oemp.audi.dao.DealerDao#getCityName(java.math.BigDecimal)
	 */
	public List<CmsDictionary> getCityAll(long id) {
		String sql = "from CmsDictionary where upid=" + id;
		List<CmsDictionary> datalist = this.getSession().createQuery(sql).list();
		return datalist;
	}

	/**
	 * @see com.oemp.audi.dao.DealerDao#getProvinceAll()
	 */
	public List<CmsDictionary> getProvinceAll() {
		String sql = "from CmsDictionary where upid=1";
		List<CmsDictionary> datalist = this.getSession().createQuery(sql).list();
		return datalist;
	}
	
	/**
	 * 查询经销商
	 */
	@SuppressWarnings("unchecked")
	public List getDealerlist(String proid, String cityid, String lbid) {
		List list = null;
		String Hql = "from com.oemp.audi.bean.Dealer o  where 1=1";
		if (proid != "" && proid != null) {
			Hql += " and  o.province=" + proid;
		}
		if (cityid != "" && cityid != null) {
			Hql += " and o.city=" + cityid;
		}
		if (lbid != "" && lbid != null) {
			if (lbid.equals("0")) {
				Hql += " and o.availabilityflag='1'";
			} else if (lbid.equals("1")) {
				Hql += " and o.issecond='1'  and  o.availabilityflag='1'";
			} else if (lbid.equals("2")) {
				Hql += " and  o.isRescue='1'  and o.availabilityflag='1'";
			}
		}
		Hql += "  order by o.ordernum";
		try {
			list = this.getSession().createQuery(Hql).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 根据ID查询经销商
	 */
	public Dealer findbyid(long id) {
		Dealer tbd =null;
		try{
			String Hql="from com.oemp.audi.bean.Dealer o where o.aid="+id;
			List list = this.getSession().createQuery(Hql).list();
			if(list.size()>0){
				tbd= (Dealer)list.get(0);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return tbd;
	}
	
	/**
	 * 
	 */
	public List getDealerlistbyhql(String hqlstr) {
		List list = null;
	  try{
		  list = this.getSession().createQuery(hqlstr).list();
	  }catch(Exception e){
		  e.printStackTrace();
	  }
		return list;
	}
	
	
	public Map  dealer(long id) {
		Map tempmap = new TreeMap();	   
	     String sql="select distinct  t.dealername,t.aid,t.ordernum from tb_audi_dealer t  where t.availabilityflag='1' and  city="+id+ "  and islimit='1' order by ordernum,aid";
	     List   list =  this.getSession().createSQLQuery(sql).list();
	     String cnname = "";
	     if(list.size()>0){
				long cid = 0;
				for (Object object : list) {
					Object[] obj=(Object[]) object;
					cnname =obj[0]!=null?obj[0].toString().trim():"";
					 cid = Long.parseLong(obj[1].toString());				
					 tempmap.put(cid, cnname);
				
				}
			}
	     return tempmap;
	}
	public Map dealerprovince(long ccid) {
		Map tempmap = new TreeMap();
		String sql = "select distinct t.cnname,t.cid,t.ordernum from cms_dictionary t,tb_audi_dealer b  where t.upid="+ccid+" and t.availabilityflag=1 and t.cid= b.province ";
	     sql += "  order by t.ordernum";	
		List list = this.getSession().createSQLQuery(sql).list();
		String cnname = "";
		if(list.size()>0){
			long cid = 0;	
			for (Object object : list) {
				Object[] obj=(Object[]) object;
				cnname =obj[0]!=null?obj[0].toString().trim():"";
				cid = Long.parseLong(obj[1].toString());				
				tempmap.put(cid, cnname);	
			}
		}
		return tempmap;
	}

	public Map dealercity(long pid) {
		Map tempmap = new TreeMap();
		String sql="select distinct t.cnname,t.cid,t.ordernum from cms_dictionary t,tb_audi_dealer b where b.province="+pid+" and t.availabilityflag=1 and t.cid= b.city  and b.islimit='1' ";
		sql += " order by t.ordernum";
		List list = this.getSession().createSQLQuery(sql).list();
		String cnname = "";
		if(list.size()>0){
			long cid = 0;		
			for (Object object : list) {
				Object[] obj=(Object[]) object;
				cnname =obj[0]!=null?obj[0].toString().trim():"";
				cid = Long.parseLong(obj[1].toString());				
				tempmap.put(cid, cnname);	
			}
		}
		return tempmap;
	}
}
