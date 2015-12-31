package com.oemp.cms.service;

import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsUserLogin;
import com.oemp.frame.service.BaseService;

public interface CmsUserLoginService extends BaseService{
  //查询
   public List<CmsUserLogin> query(CmsUserLogin cmsUserLogin);
   //添加
   public CmsUserLogin add(CmsUserLogin cmsUserLogin);
   //修改
   public boolean modify(CmsUserLogin cmsUserLogin);
   //删除
   public boolean del(int culId);
   //根据用户对应的查询条件信息
   public List<CmsUserLogin> findByMap(Map<String,String> optionMap);
   
   public List<CmsUserLogin> findByTime(int cmuId,String startTime,String endTime);
}
