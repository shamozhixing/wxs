package com.oemp.frame.page;

import java.util.List;


@SuppressWarnings("serial")
public class PageTools<T> extends SimplePage implements java.io.Serializable,Page {

	public PageTools() {
	
	}

	public PageTools(int pageNo, int pageSize, int totalCount) {
		super(pageNo, pageSize, totalCount);
	}
	
	public PageTools(int pageNo, int pageSize, int totalCount, List<T> pagelist) {
		super(pageNo, pageSize, totalCount);
		this.list = pagelist;
	}
	
	public PageTools(int pageNo, int pageSize, List<T> dataList){
		
		this(pageNo, pageSize, dataList.size());
		if(pageSize==10000000){
			setList(dataList);
		}else{
			int findex = (pageNo-1)*pageSize;
			int tindex = pageNo*pageSize;
			if(findex>dataList.size()){
				findex = 0;
			}
			if(tindex>dataList.size()){
				tindex = dataList.size();
			}
			setList(dataList.subList(findex, tindex));
		}
	}
	
	public int getFirstResult() {
		return (pageNo - 1) * pageSize;
	}
	
	/**
	 * 当前页的数据
	 */
	private List<T> list;
	
	public List<T> getList() {
		return list;
	}
	
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
