package com.oemp.audi.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oemp.audi.bean.CmsDictionary;
import com.oemp.audi.dao.CmsDictionaryDao;
import com.oemp.audi.dao.UtilDao;
import com.oemp.audi.service.CmsDictionaryService;
import com.oemp.common.UtilTools;
import com.oemp.frame.page.PageTools;

/**
 * 产品手册信息实现类
 * 
 * @author c
 * 
 */
@Service
public class CmsDictionaryServiceImpl implements CmsDictionaryService {
	@Autowired
	protected CmsDictionaryDao cmsDictionaryDao;
	@Autowired
	protected UtilDao utilDao;
	static Logger log=LoggerFactory.getLogger(CmsDictionaryServiceImpl.class);
	
	public PageTools<CmsDictionary> findByHql(int page, int limit,Map<String, Object> screenMap) {
		return cmsDictionaryDao.findByHql(page, limit, screenMap);
	}

	public boolean saveOrUpdate(CmsDictionary bean) {
		try {
			Object obj=cmsDictionaryDao.saveOrUpdate(bean);
			utilDao.resetDicCache();
			return obj!=null;
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return false;
	}

	/**
	 * @see com.oemp.audi.service.ContactProductbookService#getById(java.lang.Integer)
	 */
	public CmsDictionary getByCId(Long cId) {
		return cmsDictionaryDao.get(cId);
	}

	/**
	 * @see com.oemp.audi.service.ContactProductbookService#getByCpType(java.lang.Integer)
	 */
	public List<CmsDictionary> getByUpid(Long upid) {
		return cmsDictionaryDao.getByUpid(upid);
	}
	//获取资源树，根据id
	public String getDictionaryTreeByUpid(Long upid) {
		List<CmsDictionary> list=getByUpid(upid);
		//转化为tree格式
		List<Map<String, Object>> nodelist = new ArrayList<Map<String, Object>>();
		
		for(int i=0;i<list.size();i++){
			CmsDictionary cm = list.get(i);
			Map m = getSysNodeList(cm);
			nodelist.add(m);
		}
		return UtilTools.getJsonForObject(nodelist);
	}
	//系统栏目菜单--子集节点
	private Map<String, Object> getSysNodeList(CmsDictionary cd){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("cid", cd.getCid());
		m.put("upid", cd.getUpid());
		m.put("text", cd.getCnname());
		//m.put("leaf", "true");
		return m;
	}

	/**
	 * @see com.oemp.audi.service.CmsDictionaryService#getByUpidByFlag(java.lang.Long)
	 */
	public List<CmsDictionary> getByUpidByFlag(Long upid) {
		return cmsDictionaryDao.getByUpidByFlag(upid);
	}
	
	
}
