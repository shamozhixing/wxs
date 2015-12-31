/*
 * @(#)FileNameUtils.java	2012-12-14
 *
 * Copyright 2012 BEIJING SHUZIJIAXIN Technology Co.. Ltd. All rights reserved.
 * SHUZIJIAXIN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.oemp.audi.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 网站文件上传
 * @author Deyun Chen
 * @version 1.0, 2012-12-14
 */
public final class FileUpload {
	/** 日志输出 */
	private static final Logger LOG = LoggerFactory.getLogger(FileUpload.class);
	
	private FileUpload() {
		
	}
	/** 上件图片类型 */
	public static final String FILE_IMGFILETYPE = ".gif|.jpg|.jpeg|.png|.bmp|.tmp|";
	/** 上件文件类型 */
	public static final String FILE_TXTFILETYPE = ".doc|.docx|.wps|.txt|.xls|.xlsx|.csv|.ppt|.pptx|.pdf|.tmp|";
	/** 计算机存储的1000 */
	public static final int K = 1024;
	/** 文件后缀分隔符 */
	public static final char DIAN = '.';
	/**
	 * 保存上传文件 
	 * @param uploadFile
	 * @param filename
	 * @return
	 */
	public static boolean fileSave(File uploadFile, String filename){
		if (uploadFile == null) {
			return false;
		}
		File newfile = new File(filename);
		InputStream in = null;
		OutputStream out = null;
		try {
			String fullPath=filename.substring(0,filename.lastIndexOf("/"));
			//目录是否存在
			File  filepath = new File(fullPath);
			if(!filepath.exists()){
				filepath.mkdirs();
	    	}
			in = new FileInputStream(uploadFile);
			out = new FileOutputStream(newfile);
			byte[] buffer = new byte[K * K];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			
			return true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}finally {
			if(in!=null) {
				try {
					in.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(out!=null) {
				try {
					out.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 图片上传保存
	 * @param uploadFile
	 * @param filename
	 * @return
	 */
	public static boolean imgFileSave(File uploadFile, String filename){
		String uploadfilename = uploadFile.getName();
		int isFill=uploadfilename.lastIndexOf(DIAN);
		if(isFill<1){
			return false;
		}
		String fileExt = uploadfilename.substring(isFill).toLowerCase()+"|";
		if(FILE_IMGFILETYPE.indexOf(fileExt)<0){
			return false;
		}
		return fileSave(uploadFile, filename);
	}
	/**
	 * 附件上传保存
	 * @param uploadFile
	 * @param filename
	 * @return
	 */
	public static boolean fileFileSave(File uploadFile, String filename){
		String uploadfilename = uploadFile.getName();
		int isFill=uploadfilename.lastIndexOf(DIAN);
		if(isFill<1){
			return false;
		}
		String fileExt = uploadfilename.substring(isFill).toLowerCase()+"|";
		if(FILE_TXTFILETYPE.indexOf(fileExt)<0){
			return false;
		}
		return fileSave(uploadFile, filename);
	}

}
