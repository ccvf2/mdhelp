package kr.mdhelp.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mdhelp.admin.dao.AdminCodeDAOInterface;
import kr.mdhelp.common.model.CodeDTO;

@Service
public class AdminCodeService implements AdminCodeServiceInterface{
	private static final Logger logger = LoggerFactory.getLogger(AdminCodeService.class);
	@Autowired
	AdminCodeDAOInterface adminCodeDAO; 
	/** 코드그룹삭제 */
	@Override
	public CodeDTO deleteCodeGroupRetunToNULL(CodeDTO codeGroupDTO) {
		adminCodeDAO.deleteCodeGroup(codeGroupDTO);
		return codeGroupDTO;
	}
	/** 코드그룹등록*/
	@Override
	public CodeDTO insertCodeGroupRetunToNULL(CodeDTO codeGroupDTO) {
		logger.info("=============================insertCodeGroup");
		codeGroupDTO.setCode_sort(0);
		codeGroupDTO.setCode_group(codeGroupDTO.getCode());
		codeGroupDTO.setCode_group_name(codeGroupDTO.getCode_name());
		
		adminCodeDAO.insertCodeGroup(codeGroupDTO);
		return codeGroupDTO;
	}
	
	/** 코드등록 */
	@Override
	public CodeDTO insertCodeRetunToNULL(CodeDTO codeDTO) {
		adminCodeDAO.insertCode(codeDTO);
		return codeDTO;
	}
	
	/** 코드삭제 */
	@Override
	public int deleteCodeRetunToNULL(String code) {
		adminCodeDAO.deleteCode(code);
		return 0;
	}
}
