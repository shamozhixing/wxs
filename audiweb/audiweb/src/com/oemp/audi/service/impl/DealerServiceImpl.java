/**
 * 
 */
package com.oemp.audi.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.bean.Dealer;
import com.oemp.audi.dao.DealerDao;
import com.oemp.audi.dao.UtilDao;
import com.oemp.audi.service.DealerService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;

/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-5-16
 */
@Service
public class DealerServiceImpl extends BaseServiceImpl implements DealerService {
	@Autowired
	protected DealerDao dealerDao;
	
	@Autowired
	protected UtilDao utilDao;
	/**
	 * @see com.oemp.audi.service.DealerService#delete(java.lang.String)
	 */
	public boolean delete(long ids) {
		Dealer list=dealerDao.deleteById(ids);
		utilDao.resetDealerCache();
		return list!=null?true:false;
	}

	/**
	 * @see com.oemp.audi.service.DealerService#save(com.oemp.audi.bean.Dealer)
	 */
	public Dealer saveOrUpdate(Dealer de) {
		try {
			Dealer dl= (Dealer) dealerDao.saveOrUpdate(de);
			utilDao.resetDealerCache();
			return dl;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * @see com.oemp.audi.service.DealerService#getCityName(java.math.BigDecimal)
	 */
	public List<CmsDictionary> getCityAll(long id) {
		
		return dealerDao.getCityAll(id);
	}

	/**
	 * @see com.oemp.audi.service.DealerService#getProvinceAll()
	 */
	public List<CmsDictionary> getProvinceAll() {
		
		return dealerDao.getProvinceAll();
	}

	/**
	 * @see com.oemp.audi.service.DealerService#findByHql(java.util.Map)
	 */
	public PageTools<Dealer> findByHql(int page, int limit,Map<String, String> screeMap) {
		return dealerDao.findByHql(page, limit, screeMap);
		
	}

	public Map  dealer(long id) {
		return dealerDao.dealer(id);
	}
	public Map dealerprovince(long ccid) {
		return dealerDao.dealerprovince(ccid);
	}

	public Map dealercity(long pid) {
		return dealerDao.dealercity(pid);
	}
	
}
