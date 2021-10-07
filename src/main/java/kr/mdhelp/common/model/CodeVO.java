package kr.mdhelp.common.model;

import java.util.Date;

public class CodeVO {

	String	code			="";
	String	code_name		="";
	String	code_group		="";
	String	code_group_name	="";
	int		code_group_sort	=0;
	String	code_value		="";
	String	code_comment	="";
	Date	code_regdt		= new Date();
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getCode_group() {
		return code_group;
	}
	public void setCode_group(String code_group) {
		this.code_group = code_group;
	}
	public String getCode_group_name() {
		return code_group_name;
	}
	public void setCode_group_name(String code_group_name) {
		this.code_group_name = code_group_name;
	}
	public int getCode_group_sort() {
		return code_group_sort;
	}
	public void setCode_group_sort(int code_group_sort) {
		this.code_group_sort = code_group_sort;
	}
	public String getCode_value() {
		return code_value;
	}
	public void setCode_value(String code_value) {
		this.code_value = code_value;
	}
	public String getCode_comment() {
		return code_comment;
	}
	public void setCode_comment(String code_comment) {
		this.code_comment = code_comment;
	}
	public Date getCode_regdt() {
		return code_regdt;
	}
	public void setCode_regdt(Date code_regdt) {
		this.code_regdt = code_regdt;
	}
	
}
