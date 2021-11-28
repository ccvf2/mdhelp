package kr.mdhelp.admin.model;

import java.util.Date;

public class ApiKeyDTO {
	
	private Integer api_seq		=new Integer(0);
	private String api_org		="";
	private String org_id		="";
	private String api_key		="";
	private String api_value	="";
	private String api_title	="";
	private Date   api_regdt	=new Date();
	private String api_status	="";
	private String owner		="";
	private String code_name	="";
	
	
	public Integer getApi_seq() {
		return api_seq;
	}
	public void setApi_seq(Integer api_seq) {
		this.api_seq = api_seq;
	}
	public String getApi_org() {
		return api_org;
	}
	public void setApi_org(String api_org) {
		this.api_org = api_org;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getApi_key() {
		return api_key;
	}
	public void setApi_key(String api_key) {
		this.api_key = api_key;
	}
	public String getApi_value() {
		return api_value;
	}
	public void setApi_value(String api_value) {
		this.api_value = api_value;
	}
	public String getApi_title() {
		return api_title;
	}
	public void setApi_title(String api_title) {
		this.api_title = api_title;
	}
	public Date getApi_regdt() {
		return api_regdt;
	}
	public void setApi_regdt(Date api_regdt) {
		this.api_regdt = api_regdt;
	}
	public String getApi_status() {
		return api_status;
	}
	public void setApi_status(String api_status) {
		this.api_status = api_status;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
}
