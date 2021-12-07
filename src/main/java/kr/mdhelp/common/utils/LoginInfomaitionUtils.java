package kr.mdhelp.common.utils;

import java.util.Collection;
import java.util.Iterator;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import kr.mdhelp.admin.controller.AdminCodeController;
import kr.mdhelp.common.model.CustomUserDetails;

public class LoginInfomaitionUtils {

	private static final Logger logger = LoggerFactory.getLogger(AdminCodeController.class);
	
	
	public static final String getUserNameToNotNull () { 
		logger.info("=============================getUserNameToNotNull ::::::::::::::::::::::::::::");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginName = "";
		if( StringUtils.equals(auth.getName(),"anonymousUser") || StringUtils.equals(auth.getName(), "") ) {
			loginName = ""; 
		}else {
			loginName = auth.getName();
			//CustomUserDetails memberDTO = (CustomUserDetails)auth.getDetails();
			
			logger.info("============================ =memberDTO.getId   [{}]",loginName);
		}
		return loginName;
	}
	public static final String getUserAuthoritiesNull () {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String authorities ="";
		StringBuffer sb = new StringBuffer();
			boolean adminFlag = false;
			boolean anonymousFlag = true;
			Collection<? extends GrantedAuthority> ga =auth.getAuthorities();
			Iterator<?> it = ga.iterator();
			while(it.hasNext()) {
				String keyString = it.next().toString();
				sb.append(keyString);sb.append(",");
				if(StringUtils.equals(keyString, "USERLEV2")) {
					adminFlag = true;
				}else if(StringUtils.equals(keyString, "ROLE_ANONYMOUS")) {
					anonymousFlag = true;
				}else {
					anonymousFlag = false;
				}
			}
			if(adminFlag) {
				authorities = "administor";
			}else{
				if(anonymousFlag) {
					authorities ="anonymous";
				}else {
					authorities = "normalUser";
				}
			}
			

		return authorities;
	}
}
