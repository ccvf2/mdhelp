package kr.mdhelp.admin.dao;

import java.util.List;
import java.util.Map;

import kr.mdhelp.admin.model.ApiKeyDTO;

public interface AdminApiDAOinterface {
	List<ApiKeyDTO> getApiList(Map<String, Object> searchParam);
}
