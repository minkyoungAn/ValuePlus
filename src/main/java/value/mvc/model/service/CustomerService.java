package value.mvc.model.service;

import java.util.List;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;


public interface CustomerService {

	/**
	 * 가입하기
	 * @param customerDTO
	 * @return
	 */
	int joinCustomer (CustomerDTO customerDTO);
	
	/**
	 * 마이페이지 내정보 보기
	 * @param id
	 * @return
	 */
	CustomerDTO selectCustomerById (String id);
	
	/**
	 * 탈퇴하기(탈퇴/강제탈퇴)
	 * @param id
	 * @return
	 */
	int deleteCustomer (String id);
	
	/**
	 * 회원정보수정하기
	 * @param customerDTO
	 * @return
	 */
	int updateCustomer (CustomerDTO customerDTO);
	
	/**
	 * 로그인
	 * @param id
	 * @param password
	 * @return
	 */
	String loginCustomer (String id, String password);
	
	/**
	 * 로그아웃
	 * @param id
	 * @return
	 */
	int logoutCustomer (String id);
	
	/**
	 * 내계좌보기
	 * @param accountDTO
	 * @return
	 */
	AccountDTO selectAccount (String id);
	
	/**
	 * 내계좌등록
	 * @param accountDTO
	 * @return
	 */
	int insertAccount (AccountDTO accountDTO);
	
	/**
	 * 내계좌수정
	 * @param accountDTO
	 * @return
	 */
	int updateAccount (AccountDTO accountDTO);
	
	/**
	 * 내계좌삭제
	 * @param accountDTO
	 * @return
	 */
	int deleteAccount (String id);
	
	
	/**
	 * 관심목록 검색
	 * @param id
	 * @return
	 */
	ProductDTO selectInterest (String id);
	
	/**
	 * 관심목록 추가
	 * @param productNo, id
	 * @return
	 */
	int insertInterest (String productNo, String id);
	
	/**
	 * 관심목록 삭제
	 * @param id
	 * @return
	 */
	int deleteInterest (String productNo, String id);
	
	/**
	 * 판매내역보기
	 * @param id
	 * @return
	 */
	List<ProductDTO> selectSelling (String id);
	
	/**
	 * 구매내역보기 (내가 응찰한 내역)
	 * @param id
	 * @return
	 */
	List<ProductDTO> selectBuying (String id);

	/**
	 * 공지사항 검색
	 * @return
	 */
	List<NoticeDTO> selectAllNotice ();
	
	/**
	 * 공지사항 상세보기
	 * @param id
	 * @return
	 */
	NoticeDTO selectOneNotice (String noticeNo);
	
	
	/**
	 * 전체문의내역
	 * @param id
	 * @return
	 */
	List<QuestionDTO> selectQuestion ();
	
	/**
	 * 나의 문의내역
	 * @param id
	 * @return
	 */
	List<QuestionDTO> selectQuestionById (String id);
	
	/**
	 * 문의상세보기
	 * @param QuestionNo
	 * @return
	 */
	QuestionDTO selectOneQuestion (String QuestionNo);
	
	/**
	 * 문의등록
	 * @param questionDTO
	 * @return
	 */
	int insertQuestion (QuestionDTO questionDTO);
	
	/**
	 * 문의수정
	 * @param questionDTO
	 * @return
	 */
	int updateQuestion (QuestionDTO questionDTO);
	
	/**
	 * 문의삭제
	 * @param questionNo
	 * @return
	 */
	int deleteQuestion (String questionNo);

}
