package kr.mdhelp.member.model;

import java.util.Date;

public class MemberDTO{

	/** 고객번호 */
	private Integer userNumber = new Integer(0);
	/** 고객 ID */
	private String id = "";
	/** 고객 ID */
	private String password = "";
	/** 고객명 */
	private String fullName = "";
	/** 고객등록일 */
	private Date registrationDate = new Date();
	/** 고객정보최종수정일 */
	private Date modifiedDate = new Date();
	/** 추가메일주소 */
	private String subEmail ="";
	/** 고객연락처1 */
	private String contactNumber1 ="";
	/** 고객연락처2 */
	private String contactNumber2 ="";
	/** 고객주소 */
	private String contactAddress ="";
	/** 미사용필드1 */
	private String contactFild1 ="";
	/** 미사용필드2 */
	private String contactFild2 ="";
	/** 고객등급 */
	private String level ="";
	/** 고객이메일 인증여부 */
	private String authenticat ="";
	/** 고객이메일 유저상태 */
	private String active ="";
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		String tempPWd = new String(password);
		//this.password = "";
		return tempPWd;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public String getSubEmail() {
		return subEmail;
	}
	public void setSubEmail(String subEmail) {
		this.subEmail = subEmail;
	}
	public String getContactNumber1() {
		return contactNumber1;
	}
	public void setContactNumber1(String contactNumber1) {
		this.contactNumber1 = contactNumber1;
	}
	public String getContactNumber2() {
		return contactNumber2;
	}
	public void setContactNumber2(String contactNumber2) {
		this.contactNumber2 = contactNumber2;
	}
	public String getContactAddress() {
		return contactAddress;
	}
	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}
	public String getContactFild1() {
		return contactFild1;
	}
	public void setContactFild1(String contactFild1) {
		this.contactFild1 = contactFild1;
	}
	public String getContactFild2() {
		return contactFild2;
	}
	public void setContactFild2(String contactFild2) {
		this.contactFild2 = contactFild2;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getAuthenticat() {
		return authenticat;
	}
	public void setAuthenticat(String authenticat) {
		this.authenticat = authenticat;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	

}
