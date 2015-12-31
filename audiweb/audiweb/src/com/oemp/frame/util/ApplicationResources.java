package com.oemp.frame.util;

import java.util.ResourceBundle;

/** 获取系统资源文件键值内容 */
public class ApplicationResources {
    private static ResourceBundle rb = null;

    public ApplicationResources() {
    	
    }
    
    static {
    	rb = ResourceBundle.getBundle("oempCms");
    }
    
    public static String getText(String str) {
    	
    	return rb.getString(str);
    }

    public static void main(String[] args) {
    	System.out.println(ApplicationResources.getText("PageSize"));
	}

}
