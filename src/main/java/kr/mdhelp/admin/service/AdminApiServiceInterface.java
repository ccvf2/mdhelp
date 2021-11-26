package kr.mdhelp.admin.service;

import java.util.List;
import java.util.Map;

import kr.mdhelp.admin.model.ApiKeyDTO;

public interface AdminApiServiceInterface {

	/** API 전체 목록 불러오기*/
	List<ApiKeyDTO> getApiList(Map<String, Object> searchParam);

}
