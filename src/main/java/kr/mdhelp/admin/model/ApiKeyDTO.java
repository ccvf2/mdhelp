package kr.mdhelp.admin.model;

import java.util.Date;

public class ApiKeyDTO {
	
	private String API_ORG		="";
	private String ORG_ID		="";
	private String API_KEY		="";
	private String API_VALUE	="";
	private String API_TITLE	="";
	private Date API_REGDT		=new Date();
	private String API_STATUS	="";
	private String OWNER		="";
	private String CODE_NAME	="";
	
	public String getAPI_ORG() {
		return API_ORG;
	}
	public void setAPI_ORG(String aPI_ORG) {
		this.API_ORG = aPI_ORG;
	}
	public String getORG_ID() {
		return ORG_ID;
	}
	public void setORG_ID(String oRG_ID) {
		this.ORG_ID = oRG_ID;
	}
	public String getAPI_KEY() {
		return API_KEY;
	}
	public void setAPI_KEY(String aPI_KEY) {
		this.API_KEY = aPI_KEY;
	}
	public String getAPI_VALUE() {
		return API_VALUE;
	}
	public void setAPI_VALUE(String aPI_VALUE) {
		this.API_VALUE = aPI_VALUE;
	}
	public String getAPI_TITLE() {
		return API_TITLE;
	}
	public void setAPI_TITLE(String aPI_TITLE) {
		this.API_TITLE = aPI_TITLE;
	}
	public Date getAPI_REGDT() {
		return API_REGDT;
	}
	public void setAPI_REGDT(Date aPI_REGDT) {
		this.API_REGDT = aPI_REGDT;
	}
	public String getAPI_STATUS() {
		return API_STATUS;
	}
	public void setAPI_STATUS(String aPI_STATUS) {
		this.API_STATUS = aPI_STATUS;
	}
	public String getOWNER() {
		return OWNER;
	}
	public void setOWNER(String oWNER) {
		this.OWNER = oWNER;
	}
	public String getCODE_NAME() {
		return CODE_NAME;
	}
	public void setCODE_NAME(String cODE_NAME) {
		this.CODE_NAME = cODE_NAME;
	}
}
