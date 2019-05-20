package value.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.Authority;

@Repository
public class AuthoritiesDAOImpl implements AuthoritiesDAO{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public int insertAuthority(Authority authority) {
		
		return sqlSession.insert("authoritiesMapper.insertAuthority", authority);
	}
	@Override
	public List<Authority> selectAuthorityByUserName(String user_id) {
		return sqlSession.selectList("authoritiesMapper.selectAuthorityByUserName", user_id);
	}

}
