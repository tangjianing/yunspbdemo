package com.hp.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class AccountInfo implements Serializable{
     private String account_id;
     private String root_dir;
     private String quota;
 	 private String dt;
 	 private String bytes_num;
     private String file_num;
     private String user_name;
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public String getRoot_dir() {
		return root_dir;
	}
	public void setRoot_dir(String root_dir) {
		this.root_dir = root_dir;
	}
	public String getQuota() {
		return quota;
	}
	public void setQuota(String quota) {
		this.quota = quota;
	}
	
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getBytes_num() {
		return bytes_num;
	}
	public void setBytes_num(String bytes_num) {
		this.bytes_num = bytes_num;
	}
	public String getFile_num() {
		return file_num;
	}
	public void setFile_num(String file_num) {
		this.file_num = file_num;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
 	
 	
     
}
