package kr.mdhelp.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.mdhelp.common.model.CodeDTO;

@Repository
public class CommonCodeDAO implements CommonCodeDAOInterface{
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeDAO.class);
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<CodeDTO> getCodeGroupList(Map<String, Object> searchParam) {
		logger.info("=============================get_CodeGroup_List DAO");
		return sql.selectList("select_code_group_list", searchParam);
		
	}


	public List<CodeDTO> getCodeList(Map<String, Object> searchParam) {
		logger.info("=============================get_Code_List DAO");
		return sql.selectList("select_code_list", searchParam);
	}


}
