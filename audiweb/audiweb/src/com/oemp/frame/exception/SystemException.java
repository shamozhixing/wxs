package com.oemp.frame.exception;

/** 系统异常 */
@SuppressWarnings("serial")
public class SystemException extends CmsBaseException{
	public SystemException(String message){
		super(message);
	}
	
	public SystemException(String message, Throwable e){
		super(message, e);
	}
}
