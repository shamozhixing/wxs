package com.oemp.audi.bean;

import java.io.Serializable;

public class TbRegGA implements Serializable {
	
	private Long gaid;
	private String source;
	private String medium;
	private String term;
	private String content;
	private String campaign;
	private String numVisits;
	private String segment;
	private Long userID;
	
	
	public Long getGaid() {
		return gaid;
	}
	public void setGaid(Long gaid) {
		this.gaid = gaid;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getSegment() {
		return segment;
	}
	public void setSegment(String segment) {
		this.segment = segment;
	}
	public String getMedium() {
		return medium;
	}
	public void setMedium(String medium) {
		this.medium = medium;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCampaign() {
		return campaign;
	}
	public void setCampaign(String campaign) {
		this.campaign = campaign;
	}
	public String getNumVisits() {
		return numVisits;
	}
	public void setNumVisits(String numVisits) {
		this.numVisits = numVisits;
	}
	public Long getUserID() {
		return userID;
	}
	public void setUserID(Long userID) {
		this.userID = userID;
	}

}
