package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.Authority;

public interface AuthoritiesDAO {
	/**
	 * id�� �ش��ϴ� ���� �˻�.
	 * */
	List<Authority> selectAuthorityByUserName(String user_id);
	/**
	 * ���� �ο�
	 */
	int insertAuthority(Authority authority);
}






