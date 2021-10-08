package kr.mdhelp.common.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.mdhelp.common.dao.CommonCodeDAO;
import kr.mdhelp.common.model.CodeVO;

@Component
public class CommonCodeService {
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeService.class);
	
	@Autowired
	CommonCodeDAO commonCodeDAO;
	
	public List<CodeVO> getCodeGroupListNotRetunToNULL(Map<String, Object> searchParam) {
		logger.info("=============================get_CodeGroup_ListNotRetunToNULL");
		List<CodeVO> cgList = commonCodeDAO.getCodeGroupList(searchParam);
		if(cgList == null) {
			cgList = new LinkedList<CodeVO>();
		}
		return cgList;
	}
	
	public CodeVO insertCodeGroupRetunToNULL(CodeVO codeGroupVO) {
		logger.info("=============================insertCodeGroup");
		codeGroupVO.setCode_sort(0);
		codeGroupVO.setCode_group(codeGroupVO.getCode());
		codeGroupVO.setCode_group_name(codeGroupVO.getCode_name());
		
		commonCodeDAO.insertCodeGroup(codeGroupVO);
		return codeGroupVO;
	}

	public List<CodeVO> getCodeListNotRetunToNULL(HashMap<String, Object> searchParam) {
		logger.info("=============================get_Code_ListNotRetunToNULL");
		List<CodeVO> codeList = commonCodeDAO.getCodeList(searchParam);
		if(codeList == null) {
			codeList = new LinkedList<CodeVO>();
		}
		return codeList;
	}
}
