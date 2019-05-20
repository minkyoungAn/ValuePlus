package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.TransactionalInformationDTO;

public interface CustomerDAO {
	/**
	 * 마이 페이지 비밀번호 수정
	 */
	void updatePwByUser(CustomerDTO customerDTO);
	/**
	 * 비밀번호 수정하기
	 */
	void updatePw(CustomerDTO customerDTO);
	/**
	 * 비밀번호 찾기
	 */
	String findPw(String id);
	/**
	 * 아이디 찾기
	 */
	String findId(String name);
	/**
	 * 가입하기
	 * @param customerDTO
	 * @return
	 */
	void joinCustomer (CustomerDTO customerDTO);
	/**
	 * 아이디 중복 체크
	 */
	int idCheck(String id);
	
	int test();
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
	String loginCustomer (CustomerDTO customerDTO);
	
	
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
	List<ProductDTO> selectInterest (String id);
	/**
	 * 오늘 본 상품 검색
	 * @param id
	 * @return
	 */
	List<ProductDTO> selectToday (String id);
	
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
	List<TransactionalInformationDTO> selectSelling (String id);
	
	/**
	 * 구매내역보기 (내가 응찰한 내역)
	 * @param id
	 * @return
	 */
	List<TransactionalInformationDTO> selectBuying (String id);

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
	

	/**
	 * 내정보수정
	 * @param accountDTO
	 * @return
	 */
	int updateProfile (CustomerDTO customerDTO);

	
	/**
	 * 민경추가 1215 오늘본상품 24시 삭제
	 */
	void deleteTodaySeeProduct();
	/**
	 * 민경추가 12/16 낙찰자 판매자 메일보낼 정보가져오기
	 */
	String selectMailingEmail(String id);
	String selectMailingProductName(String productNo);
	String selectMailingSellerId(String productNo);
	List<TransactionalInformationDTO> selectWaitSelling(String id);
	
	
}
