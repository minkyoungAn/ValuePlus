package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.AuthorityDTO;

public interface AuthoritiesDAO {

	/**
	 * ����� ���� ���
	 * (�� USER(���̵�)�� �������� ������ ���� �� �ִ�.
	 * */
	int insertAuthority(AuthorityDTO authority);
	
	/**
	 * id�� �ش��ϴ� ���� �˻�.
	 * */
	List<AuthorityDTO> selectAuthorityByUserName(String userName);
}






