package com.oemp.cms.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.oemp.cms.bean.CmsUser;
import com.oemp.frame.session.CmsSession;
import com.oemp.frame.util.ApplicationResources;
import com.oemp.frame.util.CmsConstants;


/**
 * 权限内容判断
 * @author cdy
 *
 */
public final class PagePrivlegeUtil {
	
	public static final String ADD = "ADD";
	public static final String QUERY = "VIEW";
	public static final String MOD = "MOD";
	public static final String DEL = "DEL";
	public static final String CHECK = "CHECK";
	public static final String PUB = "PUB";
	
	private static List<String> vallist;
	
	static {
		vallist = new ArrayList<String>();
		vallist.add(ADD);
		vallist.add(QUERY);
		vallist.add(MOD);
		vallist.add(DEL);
		vallist.add(CHECK);
		vallist.add(PUB);
	}
	/**
	 * 所有权限值
	 * @return
	 */
	public static List<String> getPrivlegeValues(){
		return vallist;
	}
	
	/** 是否启用操作权限 */
	public final static boolean SYSTEM_PAGE_PRIVEGE = new Boolean(ApplicationResources.getText("system.pagePrivlege")).booleanValue();
	
	@SuppressWarnings("unchecked")
	private static Map<Integer,String> getPrivlege(){
		return (Map<Integer,String>)CmsSession.getInstance().get(CmsConstants.USER_PRIVLEGE_CONTENT);
	}
	/** 
	 * 权限判断
	 * @param nodeid	功能ID
	 * @param val		权限值
	 * @return
	 */
	public static boolean isPrivlege(Integer nodeid, String val){
		Map<Integer,String> pm = getPrivlege();
		return isAdmins() ? true : ( pm !=null && pm.containsKey(nodeid)? pm.get(nodeid).indexOf(val)>-1 : false );
	}
	/** 
	 * 获取功能菜单权限值
	 * @param nodeid    功能ID
	 * @return
	 */
	public static String getPrivlegeValue(Integer nodeid){
		Map<Integer,String> pm = getPrivlege();
		return pm.get(nodeid);
	}
	/** 是否超级管理员 */
	public static boolean isAdmins(){
		CmsUser cu = (CmsUser)CmsSession.getInstance().get(CmsConstants.ADMIN_USER);
		return !SYSTEM_PAGE_PRIVEGE || (cu.getCmuIsAdmin()!=null && cu.getCmuIsAdmin()==1);
	}
	
}
