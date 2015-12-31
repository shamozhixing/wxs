package com.oemp.cms.dao.impl;

import org.springframework.stereotype.Repository;

import com.oemp.cms.bean.CmsLog;
import com.oemp.cms.dao.CmsLogDao;
import com.oemp.frame.hibernate.BaseDaoImpl;

@Repository
public class CmsLogDaoImpl extends BaseDaoImpl<CmsLog> implements CmsLogDao{
}
