package kr.mdhelp.common.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mdhelp.common.dao.CommonCodeDAO;
import kr.mdhelp.common.model.CodeDTO;

@Service
public class CommonCodeService implements CommonCodeServiceInterface{
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeService.class);
	private static final String CommonCodeLogPripx = "▷▶ CommonCodeLog ▷▶▷▶▷▶▷▶▷▶";
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

	
	
	
	
	
	
	
	
	
	
	/** CodeGroup키로 CodeGroup 상세 정보 불러오기 
	 * input : CodeGroup(String) ,[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : CodeDTO
	 *  */
	@Override
	public CodeDTO getCodeGroupDetailOne(String codeGroup, boolean inActiveCode) {
		logger.info(CommonCodeLogPripx+"[getCodeGroupDetailOne]");
		logger.info(CommonCodeLogPripx+"[codeGroup][{}]",codeGroup);
		codeGroup = StringUtils.trimToEmpty(codeGroup);
		
		CodeDTO returnCodeDTO = null;
		if(StringUtils.equals(codeGroup, StringUtils.EMPTY) == false) {
			//TO-DO
		}
		
		return returnCodeDTO;
	}
	
	/** CodeGroup키로 코드그룹에 속해 있는 코드목록 불러오기(코드그룹 포함)
	 * input : CodeGroup(String) ,[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : List<CodeDTO> 
	 *  */
	@Override
	@Deprecated
	public List<CodeDTO> getCodeGroupToCodeListWithCodeGroup(String codeGroup, boolean inActiveCode) {
		logger.info(CommonCodeLogPripx+"[getCodeGroupToCodeListWithCodeGroup]");
		logger.info(CommonCodeLogPripx+"[codeGroup][{}]",codeGroup);
		codeGroup = StringUtils.trimToEmpty(codeGroup);
		
		List<CodeDTO> returnList = null;
		if(StringUtils.equals(codeGroup, StringUtils.EMPTY) == false) {
			//TO-DO
			returnList = new LinkedList<CodeDTO>();
		}
		
		return returnList;
	}
	
	/** CodeGroup키로 코드그룹에 속해 있는 코드목록 불러오기(코드그룹 미포함)
	 * input : CodeGroup(String),[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : List<CodeDTO> 
	 *  */
	@Override
	public List<CodeDTO> getCodeGroupToCodeList(String codeGroup, boolean inActiveCode) {
		logger.info(CommonCodeLogPripx+"[getCodeGroupToCodeList]");
		logger.info(CommonCodeLogPripx+"[codeGroup][{}]",codeGroup);
		codeGroup = StringUtils.trimToEmpty(codeGroup);
		
		List<CodeDTO> returnList = null;
		if(StringUtils.equals(codeGroup, StringUtils.EMPTY) == false) {
			//TO-DO
			returnList = new LinkedList<CodeDTO>();
		}
		
		return returnList ;
	}
	

	
	
	
	/** Code키로 CodeGroup 상세 정보 불러오기 
	 * input : Code(String),[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : CodeDTO
	 *  */
	@Override
	public CodeDTO getCodeTOCodeGroupDetailOne(String code, boolean inActiveCode) {
		logger.info(CommonCodeLogPripx+"[getCodeTOCodeGroupDetailOne]");
		logger.info(CommonCodeLogPripx+"[code][{}]",code);
		code = StringUtils.trimToEmpty(code);
		
		CodeDTO returnCodeDTO = null;
		if(StringUtils.equals(code, StringUtils.EMPTY) == false) {
			//TO-DO
		}
		
		return returnCodeDTO;
	}
	/** Code키로 Code 상세 정보 불러오기 
	 * input : Code(String),[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : CodeDTO
	 *  */
	@Override
	public CodeDTO getCodeTOCodeDetailOne(String code, boolean inActiveCode) {
		logger.info(CommonCodeLogPripx+"[getCodeTOCodeDetailOne]");
		logger.info(CommonCodeLogPripx+"[code][{}]",code);
		code = StringUtils.trimToEmpty(code);
		
		CodeDTO returnCodeDTO = null;
		if(StringUtils.equals(code, StringUtils.EMPTY) == false) {
			//TO-DO
		}
		
		return returnCodeDTO;
	}
	/** Code키로 코드그룹에 속해 있는 코드목록 불러오기(코드그룹 포함)
	* input : Code(String),[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	* output : List<CodeDTO> 
	*  */
	@Override
	@Deprecated
	public List<CodeDTO> getCodeToCodeListWithCodeGroup(String code, boolean inActiveCode) {
		logger.info(CommonCodeLogPripx+"[getCodeToCodeListWithCodeGroup]");
		logger.info(CommonCodeLogPripx+"[code][{}]",code);
		code = StringUtils.trimToEmpty(code);
		
		List<CodeDTO> returnList = null;
		if(StringUtils.equals(code, StringUtils.EMPTY) == false) {
			//TO-DO
			returnList = new LinkedList<CodeDTO>();
		}
		
		return returnList ;
	}
	/** Code키로 코드그룹에 속해 있는 코드목록 불러오기(코드그룹 미포함)
	 * input : Code(String)
	 * output : List<CodeDTO> 
	 *  */
	@Override
	public List<CodeDTO> getCodeToCodeList(String code, boolean inActiveCode) {
		logger.info(CommonCodeLogPripx+"[getCodeToCodeList]");
		logger.info(CommonCodeLogPripx+"[code][{}]",code);
		code = StringUtils.trimToEmpty(code);
		
		List<CodeDTO> returnList = null;
		if(StringUtils.equals(code, StringUtils.EMPTY) == false) {
			//TO-DO
			returnList = new LinkedList<CodeDTO>();
		}
		
		return returnList ;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
}
