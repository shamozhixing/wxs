package com.oemp.audi.bean;
// default package

import java.util.Date;


/**
 * 建议
 * 后台 ：建议信息管理
 */

public class ContactProposal  implements java.io.Serializable {


    // Fields    

     private Long cpId;  				//主键
     private Long cpUserid;  			//用户id
     private Date cpAddtime;  			//创建日期
     private String cpName;  			//姓名
     private Long cpGender; 			//性别
     private String cpMobile;  			//手机号
     private Date cpBirthday;  			//出生日期
     private String cpDescription;		//建议内容描述
     private Long cpWhen;  				//联系时间
     private String cpTiming;				//具体时间


    // Constructors

    /** default constructor */
    public ContactProposal() {
    }

	/** minimal constructor */
    public ContactProposal(Long cpId) {
        this.cpId = cpId;
    }
    
    /** full constructor */
    public ContactProposal(Long cpId, Long cpUserid, Date cpAddtime, String cpName, Long cpGender, String cpMobile, Date cpBirthday, String cpDescription, Long cpWhen, String cpTiming) {
        this.cpId = cpId;
        this.cpUserid = cpUserid;
        this.cpAddtime = cpAddtime;
        this.cpName = cpName;
        this.cpGender = cpGender;
        this.cpMobile = cpMobile;
        this.cpBirthday = cpBirthday;
        this.cpDescription = cpDescription;
        this.cpWhen = cpWhen;
        this.cpTiming = cpTiming;
    }

   
    // Property accessors

    public Long getCpId() {
        return this.cpId;
    }
    
    public void setCpId(Long cpId) {
        this.cpId = cpId;
    }

    public Long getCpUserid() {
        return this.cpUserid;
    }
    
    public void setCpUserid(Long cpUserid) {
        this.cpUserid = cpUserid;
    }

    public Date getCpAddtime() {
		return cpAddtime;
	}

	public void setCpAddtime(Date cpAddtime) {
		this.cpAddtime = cpAddtime;
	}

	public String getCpName() {
        return this.cpName;
    }
    
    public void setCpName(String cpName) {
        this.cpName = cpName;
    }

    public Long getCpGender() {
        return this.cpGender;
    }
    
    public void setCpGender(Long cpGender) {
        this.cpGender = cpGender;
    }

    public String getCpMobile() {
        return this.cpMobile;
    }
    
    public void setCpMobile(String cpMobile) {
        this.cpMobile = cpMobile;
    }

    public Date getCpBirthday() {
        return this.cpBirthday;
    }
    
    public void setCpBirthday(Date cpBirthday) {
        this.cpBirthday = cpBirthday;
    }

    public String getCpDescription() {
        return this.cpDescription;
    }
    
    public void setCpDescription(String cpDescription) {
        this.cpDescription = cpDescription;
    }

    public Long getCpWhen() {
        return this.cpWhen;
    }
    
    public void setCpWhen(Long cpWhen) {
        this.cpWhen = cpWhen;
    }

	public String getCpTiming() {
		return cpTiming;
	}

	public void setCpTiming(String cpTiming) {
		this.cpTiming = cpTiming;
	}





}