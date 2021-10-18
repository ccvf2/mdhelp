package kr.mdhelp.admin.dao;

import kr.mdhelp.common.model.CodeDTO;

public interface AdminCodeDAOInterface {

	int insertCodeGroup(CodeDTO codeGroupDTO);
	
	int deleteCodeGroup(CodeDTO codeGroupDTO);

	int insertCode(CodeDTO codeDTO);

	int deleteCode(String code);


}
