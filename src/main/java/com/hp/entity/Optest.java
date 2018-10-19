package com.hp.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Optest implements Serializable{
     private Integer id;
     private String opinion;
     private String biz_type;
     private String uid;
     private String status;
     private String tenentid;
 	private Timestamp create_date;
 	private Timestamp modify_date;
 	
 	public String getTenentid() {
		return tenentid;
	}
	public void setTenentid(String tenentid) {
		this.tenentid = tenentid;
	}
	public Timestamp getCreate_date() {
 		return create_date;
 	}
 	public void setCreate_date(Timestamp create_date) {
 		this.create_date = create_date;
 	}
 	public Timestamp getModify_date() {
 		return modify_date;
 	}
 	public void setModify_date(Timestamp modify_date) {
 		this.modify_date = modify_date;
 	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public String getBiz_type() {
		return biz_type;
	}
	public void setBiz_type(String biz_type) {
		this.biz_type = biz_type;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
     
}
