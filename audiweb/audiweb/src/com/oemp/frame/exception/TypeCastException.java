package com.oemp.frame.exception;

/**
 * 类型转换异常
 * @author cdy
 *
 */
@SuppressWarnings("serial")
public class TypeCastException extends CmsBaseException{
	public TypeCastException(String message){
		super(message);
	}
	
	public TypeCastException(String message, Throwable e){
		super(message, e);
	}

}
