package com.oemp.audi.bean;


public class CmsDictionary  implements java.io.Serializable {


    // Fields    
	
     private Long cid;//主键
     private Long upid;//父级id
     private String cnname;//中文名称
     private String enname;//英文名称
     private String remark;//备注
     private Long availabilityflag;//是否有效
     private Long ordernum;//排序
     private String standby1;//备用字段
     private String standby2;//备用字段


    // Constructors

    /** default constructor */
    public CmsDictionary() {
    }

    
    /** full constructor */
    public CmsDictionary(Long upid, String cnname, String enname, String remark, Long availabilityflag, Long ordernum, String standby1, String standby2) {
        this.upid = upid;
        this.cnname = cnname;
        this.enname = enname;
        this.remark = remark;
        this.availabilityflag = availabilityflag;
        this.ordernum = ordernum;
        this.standby1 = standby1;
        this.standby2 = standby2;
    }

   
    // Property accessors

    public Long getCid() {
        return this.cid;
    }
    
    public void setCid(Long cid) {
        this.cid = cid;
    }

    public Long getUpid() {
        return this.upid;
    }
    
    public void setUpid(Long upid) {
        this.upid = upid;
    }

    public String getCnname() {
        return this.cnname;
    }
    
    public void setCnname(String cnname) {
        this.cnname = cnname;
    }

    public String getEnname() {
        return this.enname;
    }
    
    public void setEnname(String enname) {
        this.enname = enname;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getAvailabilityflag() {
        return this.availabilityflag;
    }
    
    public void setAvailabilityflag(Long availabilityflag) {
        this.availabilityflag = availabilityflag;
    }

    public Long getOrdernum() {
        return this.ordernum;
    }
    
    public void setOrdernum(Long ordernum) {
        this.ordernum = ordernum;
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