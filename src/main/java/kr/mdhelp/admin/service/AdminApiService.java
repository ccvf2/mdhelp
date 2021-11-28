package kr.mdhelp.admin.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mdhelp.admin.dao.AdminApiDAOinterface;
import kr.mdhelp.admin.model.ApiKeyDTO;
import kr.mdhelp.common.model.CodeDTO;

@Service
public class AdminApiService implements AdminApiServiceInterface{
	private static final Logger logger = LoggerFactory.getLogger(AdminApiService.class);
	@Autowired
	AdminApiDAOinterface adminApiDAO; 
	
	@Override
	public List<CodeDTO> getApiGroupList(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return adminApiDAO.getApiGroupList(searchParam);
	}

	@Override
	public List<CodeDTO> getApiGroupStateList(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return adminApiDAO.getApiGroupStateList(searchParam);
	}

	@Override
	public List<ApiKeyDTO> getApiList(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return adminApiDAO.getApiList(searchParam);
	}

	@Override
	public int insertApikeyRetunToNULL(ApiKeyDTO apiKeyDTO) {
		// TODO Auto-generated method stub
		return adminApiDAO.insertApikeyRetunToNULL(apiKeyDTO);
	}

	@Override
	public int updateApikeyRetunToNULL(ApiKeyDTO apiKeyDTO) {
		// TODO Auto-generated method stub
		return adminApiDAO.updateApikeyRetunToNULL(apiKeyDTO);
	}

	@Override
	public ApiKeyDTO getApikeyRetunToNULL(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		return adminApiDAO.getApikeyRetunToNULL(searchParam);
	}
}
