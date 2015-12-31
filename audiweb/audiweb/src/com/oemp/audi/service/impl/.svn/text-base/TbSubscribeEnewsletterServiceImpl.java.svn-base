package com.oemp.audi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.ContactManual;
import com.oemp.audi.bean.TbSubscribeEnewsletter;
import com.oemp.audi.dao.ContactManualDao;
import com.oemp.audi.dao.TbSubscribeEnewsletterDao;
import com.oemp.audi.service.ContactManualService;
import com.oemp.audi.service.TbSubscribeEnewsletterService;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.service.BaseServiceImpl;
@Service
public class TbSubscribeEnewsletterServiceImpl extends BaseServiceImpl implements TbSubscribeEnewsletterService {
	
	@Autowired
	TbSubscribeEnewsletterDao tbSubscribeEnewsletterDao;
	

	/**
	 * @see com.oemp.audi.service.ContactManualService#save(com.oemp.audi.bean.ContactManual)
	 */
	public TbSubscribeEnewsletter save(TbSubscribeEnewsletter manual) {
		
		return tbSubscribeEnewsletterDao.save(manual);
	}
	/**
	 * @see com.oemp.audi.service.ContactManualService#save(com.oemp.audi.bean.ContactManual)
	 */
	public Boolean updateNews(TbSubscribeEnewsletter manual) {
		
		return tbSubscribeEnewsletterDao.saveOrUpdate(manual)!=null;
	}
	/**
	 * @see com.oemp.audi.service.TbSubscribeEnewsletterService#findbyUserId(long)
	 */
	public TbSubscribeEnewsletter findbyUserId(long userid) {
		
		return tbSubscribeEnewsletterDao.findbyUserId(userid);
	}
	/**
	 * @see com.oemp.audi.service.TbSubscribeEnewsletterService#isEmail(java.lang.String)
	 */
	public boolean isEmail(String manual) {
		List<TbSubscribeEnewsletter> emlist=tbSubscribeEnewsletterDao.findByProperty("subscribeemail", manual);
		if(emlist!=null&&!emlist.isEmpty()){
			return false;
		}
		return true;
	}
	/**
	 * @see com.oemp.audi.service.TbSubscribeEnewsletterService#EnewsByEmail(java.lang.String)
	 */
	public TbSubscribeEnewsletter EnewsByEmail(String manual) {
		TbSubscribeEnewsletter tsub=null;
		try{
			 tsub=tbSubscribeEnewsletterDao.findByProperty("subscribeemail", manual).get(0);
		}catch(Exception e){
			e.printStackTrace();
		}
		return tsub;
	}

}
