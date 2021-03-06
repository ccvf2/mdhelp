package kr.mdhelp.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.mdhelp.admin.model.ApiKeyDTO;
import kr.mdhelp.common.dao.CommonCodeDAO;
import kr.mdhelp.common.model.CodeDTO;

@Repository
public class AdminApiDAO implements AdminApiDAOinterface {
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeDAO.class);
	
	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public List<CodeDTO> getApiGroupList(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		logger.info("=============================get_apiGroup_List DAO");
		return sql.selectList("select_api_group_list", searchParam);
	}

	@Override
	public List<CodeDTO> getApiGroupStateList(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		logger.info("=============================get_apiGroup_List DAO");
		return sql.selectList("select_api_group_state_list", searchParam);		
	}

	@Override
	public List<ApiKeyDTO> getApiList(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		logger.info("=============================getApiList DAO");
		logger.info("============================= searchMap : [{}]", searchParam.toString());
		return sql.selectList("select_api_list", searchParam);		
	}

	@Override
	public int insertApikeyRetunToNULL(ApiKeyDTO apiKeyDTO) {
		// TODO Auto-generated method stub
		logger.info("=============================insertApikey DAO");
		logger.info("============================= apiKeyDTO : [{}]", apiKeyDTO.toString());
		return sql.insert("insert_api_key", apiKeyDTO);
	}

	@Override
	public int updateApikeyRetunToNULL(ApiKeyDTO apiKeyDTO) {
		// TODO Auto-generated method stub
		logger.info("=============================updateApikey DAO");
		logger.info("============================= apiKeyDTO : [{}]", apiKeyDTO.toString());
		return sql.update("update_api_key", apiKeyDTO);
	}

	@Override
	public ApiKeyDTO getApikeyRetunToNULL(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		logger.info("=============================getApikeyRetunToNULL DAO");
		logger.info("============================= apiKeyDTO : [{}]", searchParam.toString());
		
		return sql.selectOne("select_api_one", searchParam);
	}
}
