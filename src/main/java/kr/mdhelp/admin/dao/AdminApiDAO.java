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

@Repository
public class AdminApiDAO implements AdminApiDAOinterface {
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeDAO.class);
	
	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public List<ApiKeyDTO> getApiList(Map<String, Object> searchParam) {
		// TODO Auto-generated method stub
		logger.info("=============================get_apiGroup_List DAO");
		return sql.selectList("select_api_group_list", searchParam);
	}
}
