package com.oemp.audi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.Dealer;
import com.oemp.audi.dao.UtilDao;
import com.oemp.frame.hibernate.BaseDaoImpl;

@Repository
public class UtilDaoImpl extends BaseDaoImpl<Dealer> implements UtilDao {

	/**
	 * 获取省市经销商
	 * @param dealerType
	 * @param provinceId
	 * @param cityId
	 * @return
	 */
	public String getDealerById(long aid) {
		String sql = "select DEALERNAME from tb_audi_dealer where AID = ?";
		List list=getSession().createSQLQuery(sql).setLong(0, aid).list();
		if(!list.isEmpty()){
			return list.get(0).toString();
		}
		return "";
	}
	/**
	 * 是否字典表缓存
	 */
	private static boolean isDicCnCache=false;
	private static Map<Long, String> dictionaryMap=new HashMap<Long, String>();
	public  Map<Long, String> getCacheDictionaryMap() {
		if(!isDicCnCache){
			String sql = "select CID,CNNAME from cms_dictionary order by UPID,ORDERNUM";
			List<Object []> list=getSession().createSQLQuery(sql).list();
			dictionaryMap =new HashMap<Long, String>();
			for (Object[] obj : list) {
				Long key=Long.valueOf(obj[0].toString());
				String value=(String) obj[1];
				dictionaryMap.put(key, value);
			}
			isDicCnCache=true;
		}
		return dictionaryMap;
	}
	
	
	/**
	 * @see com.oemp.audi.dao.UtilDao#getCacheDictionaryEnMap()
	 */
	/**
	 * 是否字典表缓存
	 */
	private static boolean isDicEnCache=false;
	private static Map<Long, String> dictionaryEnMap=new HashMap<Long, String>();
	public Map<Long, String> getCacheDictionaryEnMap() {
		if(!isDicEnCache){
			String sql = "select CID,ENNAME from cms_dictionary order by UPID,ORDERNUM";
			List<Object []> list=getSession().createSQLQuery(sql).list();
			dictionaryEnMap =new HashMap<Long, String>();
			for (Object[] obj : list) {
				Long key=Long.valueOf(obj[0].toString());
				String value=(String) obj[1];
				dictionaryEnMap.put(key, value);
			}
			isDicEnCache=true;
		}
		return dictionaryEnMap;
	}
	/**
	 * 是否经销商表
	 */
	private static boolean isDealerCache=false;
	private static Map<Long, String> deaclerMap=new HashMap<Long, String>();
	/**
	 * @see com.oemp.audi.dao.UtilDao#getDealerMap()
	 */
	public Map<Long, String> getDealerMap() {
		if(!isDealerCache){
			String sql = "select AID,DEALERNAME from tb_audi_dealer order by ORDERNUM";
			List<Object []> list=getSession().createSQLQuery(sql).list();
			deaclerMap =new HashMap<Long, String>();
			for (Object[] obj : list) {
				Long key=Long.valueOf(obj[0].toString());
				String value=(String) obj[1];
				deaclerMap.put(key, value);
			}
			isDealerCache=true;
		}
		return deaclerMap;
	}
	/**
	 * @see com.oemp.audi.dao.UtilDao#IsDealerCache()
	 */
	public void resetDealerCache() {
		isDealerCache=false;
	}
	
	public void resetDicCache() {
		isDicEnCache=false;
		isDicCnCache=false;
	}
	
	
}
