package kr.mdhelp.admin.dao;

import java.util.List;
import java.util.Map;

import kr.mdhelp.admin.model.ApiKeyDTO;
import kr.mdhelp.common.model.CodeDTO;

public interface AdminApiDAOinterface {
	List<CodeDTO> getApiGroupList(Map<String, Object> searchParam);

	List<CodeDTO> getApiGroupStateList(Map<String, Object> searchParam);

	List<ApiKeyDTO> getApiList(Map<String, Object> searchParam);
}
