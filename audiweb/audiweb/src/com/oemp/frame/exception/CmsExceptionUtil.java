package com.oemp.frame.exception;

public class CmsExceptionUtil {
	
	public static CmsBaseException getBaseException(String message,Throwable e){
		return new CmsBaseException(message,e);
	}
	
	
	public static CmsBaseException getSystemException(String message,Throwable e){
		return new SystemException(message,e);
	}
	public static CmsBaseException getPrivlegeException(String message,Throwable e){
		return new PrivlegeException(message,e);
	}
	
	public static CmsBaseException getNotFindException(String message, Throwable e){
		return new NotFindException(message, e);
	}

}
