package com.oemp.audi.action.front;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oemp.audi.bean.ContactDriver;
import com.oemp.audi.bean.ContactProductbook;
import com.oemp.audi.util.AudiServiceDispatcher;
import com.oemp.audi.util.SendMessageUtil;
import com.oemp.common.UtilTools;
import com.oemp.frame.util.CmsUtils;
import com.oemp.frame.util.DateUtil;
@SuppressWarnings("serial")
@Scope("prototype")
@Controller("audi.front.action.ContactDriverAction")
public class ContactDriverFrontAction extends ContactBaseAction {
	@Autowired
	protected AudiServiceDispatcher audiServiceDispatcher;
	ContactDriver cd=new ContactDriver();
	//验证码
	private String validCode;
	List<ContactProductbook> cpList;
	/**
	 * 进入试驾也初始化
	 * @return
	 */
	public String init(){
		cpList=audiServiceDispatcher.getContactProductbookService().getByCpType(1);
		return "init";
	}
	public String getJson(){
		Map<Object, List<ContactProductbook>> map=new HashMap<Object, List<ContactProductbook>>();
		for (int i = 0; i < cpList.size(); i++) {
			ContactProductbook bean=cpList.get(i);
			//是否已经有了
			if(map.containsKey(bean.getCpIntentcars())){
				map.get(bean.getCpIntentcars()).add(bean);
			}else{
				List<ContactProductbook> list=new ArrayList<ContactProductbook>();
				list.add(bean);
				map.put(bean.getCpIntentcars(), list);
			}
		}
		return UtilTools.getJsonForObject(map);
	}
	public String save(){
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		 Map map=new HashMap();
		try {
			Object valudMobile=getSessionValue("testdriver"+cd.getCdMobile());
			if(!valudMobile.toString().equals(validCode)){
				map.put("success", "false");
			}else{
				cd.setCdAddtime(DateUtil.getNowDate());
				cd.setCdFlag(Long.valueOf(1));
				ContactDriver bean=audiServiceDispatcher.getContactDriverService().save(cd);
				 map.put("success", "true");
				 map.put("msg", "");
				 if(bean==null){
					map.put("success", "false");
					 map.put("msg", "提交失败!");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "false");
			map.put("msg", e.getMessage());
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	/**
	 * 校验验证码
	 * @return
	 */
	public String sendMobileCode(){
		String code=CmsUtils.getRandomNumber(6);
		Map map=new HashMap();
		if(!CmsUtils.isEmpty(cd) && !CmsUtils.isEmpty(cd.getCdMobile()) && CmsUtils.isMobile(cd.getCdMobile())){
			String msgContent="感谢您对奥迪品牌的关注和支持，您的验证码是"+code+"，请输入继续完成预约试驾，该验证码30分钟内输入有效。";
			System.out.println(code);
			SendMessageUtil.sendMsg(cd.getCdMobile(), msgContent);
			setSessionValue("testdriver"+cd.getCdMobile(), code);
			map.put("success", "true");
		}else{
			map.put("success", "false");
			map.put("msg", "手机号码格式不正确!");
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	/**
	 * 验证码的有效性
	 * @return
	 */
	public String mobileValidCode(){
		Object valudMobile=getSessionValue("testdriver"+cd.getCdMobile());
		Map map=new HashMap();
		if(!CmsUtils.isEmpty(valudMobile) && !CmsUtils.isEmpty(validCode) 
				&& valudMobile.toString().equals(validCode)){
			map.put("success", "true");
		}else{
			map.put("success", "false");
			setSessionValue("testdriver"+cd.getCdMobile(), "");
		}
		renderJson(UtilTools.getJsonForObject(map));
		return null;
	}
	/**
	 * @return the cd
	 */
	public ContactDriver getCd() {
		return cd;
	}

	/**
	 * @param cd the cd to set
	 */
	public void setCd(ContactDriver cd) {
		this.cd = cd;
	}

	/**
	 * @return the validCode
	 */
	public String getValidCode() {
		return validCode;
	}

	/**
	 * @param validCode the validCode to set
	 */
	public void setValidCode(String validCode) {
		this.validCode = validCode;
	}

	/**
	 * @return the cpList
	 */
	public List<ContactProductbook> getCpList() {
		return cpList;
	}

	/**
	 * @param cpList the cpList to set
	 */
	public void setCpList(List<ContactProductbook> cpList) {
		this.cpList = cpList;
	}
	
	
}
