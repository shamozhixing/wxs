/**
 * 
 */
package com.oemp.audi.bean;

import java.util.Date;

/**
 * @author Xiaoyang Fan
 * @version 1.0, 2013-5-31
 */
public class TbSubscribeEnewsletter {
	 // Fields    

    private Long sid;//新闻id
    private String username;
    private Long userid;//用户id
    private String subscribeemail;//邮箱地址
    private String sendstatus;//订阅状态0订阅成功1失败
    private Date addtime;//添加时间
    private Date sendtime;//修改时间
    private String standby1;
    private String standby2;
    private String source;
    
    /** default constructor */
    public TbSubscribeEnewsletter() {
    }

	/** minimal constructor */
    public TbSubscribeEnewsletter(Long sid, Long userid) {
        this.sid = sid;
        this.userid = userid;
    }
    
    /** full constructor */
    public TbSubscribeEnewsletter(Long sid, String username, Long userid, String subscribeemail, String sendstatus, Date addtime,String standby1, String standby2, Date sendtime,String source) {
        this.sid = sid;
        this.username=username;
        this.userid = userid;
        this.subscribeemail = subscribeemail;
        this.sendstatus = sendstatus;
        this.addtime = addtime;
        this.standby1 = standby1;
        this.standby2 = standby2;
        this.sendtime=sendtime;
        this.source=source;
    }

    
    // Property accessors
    
    /**
	 * @return the sendtime
	 */
	public Date getSendtime() {
		return sendtime;
	}

	/**
	 * @param sendtime the sendtime to set
	 */
	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	/**
	 * @return the source
	 */
	public String getSource() {
		return source;
	}

	/**
	 * @param source the source to set
	 */
	public void setSource(String source) {
		this.source = source;
	}

	public Long getSid() {
        return this.sid;
    }
    
    /**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	public void setSid(Long sid) {
        this.sid = sid;
    }

    public Long getUserid() {
        return this.userid;
    }
    
    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getSubscribeemail() {
        return this.subscribeemail;
    }
    
    public void setSubscribeemail(String subscribeemail) {
        this.subscribeemail = subscribeemail;
    }

    public String getSendstatus() {
        return this.sendstatus;
    }
    
    public void setSendstatus(String sendstatus) {
        this.sendstatus = sendstatus;
    }

    public Date getAddtime() {
        return this.addtime;
    }
    
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public String getStandby1() {
        return this.standby1;
    }
    
    public void setStandby1(String standby1) {
        this.standby1 = standby1;
    }

    public String getStandby2() {
        return this.standby2;
    }
    
    public void setStandby2(String standby2) {
        this.standby2 = standby2;
    }
   
}
