package com.oemp.api.bean;
// default package

import java.util.Date;


/**
 * 试驾接口表
 * 后台 : 试驾接口管理
 */
public class ContactApi  implements java.io.Serializable {


    // 10 Fields    

     private Long caId;				//	主键
   
     private String caCamName;			//	活动名称
     private String caCode;			//	活动代码
     private String caIp;			//	网站IP
     private String caAppkey;			//	生成的key值
     private String caStatus;			//	状态-  0：无效 1 ：有效
     private String caAdduserid;			//	创建人
     
     private Date caAddtime;		//	创建时间 
  



    /** full constructor */
    public ContactApi(Long caId, String caCamName, String caCode, String caIp, String caAppkey, String caStatus, String caAdduserid, Date caAddtime) {
        this.caId = caId;
        this.caCamName = caCamName;
        this.caCode = caCode;
        this.caIp = caIp;
        this.caAppkey = caAppkey;
        this.caStatus = caStatus;
        this.caAdduserid = caAdduserid;
        this.caAddtime = caAddtime;
        
    }




	public Date getCaAddtime() {
		return caAddtime;
	}




	public void setCaAddtime(Date caAddtime) {
		this.caAddtime = caAddtime;
	}




	public String getCaAdduserid() {
		return caAdduserid;
	}




	public void setCaAdduserid(String caAdduserid) {
		this.caAdduserid = caAdduserid;
	}




	public String getCaAppkey() {
		return caAppkey;
	}




	public void setCaAppkey(String caAppkey) {
		this.caAppkey = caAppkey;
	}




	public String getCaCamName() {
		return caCamName;
	}




	public void setCaCamName(String caCamName) {
		this.caCamName = caCamName;
	}




	public String getCaCode() {
		return caCode;
	}




	public void setCaCode(String caCode) {
		this.caCode = caCode;
	}




	public Long getCaId() {
		return caId;
	}




	public void setCaId(Long caId) {
		this.caId = caId;
	}




	public String getCaIp() {
		return caIp;
	}




	public void setCaIp(String caIp) {
		this.caIp = caIp;
	}




	public String getCaStatus() {
		return caStatus;
	}




	public void setCaStatus(String caStatus) {
		this.caStatus = caStatus;
	}

   
   


}