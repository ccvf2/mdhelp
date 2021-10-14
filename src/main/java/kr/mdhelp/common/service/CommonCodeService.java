package kr.mdhelp.common.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mdhelp.common.dao.CommonCodeDAO;
import kr.mdhelp.common.model.CodeVO;

@Service
public class CommonCodeService {
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeService.class);
	
	@Autowired
	CommonCodeDAO commonCodeDAO;
	/** 코드그룹목록 불러오기*/
	public List<CodeVO> getCodeGroupListNotRetunToNULL(Map<String, Object> searchParam) {
		logger.info("=============================get_CodeGroup_ListNotRetunToNULL");
		List<CodeVO> cgList = commonCodeDAO.getCodeGroupList(searchParam);
		if(cgList == null) {
			cgList = new LinkedList<CodeVO>();
		}
		return cgList;
	}
	/** 코드그룹등록*/
	public CodeVO insertCodeGroupRetunToNULL(CodeVO codeGroupVO) {
		logger.info("=============================insertCodeGroup");
		codeGroupVO.setCode_sort(0);
		codeGroupVO.setCode_group(codeGroupVO.getCode());
		codeGroupVO.setCode_group_name(codeGroupVO.getCode_name());
		
		commonCodeDAO.insertCodeGroup(codeGroupVO);
		return codeGroupVO;
	}
	/** 코드목록 불러오기*/
	public List<CodeVO> getCodeListNotRetunToNULL(Map<String, Object> searchParam) {
		logger.info("=============================get_Code_ListNotRetunToNULL");
		List<CodeVO> codeList = commonCodeDAO.getCodeList(searchParam);
		if(codeList == null) {
			codeList = new LinkedList<CodeVO>();
		}
		return codeList;
	}
	/** 코드그룹삭제 */
	public CodeVO deleteCodeGroupRetunToNULL(CodeVO codeGroupVO) {
		commonCodeDAO.deleteCodeGroup(codeGroupVO);
		return codeGroupVO;
	}
}
