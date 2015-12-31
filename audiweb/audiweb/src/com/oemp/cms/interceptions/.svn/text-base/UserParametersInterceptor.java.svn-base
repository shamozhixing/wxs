package com.oemp.cms.interceptions;

import java.util.Iterator;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 参数特殊字符过滤
 * @author cdy
 *
 */
public class UserParametersInterceptor extends AbstractInterceptor{

	public String intercept(ActionInvocation arg0) throws Exception {
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> pmap = ctx.getParameters();
		if(pmap!=null){
			Iterator i = pmap.keySet().iterator();
			while(i.hasNext()){
				String key = (String)i.next();
				Object value = pmap.get(key);
				
				if(value instanceof  String || value instanceof  String[]){
					if(value instanceof String){
						value = filter(String.valueOf(value));
						pmap.put(key, value);
					}else{
						String[] kvs = (String[])value;
						for(int j=0;j<kvs.length;j++){
							kvs[j] = filter(kvs[j]);
						}
						pmap.put(key, kvs);
					}
				}
			}
			ctx.setParameters(pmap);
		}
		return arg0.invoke();
	}
	
	/*private String filter(String value){
		if(value!=null){
			return org.springframework.web.util.HtmlUtils.htmlEscape(value);  
		}
		return value;
	}*/
	
	public static String filter(String value) {
		if (value == null) {
			return null;
		}
		StringBuffer result = new StringBuffer(value.length());
		for (int i=0; i<value.length(); ++i) {
			switch (value.charAt(i)) {
				case '<':
				result.append("&lt;");
				break;
				case '>':
				result.append("&gt;");
				break;
				case '"':
				result.append("&quot;");
				break;
				case '\'':
				result.append("&#39;");
				break;
				case '%':
				result.append("&#37;");
				break;
				case ';':
				result.append("&#59;");
				break;
				case '(':
				result.append("&#40;");
				break;
				case ')':
				result.append("&#41;");
				break;
				case '&':
				result.append("&amp;");
				break;
				case '+':
				result.append("&#43;");
				break;
				default:
				result.append(value.charAt(i));
				break;
			}
		}
		return result.toString();
	}
	

}
