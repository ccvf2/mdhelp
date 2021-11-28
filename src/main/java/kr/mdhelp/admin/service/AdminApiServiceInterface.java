package kr.mdhelp.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.mdhelp.admin.model.ApiKeyDTO;
import kr.mdhelp.common.model.CodeDTO;

public interface AdminApiServiceInterface {

	/** API 전체 목록(Api-Group) 불러오기*/
	List<CodeDTO> getApiGroupList(Map<String, Object> searchParam);
	
	List<CodeDTO> getApiGroupStateList(Map<String, Object> searchParam);

	List<ApiKeyDTO> getApiList(Map<String, Object> searchParam);

	int insertApikeyRetunToNULL(ApiKeyDTO apiKeyDTO);

	int updateApikeyRetunToNULL(ApiKeyDTO apiKeyDTO);

	ApiKeyDTO getApikeyRetunToNULL(Map<String, Object> searchMap);

}
