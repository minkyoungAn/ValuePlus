package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.Authority;

public interface AuthoritiesDAO {
	/**
	 * id에 해당하는 권한 검색.
	 * */
	List<Authority> selectAuthorityByUserName(String user_id);
	/**
	 * 권한 부여
	 */
	int insertAuthority(Authority authority);
}






