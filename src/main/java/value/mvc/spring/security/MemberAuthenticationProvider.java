package value.mvc.spring.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import value.mvc.model.dao.AuthoritiesDAO;
import value.mvc.model.dao.CustomerDAO;
import value.mvc.model.dto.Authority;
import value.mvc.model.dto.CustomerDTO;

@Service 
public class MemberAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private AuthoritiesDAO authoritiesDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		if(!supports(auth.getClass())){
			return null;
		}
		String id = auth.getName();
		CustomerDTO customerDTO = customerDAO.selectCustomerById(id);
		
		if(customerDTO==null){
			throw new UsernameNotFoundException(id+"는 없는 회원입니다");
		}
		String password = (String)auth.getCredentials();
		
		if(!passwordEncoder.matches(password, customerDTO.getPw())){
			throw new BadCredentialsException("패스워드 오류입니다.");
		}
		
		List<Authority> list = 
				authoritiesDAO.selectAuthorityByUserName(id);
		
		if(list.isEmpty()){
			throw new UsernameNotFoundException(id+"는 아무 권한이 없습니다.");
		}
		
		List<SimpleGrantedAuthority> authList = new ArrayList<SimpleGrantedAuthority>();
		for(Authority authority : list){
			authList.add(new SimpleGrantedAuthority(authority.getRole()));
		}
		return new UsernamePasswordAuthenticationToken(customerDTO, null, authList);
	}
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}






