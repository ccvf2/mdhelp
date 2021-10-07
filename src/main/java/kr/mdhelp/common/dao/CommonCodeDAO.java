package kr.mdhelp.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.mdhelp.common.model.CodeVO;

@Component
public class CommonCodeDAO {
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeDAO.class);
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<CodeVO> getCodeGroupList(Map<String, Object> searchParam) {
		logger.info("=============================getCodeGroupList DAO");
		return sql.selectList("select_code_group_list", searchParam);
		
	}

}
