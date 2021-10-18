package kr.mdhelp.admin.service;

import kr.mdhelp.common.model.CodeDTO;

public interface AdminCodeServiceInterface {

	/** 코드그룹삭제 */
	CodeDTO deleteCodeGroupRetunToNULL(CodeDTO codeGroupDTO);
	
	/** 코드그룹등록*/
	CodeDTO insertCodeGroupRetunToNULL(CodeDTO codeGroupDTO);

	/** 코드등록 */
	CodeDTO insertCodeRetunToNULL(CodeDTO codeDTO);

	/** 코드삭제 */
	int deleteCodeRetunToNULL(String code);


}
