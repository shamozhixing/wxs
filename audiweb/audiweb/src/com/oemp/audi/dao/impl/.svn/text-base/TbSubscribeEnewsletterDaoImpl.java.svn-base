package com.oemp.audi.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.oemp.audi.bean.ContactMagazine;
import com.oemp.audi.bean.ContactManual;
import com.oemp.audi.bean.Dealer;
import com.oemp.audi.bean.TbSubscribeEnewsletter;
import com.oemp.audi.dao.ContactManualDao;
import com.oemp.audi.dao.TbSubscribeEnewsletterDao;
import com.oemp.cms.bean.CmsPage;
import com.oemp.common.UtilTools;
import com.oemp.frame.hibernate.BaseDaoImpl;
import com.oemp.frame.page.PageTools;
import com.oemp.frame.util.CmsUtils;
@Repository
public class TbSubscribeEnewsletterDaoImpl extends BaseDaoImpl<TbSubscribeEnewsletter> implements TbSubscribeEnewsletterDao{

	public TbSubscribeEnewsletter findbyUserId(long userid) {
		TbSubscribeEnewsletter enews = null;
		try{
			String sql="from TbSubscribeEnewsletter  where userid="+userid;
				
		  
			  enews =(TbSubscribeEnewsletter)super.findUnique(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return enews;
	}

	@SuppressWarnings("unchecked")
	public Boolean updateNews(TbSubscribeEnewsletter tbsubscribeenewsletter) {
		Boolean status = false;
		try{
			String sql="update TB_SUBSCRIBE_ENEWSLETTER o set o.SENDSTATUS='"+tbsubscribeenewsletter.getSendstatus()+"' where o.SID="+tbsubscribeenewsletter.getSid();
			List list = this.getSession().createSQLQuery(sql).list();
			if(list.size()>0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}

}
