package kr.mdhelp.admin.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mdhelp.admin.dao.AdminApiDAOinterface;
import kr.mdhelp.admin.model.ApiKeyDTO;

@Service
public class AdminApiService implements AdminApiServiceInterface{
	private static final Logger logger = LoggerFactory.getLogger(AdminApiService.class);
	@Autowired
	AdminApiDAOinterface adminApiDAO; 
	
	@Override
	public List<ApiKeyDTO> getApiList(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return adminApiDAO.getApiList(searchParam);
	}
}
