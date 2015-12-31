package com.oemp.frame.exception;

@SuppressWarnings("serial")
public class CmsBaseException extends RuntimeException{
	
	public CmsBaseException(String arg0) {
		super(arg0);
	}
	
	public CmsBaseException(String arg0 , Throwable e) {
		super(arg0, e);
		originalException = e;
	}

	/**
	 * 引发 CmsBaseException  的异常。
	 */
	private Throwable originalException;
	
	public Throwable getOriginalException(){
		if(originalException==null){
			return this;
		}
		return this.originalException;
	}

}
