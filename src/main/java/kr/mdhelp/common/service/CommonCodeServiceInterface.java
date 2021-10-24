package kr.mdhelp.common.service;

import java.util.List;
import java.util.Map;

import kr.mdhelp.common.model.CodeDTO;

public interface CommonCodeServiceInterface {

	/** 코드그룹목록 불러오기*/
	List<CodeDTO> getCodeGroupListNotRetunToNULL(Map<String, Object> searchParam);

	/** 코드목록 불러오기*/
	List<CodeDTO> getCodeListNotRetunToNULL(Map<String, Object> searchParam);





	/** CodeGroup키로 CodeGroup 상세 정보 불러오기 
	 * input : CodeGroup(String),[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : CodeDTO
	 *  */
	CodeDTO getCodeGroupDetailOne(String codeGroup, boolean inActiveCode);

	/** CodeGroup키로 코드그룹에 속해 있는 코드목록 불러오기(코드그룹 포함)
	 * input : CodeGroup(String) ,[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : List<CodeDTO> 
	 *  */
	List<CodeDTO> getCodeGroupToCodeListWithCodeGroup(String codeGroup, boolean inActiveCode);

	/** CodeGroup키로 코드그룹에 속해 있는 코드목록 불러오기(코드그룹 미포함)
	 * input : CodeGroup(String) ,[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : List<CodeDTO> 
	 *  */
	List<CodeDTO> getCodeGroupToCodeList(String codeGroup, boolean inActiveCode);

	/** Code키로 CodeGroup 상세 정보 불러오기 
	 * input : CodeGroup(String) ,[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : CodeDTO
	 *  */
	CodeDTO getCodeTOCodeGroupDetailOne(String code, boolean inActiveCode);
	
	/** Code키로 Code 상세 정보 불러오기 
	 * input : Code(String) ,[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : CodeDTO
	 *  */
	CodeDTO getCodeTOCodeDetailOne(String code, boolean inActiveCode);
	
	/** Code키로 코드그룹에 속해 있는 코드목록 불러오기(코드그룹 포함)
	* input : Code(String) ,[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	* output : List<CodeDTO> 
	*  */
	List<CodeDTO> getCodeToCodeListWithCodeGroup(String code, boolean inActiveCode);

	/** Code키로 코드그룹에 속해 있는 코드목록 불러오기(코드그룹 포함)
	 * input : Code(String) ,[inActiveCode(boolean):true=활성화 코드민, false=비활성화 코드포함]
	 * output : List<CodeDTO> 
	 *  */
	List<CodeDTO> getCodeToCodeList(String code, boolean inActiveCode);


}
