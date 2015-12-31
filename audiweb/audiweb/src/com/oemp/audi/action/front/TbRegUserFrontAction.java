/**
 * 
 */
package com.oemp.audi.action.front;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.TbRegUser;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.EmailUtilAudiWeb;
import com.oemp.audi.util.EmailUtilReset;
import com.oemp.audi.util.PasswordMD5;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.CmsUtils;
import com.oemp.frame.util.DateUtil;
/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-6-3
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.action.front.TbRegUserFrontAction")
public class TbRegUserFrontAction extends ContactBaseAction{
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	private TbRegUser user = new TbRegUser();
	private TbRegUser cm = new TbRegUser();
	private String message = ""; // 操作提示信息
    private String mailvalid="";//邮箱激活提示；
	private String isactive;// email是否可用
	private String remember = "";//记住密码
	private String returnurl = "";
	private String email="";
	private String username="";
	private String password="";
	public Long userid;
	
	// 用户登录
	public String login() throws Exception {
		Map map=new HashMap();
		try {
			 
			TbRegUser loginuser = new TbRegUser();
			PasswordMD5 md = new PasswordMD5();
			user.setPassword(md.calcMD5(password));
			loginuser = audiServiceDispatcher.getRegUserService().isPassword(email, user.getPassword());
			String Emailvalid="0";
			if (loginuser != null) {
				if(loginuser.getEmailvalid()==null){
					Emailvalid="1";
				}else{
					Emailvalid=loginuser.getEmailvalid();
				}
				if(Emailvalid.equals("0")){
					map.put("success", "false");
					 map.put("msgCode", 1);
					
				}else if (loginuser.getAvailabilityflag().equals("0")) {
					map.put("success", "false");
					 map.put("msgCode", 2);
				}else {
					 map.put("success", "true");
					this.setWebUser(loginuser);
					if (remember.equals("1")) {// 记住密码
						int timeout=30 * 24 * 60 * 60;
						setCookie("_email", loginuser.getEmail().replace("@", "|"), timeout);
						setCookie("_password", loginuser.getPassword(), timeout);
						setCookie("_remember", remember, timeout);
					}else{
						//清除登录 Cookies
						setCookie("_email", null,0);
						setCookie("_password", null,0);
						setCookie("_remember", null, 0);
					}
				}
			} else {
				map.put("success", "false");
				 map.put("msgCode", 3);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	
	// 用户登出
	public String logout() {
		this.setWebUser(null);
		//清除登录 Cookies
		setCookie("_email", null,0);
		setCookie("_password", null,0);
		setCookie("_remember", null, 0);
		return null;
	}
	
	String username1 = "";
	//用户注册
	public String add(){
		Integer errorCode=0;
		String message="";
		if(audiServiceDispatcher.getRegUserService().IsExitRegUser(user.getEmail())){
			//email isExists
			message="您的邮箱已被使用！";
			errorCode=1;
		}else{
			user.setRegtime(DateUtil.getNowDate());
			
			user.setEmailvalid("0");//没有邮箱激活状态;
			user.setAvailabilityflag("1");
			PasswordMD5 md = new PasswordMD5();
			user.setPassword(md.calcMD5(user.getPassword()));
			if(audiServiceDispatcher.getRegUserService().save(user)){
				//保存用户之后 给用户发普通邮件
				Boolean sendstatue = EmailUtilAudiWeb.sendEmail(user.getEmail(),ServletActionContext.getRequest(),"0",user.getUsername());
				if(sendstatue){
					message="发送成功！";
				}else {
					message="发送失败！";
				}
			}
		}
		Map map=new HashMap();
		map.put("errorCode", errorCode);
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	
	private boolean activateSuccess;
	String par="";
	public String getPar() {
		return par;
	}

	public void setPar(String par) {
		this.par = par;
	}

	//激活邮件中链接返回到该方法
	public String activateUser(){
		
		try {
			// 解密并返回String[0]=email;String[1]=发送时间
			String[] pars= EmailUtilAudiWeb.checkParIsValidity(par);
			TbRegUser user=audiServiceDispatcher.getRegUserService().getUserByEmail(pars[0]);
			user.setEmailvalid("1");
			if(audiServiceDispatcher.getRegUserService().updateUser(user)){
				this.setWebUser(user);
				activateSuccess=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "activate";
	}
	
	//忘记密码提交后发重置密码邮件
	@SuppressWarnings("unchecked")
	public String resetpwd(){
		Integer errorCode=0;//0：表示成功
		String message="";
		if(!audiServiceDispatcher.getRegUserService().IsExitRegUser(email)){
			//email isExists
			message="该邮箱不存在！";
			errorCode=1;
		}else{
			//根据邮箱，获得用户名
			TbRegUser user=audiServiceDispatcher.getRegUserService().getUserByEmail(email);
			//邮箱存在则给用户发普通邮件
			Boolean sendstatue = EmailUtilReset.sendEmail(email,ServletActionContext.getRequest(),"0",user.getUsername());
			if(sendstatue){
				message="发送成功！";
			}else {
				message="发送失败！";
			}
		}
		Map map=new HashMap();
		map.put("errorCode", errorCode);
		map.put("message", message);
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	
	//是否重置密码
	public boolean isResetPwdUrl;
	
	//跳转到密码修改页面
	public String resetUserPwd(){
		
		try {
			// 解密并返回String[0]=email;String[1]=发送时间
			String[] pars= EmailUtilReset.checkParIsValidity(par);
			setSessionValue("resetPwdEmail", pars[0]);
			isResetPwdUrl=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "activate";
	}
	
	//获得用户的新密码，加密，保存到数据库
	public String resetPsdTo(){
		Map map=new HashMap();
		map.put("errorCode", 0);
		try {
			Object obj=getSessionValue("resetPwdEmail");
			if(!CmsUtils.isEmpty(obj)){
				TbRegUser user=audiServiceDispatcher.getRegUserService().getUserByEmail(obj.toString());
				PasswordMD5 md5=new PasswordMD5();
				user.setPassword(md5.calcMD5(password));
				if(audiServiceDispatcher.getRegUserService().updateUser(user)){
					map.put("errorCode", 0);
					setWebUser(user);
					setSessionValue("resetPwdEmail", null);
				}else{
					 map.put("errorCode", 1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	
	
	public String update(){   //个人信息修改 
		PasswordMD5 md = new PasswordMD5();
		Map map=new HashMap();
		cm.setUserid(userid);
		
		TbRegUser tbRegUser =audiServiceDispatcher.getRegUserService().findByID(userid);
		tbRegUser.setGender(cm.getGender());
		tbRegUser.setUsername(cm.getUsername());
		tbRegUser.setMobile(cm.getMobile());
		tbRegUser.setBirthdayy(cm.getBirthdayy());
		tbRegUser.setBirthdaym(cm.getBirthdaym());
		tbRegUser.setBirthdayd(cm.getBirthdayd());
		tbRegUser.setProvince(cm.getProvince());
		tbRegUser.setAddress(cm.getAddress());
		tbRegUser.setCity(cm.getCity());
		tbRegUser.setPostcode(cm.getPostcode());
		tbRegUser.setIslicense(cm.getIslicense());
//		tbRegUser.setDriverage(cm.getDriverage());
		tbRegUser.setIntent(cm.getIntent());
//		tbRegUser.setIntentcars(cm.getIntentcars());
//		tbRegUser.setIntentmodels(cm.getIntentmodels());
//		tbRegUser.setDealerProvince(cm.getDealerProvince());
//		tbRegUser.setDealerCity(cm.getDealerCity());
//		tbRegUser.setIntentdealer(cm.getIntentdealer());
//		tbRegUser.setPlanbuytime(cm.getPlanbuytime());
//		tbRegUser.setBuybudget(cm.getBuybudget());
		tbRegUser.setIscar(cm.getIscar());
//		tbRegUser.setBrand(cm.getBrand());
//		tbRegUser.setModel(cm.getModel());
//		tbRegUser.setBuytimeyear(cm.getBuytimeyear());
//		tbRegUser.setBuytimemonth(cm.getBuytimemonth());
//		tbRegUser.setFootnum(cm.getFootnum());
		tbRegUser.setIsincept(cm.getIsincept());
		
		if(cm.getIslicense()==0||cm.getIslicense()==null){
			tbRegUser.setDriverage("");
		}
		else if(cm.getIslicense()==1){
			tbRegUser.setDriverage(cm.getDriverage());	
		}
		
		if(cm.getIntent()==0||cm.getIntent()==null){
			tbRegUser.setIntentcars(null);
			tbRegUser.setIntentmodels(null);
			tbRegUser.setDealerProvince(null);
			tbRegUser.setDealerCity(null);
			tbRegUser.setIntentdealer(null);
			tbRegUser.setPlanbuytime("");
			tbRegUser.setBuybudget("");
		}else if(cm.getIntent()==1){
			tbRegUser.setIntentcars(cm.getIntentcars());
			tbRegUser.setIntentmodels(cm.getIntentmodels());
			tbRegUser.setDealerProvince(cm.getDealerProvince());
			tbRegUser.setDealerCity(cm.getDealerCity());
			tbRegUser.setIntentdealer(cm.getIntentdealer());
			tbRegUser.setPlanbuytime(cm.getPlanbuytime());
			tbRegUser.setBuybudget(cm.getBuybudget());			
		}
		
		if(cm.getIscar().equals("0")||cm.getIscar()==null){
			tbRegUser.setBrand(null);
			tbRegUser.setModel(null);
			tbRegUser.setBuytimeyear("");
			tbRegUser.setBuytimemonth("");
			tbRegUser.setFootnum("");			
		}else if(cm.getIscar().equals("1")){			
			tbRegUser.setBrand(cm.getBrand());
			tbRegUser.setModel(cm.getModel());
			tbRegUser.setBuytimeyear(cm.getBuytimeyear());
			tbRegUser.setBuytimemonth(cm.getBuytimemonth());
			tbRegUser.setFootnum(cm.getFootnum());
		}
		
		
		boolean b=audiServiceDispatcher.getRegUserService().updateUser(tbRegUser);
		if(b){
			map.put("success", "true");
			map.put("msgCode", 0);
			this.setWebUser(tbRegUser);//重置session中的值
		}else{
			map.put("success", "false");
			 map.put("msgCode", 1);
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	
	public String modifyPassword(){//密码修改
		Map map=new HashMap();
		TbRegUser tbRegUser =audiServiceDispatcher.getRegUserService().findByID(userid);
		PasswordMD5 md5=new PasswordMD5();
		tbRegUser.setPassword(md5.calcMD5(password));
		boolean b=audiServiceDispatcher.getRegUserService().updateUser(tbRegUser);
		if(b){
			map.put("success", "true");
			map.put("msgCode", 0);
		}else{
			map.put("success", "false");
			 map.put("msgCode", 1);
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	
	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	/**
	 * @return the activateSuccess
	 */
	public boolean isActivateSuccess() {
		return activateSuccess;
	}
	/**
	 * @param activateSuccess the activateSuccess to set
	 */
	public void setActivateSuccess(boolean activateSuccess) {
		this.activateSuccess = activateSuccess;
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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

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
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return the mailvalid
	 */
	public String getMailvalid() {
		return mailvalid;
	}
	/**
	 * @param mailvalid the mailvalid to set
	 */
	public void setMailvalid(String mailvalid) {
		this.mailvalid = mailvalid;
	}
	/**
	 * @return the isactive
	 */
	public String getIsactive() {
		return isactive;
	}
	/**
	 * @param isactive the isactive to set
	 */
	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}
	/**
	 * @return the remember
	 */
	public String getRemember() {
		return remember;
	}
	/**
	 * @param remember the remember to set
	 */
	public void setRemember(String remember) {
		this.remember = remember;
	}
	/**
	 * @return the returnurl
	 */
	public String getReturnurl() {
		return returnurl;
	}
	/**
	 * @param returnurl the returnurl to set
	 */
	public void setReturnurl(String returnurl) {
		this.returnurl = returnurl;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public TbRegUser getCm() {
		return cm;
	}

	public void setCm(TbRegUser cm) {
		this.cm = cm;
	}

	/**
	 * @return the isResetPwdUrl
	 */
	public boolean isResetPwdUrl() {
		return isResetPwdUrl;
	}

	/**
	 * @param isResetPwdUrl the isResetPwdUrl to set
	 */
	public void setResetPwdUrl(boolean isResetPwdUrl) {
		this.isResetPwdUrl = isResetPwdUrl;
	}
	
}
