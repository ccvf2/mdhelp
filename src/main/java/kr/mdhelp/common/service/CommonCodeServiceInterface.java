package kr.mdhelp.common.service;

import java.util.List;
import java.util.Map;

import kr.mdhelp.common.model.CodeDTO;

public interface CommonCodeServiceInterface {

	/** 코드그룹목록 불러오기*/
	List<CodeDTO> getCodeGroupListNotRetunToNULL(Map<String, Object> searchParam);

	/** 코드목록 불러오기*/
	List<CodeDTO> getCodeListNotRetunToNULL(Map<String, Object> searchParam);

}
