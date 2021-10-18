package kr.mdhelp.common.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mdhelp.common.dao.CommonCodeDAO;
import kr.mdhelp.common.model.CodeDTO;

@Service
public class CommonCodeService implements CommonCodeServiceInterface{
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeService.class);
	
	@Autowired
	CommonCodeDAO commonCodeDAO;
	/** 코드그룹목록 불러오기*/
	@Override
	public List<CodeDTO> getCodeGroupListNotRetunToNULL(Map<String, Object> searchParam) {
		logger.info("=============================get_CodeGroup_ListNotRetunToNULL");
		List<CodeDTO> cgList = commonCodeDAO.getCodeGroupList(searchParam);
		if(cgList == null) {
			cgList = new LinkedList<CodeDTO>();
		}
		return cgList;
	}

	/** 코드목록 불러오기*/
	@Override
	public List<CodeDTO> getCodeListNotRetunToNULL(Map<String, Object> searchParam) {
		logger.info("=============================get_Code_ListNotRetunToNULL");
		List<CodeDTO> codeList = commonCodeDAO.getCodeList(searchParam);
		if(codeList == null) {
			codeList = new LinkedList<CodeDTO>();
		}
		return codeList;
	}

}
