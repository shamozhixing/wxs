/**
 * 
 */
package com.oemp.audi.action.front;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.bean.TbSubscribeEnewsletter;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.DateUtil;

/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-5-31
 */
@Controller("audi.front.action.TbSubscribeEnewsletterAction")
@Scope("prototype")
public class TbSubscribeEnewsletterAction extends ContactBaseAction{
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	TbSubscribeEnewsletter enews=new TbSubscribeEnewsletter();
	TbRegUser user = new TbRegUser();
	public String email;
	public String username;
	private boolean flag=false;
	//初始化
	public String init(){	
		user = this.getWebUser();
		if(user!=null && user.getUserid()>0){
					enews = audiServiceDispatcher.getTbSubscribeEnewsletterService().findbyUserId(user.getUserid());
					if(enews==null){
						enews = new TbSubscribeEnewsletter();
						enews.setUserid(user.getUserid());
						enews.setUsername(user.getUsername());
						enews.setSubscribeemail(user.getEmail());
					}else{
						if("0".equals(enews.getSendstatus())){
								flag=true;
						}
					}
		}
		return SUCCESS;
	}
    //订阅
	@SuppressWarnings("unchecked")
	public String save() throws Exception {
		Map map=new HashMap();
		try{			
			user=this.getWebUser();
			
					if(user==null){					
						if(audiServiceDispatcher.getTbSubscribeEnewsletterService().isEmail(email)){
							enews.setSendstatus("0");
							 enews.setUsername(username);
							enews.setSubscribeemail(email);
							enews.setAddtime(DateUtil.getNowDate());
							audiServiceDispatcher.getTbSubscribeEnewsletterService().save(enews);
							 
						 }else{
							 TbSubscribeEnewsletter enew=audiServiceDispatcher.getTbSubscribeEnewsletterService().EnewsByEmail(email);
							 enew.setSendstatus("0");
							 if("".equals(username)){
								 username=enew.getUsername();
							 }
							 enew.setUsername(username);
							enew.setSubscribeemail(email);
							//enew.setSendtime(DateUtil.getNowDate());
							audiServiceDispatcher.getTbSubscribeEnewsletterService().updateNews(enew);
							}
							map.put("success", "true");
							map.put("msgEnews", "");
						}else{
							enews = audiServiceDispatcher.getTbSubscribeEnewsletterService().findbyUserId(user.getUserid());
								 if(enews!=null){//更新
									 if(!enews.getSubscribeemail().equals(email)&&!audiServiceDispatcher.getTbSubscribeEnewsletterService().isEmail(email)){
										 map.put("success", "false");
										 map.put("msgEnews", 6);
									 }else{
											 enews.setSendstatus("0");
											 enews.setSubscribeemail(email);
											 if("".equals(username)){
												 username=enews.getUsername();
											 }
											 enews.setUsername(username);
											// enews.setSendtime(DateUtil.getNowDate());
											 enews.setStandby1("");
											 Boolean ts= audiServiceDispatcher.getTbSubscribeEnewsletterService().updateNews(enews);
											 if(ts){
												 map.put("success", "true");
												 map.put("msgEnews", "");
											 }else{
												 map.put("success", "false");
												 map.put("msgEnews", 1);
											 }	
									 }
								 }else{	//添加
									 if(audiServiceDispatcher.getTbSubscribeEnewsletterService().isEmail(email)){
										 	enews=new TbSubscribeEnewsletter();
											enews.setUserid(user.getUserid());
											enews.setSubscribeemail(email);
											enews.setUsername(username);
											enews.setAddtime(DateUtil.getNowDate());
										    enews.setSendstatus("0");
										    enews.setStandby1("");
										    TbSubscribeEnewsletter ts= audiServiceDispatcher.getTbSubscribeEnewsletterService().save(enews);
										    if(ts!=null){
										    	map.put("success", "true");
												 map.put("msgEnews", "");
											 }else{
												 map.put("success", "false");
												 map.put("msgEnews", 1);
											 }
									 }else{
										 map.put("success", "false");
										 map.put("msgEnews", 6);
									 }
								
					}
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("success", "false");
			map.put("msgEnews", 4);
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	//取消订阅
	public String cancel() throws Exception{
		Map map=new HashMap();
		try{
			user=this.getWebUser();
			if(user!=null){				
				TbSubscribeEnewsletter e = audiServiceDispatcher.getTbSubscribeEnewsletterService().findbyUserId(user.getUserid());
				 if(e!=null&&e.getSubscribeemail().equals(email)){
					 e.setSendstatus("1");
					 e.setStandby1(e.getStandby1());
					// e.setSendtime(DateUtil.getNowDate());
					 Boolean ts= audiServiceDispatcher.getTbSubscribeEnewsletterService().updateNews(e);
					 if(ts){
						 map.put("success", "true");
					 }else{
						 map.put("success", "false");
						 map.put("msgEnews", 3);
					 }	
				 }else{
					 map.put("success", "false");
					 map.put("msgEnews", 2);
				 }
			}else{
				if(audiServiceDispatcher.getTbSubscribeEnewsletterService().isEmail(email)){
					map.put("success", "false");
					 map.put("msgEnews", 5);
				}else{
					TbSubscribeEnewsletter enew=audiServiceDispatcher.getTbSubscribeEnewsletterService().EnewsByEmail(email);
					enew.setSendstatus("1");
					//enew.setSendtime(DateUtil.getNowDate());
					Boolean ts= audiServiceDispatcher.getTbSubscribeEnewsletterService().updateNews(enew);
					 if(ts){
						 map.put("success", "true");
					 }else{
						 map.put("success", "false");
						 map.put("msgEnews", 3);
					 }	
				}
				
				
			}

		}catch(Exception e){
			e.printStackTrace();
			 map.put("success", "false");
			 map.put("msgEnews", 4);
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	/**
	 * @return the enews
	 */
	public TbSubscribeEnewsletter getEnews() {
		return enews;
	}
	/**
	 * @param enews the enews to set
	 */
	public void setEnews(TbSubscribeEnewsletter enews) {
		this.enews = enews;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the flag
	 */
	/**
	 * @return the user
	 */
	public TbRegUser getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(TbRegUser user) {
		this.user = user;
	}
	/**
	 * @return the flag
	 */
	public boolean isFlag() {
		return flag;
	}
	/**
	 * @param flag the flag to set
	 */
	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	
}
