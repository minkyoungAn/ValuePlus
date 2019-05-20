package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.DeliveryDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.PaymentDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;
import value.mvc.model.dto.SellingListDTO;
import value.mvc.model.dto.TransactionalInformationDTO;

public interface AdminDAO {
	/**
	 * buyCount 불러와서 비교 후 등급 올림
	 */
	void updateGradeToGoldBuy(String buyId);
	/**
	 * buyCount 불러와서 비교 후 등급 올림
	 */
	void updateGradeToFamBuy(String buyId);
	/**
	 * buyCount 불러와서 비교 후 등급 올림
	 */
	void updateGradeToVipBuy(String buyId);
	/**
	 * buyCount 불러와서 비교 후 등급 올림
	 */
	void updateGradeToVvipBuy(String buyId);
	/**
	 * sellCount 불러와서 비교 후 등급 올림
	 */
	void updateGradeToGoldSell(String sellId);
	/**
	 * sellCount 불러와서 비교 후 등급 올림
	 */
	void updateGradeToFamSell(String sellId);
	/**
	 * sellCount 불러와서 비교 후 등급 올림
	 */
	void updateGradeToVipSell(String sellId);
	/**
	 * sellCount 불러와서 비교 후 등급 올림
	 */
	void updateGradeToVvipSell(String sellId);
	
	/**
	 * 결제 시 sellCount 불러오기
	 */
	int selectSellCountById(String sellId);
	/**
	 * 결제 시 buyCount 불러오기
	 */
	int selectBuyCountById(String buyId);
	/**
	 * 결제 시 buyCount +1 
	 */
	void updateBuyCount(String buyId);
	/**
	 * 결제 시 sellCount +1 
	 */
	void updateSellCount(String sellId);
	/**
	 * 배송할 주소 불러오기
	 */
	String selectAddressById(String id);
	/** 
	 * 배송 시작 프로세스 변화
	 */
	void updateProcessBydel(String productNo);
	/**
	 * 상품 이름 가져오기
	 */
	String selectProductByNo(String productNo);
	/**
	 * 사용자 메일 계정 받아오기
	 */
	String selectEmailById(String id);
	/**
	 * 사용자 계좌정보 확인
	 */
	List<AccountDTO> selectAccountById(String id);
	/**
	 * 사용자 오늘 본 상품 확인
	 */
	List<ProductDTO> selectSeenById(String userId);
	/**
	 * 사용자 관심상품 보기
	 */
	List<ProductDTO> selectInterestById(String userId);
	/**
	 * 사용자 문의내역
	 */
	List<QuestionDTO> selectQuestionById(String userId);
	/**
	 * 사용자 구매내역
	 */
	List<TransactionalInformationDTO> selectBuyById(String id);
	/**
	 * 사용자 판매내역
	 */
	List<TransactionalInformationDTO> selectSellById(String id);
	/**
	 * 입금완료 상태 변화
	 */
	int updateProcessByPay(String productNo);
	/**
	 * 결제 내역 저장
	 */
	int insertPayment(PaymentDTO paymentDTO);
	/**
	 * 결제 시스템
	 */
	List<CustomerDTO> paymentSystem(CustomerDTO customerDTO);
	/**
	 * 판매내역 업데이트
	 */
	int insertSellingList(SellingListDTO sellingListDTO);
	/**
	 * 기한 업데이트
	 */
	int updateDeadline(ProductDTO productDTO);
	/**
	 * 배송 조회
	 */
    List<DeliveryDTO> selectDeliveryByNo(String productNo);
	/**
	 * 배송 정보 입력
	 */
	int insertDelivery(DeliveryDTO deliveryDTO);
	/**
	 * 승인할 상품 검색
	 */
	List<ProductDTO> selectPermitByKeyword(String keyword);
	/**
	 * 질문 검색
	 */
	List<QuestionDTO> selectQuestionByKeyword(String keyword);
	/**
	 * 공지 검색
	 */
	List<NoticeDTO> selectNoticeByKeyword(String keyword);
	/**
	 * 사용자 검색
	 */
	List<CustomerDTO> selectUserByKeyword(String keyword);
	/**
	 * 상품 검색
	 */
	List<ProductDTO> selectProductByKeyword(String keyword);
	/**
	 * 상품 거절
	 */
	int deleteProcessByNo(String productNo);
	/**
	 * 답글 삭제
	 */
	int deleteAnswer(String questionNo);
	/**
	 * 답글 수정
	 */
	int updateAnswer(QuestionDTO questionDTO);
	/**
	 * 답글 달기
	 */
	int insertAnswer(QuestionDTO questionDTO);
	/**
	 * 공지 수정하기
	 */
	int updateNotice(NoticeDTO noticeDTO);
	/**
	 * 공지 상세 보기
	 */
    List<NoticeDTO> selectNoticeByTitle(String noticeNo);
	/**
	 * 공지사항 삭제
	 */
	int deleteNotice(String noticeNo);
	/**
	 * 공지글 리스트
	 */
	List<NoticeDTO> selectNotice();
	/**
	 * 문의글 리스트
	 */
	List<QuestionDTO> selectQuestion();
	/**
	 * 문의글 상세보기
	 */
	List<QuestionDTO> selectQuestionByTitle(String questionNo);
	/**
	 * 상품 승인하기
	 */
	int permitProduct(String productNo);
	/**
	 * 상태별로 검색
	 */
	List<ProductDTO> productListByState(String state);
	/**
	 * 사용자 전체 보기
	 */
	List<CustomerDTO> selectAllUser();
	/**
	 * 상품 삭제하기
	 */
	int deleteByProductName(String productNo);
	/**
	 * 상품 전체 보기
	 */
	List<ProductDTO> productList();
	/**
	 * 사용자 삭제(이름)
	 */
	int deleteByName(String id);
	/**
	 * 답변 유/무로 문의글을 불러온다. (관리자) 
	 * @param QuestionNo
	 * @param state
	 * @return
	 */
	List<QuestionDTO> selectQuestionByState (String questionProcess);
	/**
	 * 공지사항 등록하기(관리자)
	 * @param noticeDTO
	 * @return
	 */
	int insertNotice (NoticeDTO noticeDTO);
	/**
	 * 배송완료
	 */
	void updateDeliveryProcess();
	void updateEndProcess();
}
