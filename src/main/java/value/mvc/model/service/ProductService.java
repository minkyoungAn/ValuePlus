package value.mvc.model.service;

import java.util.List;
import java.util.Map;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.BuyingListDTO;
import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.InterestDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;
import value.mvc.model.dto.SeenProductDTO;
import value.mvc.model.dto.TransactionalInformationDTO;
import value.mvc.model.dto.mainListProductDTO;

public interface ProductService {
	/**
	 * 입찰하기 => 내 구매내역
	 */
	int insertBuyingList(BuyingListDTO buyingListDTO);
	/**
	 * 상품 상세보기
	 * 
	 * @param productNo
	 * @return
	 */
	Map<String, Object> selectOneProduct(String productNo, ProductPhotoDTO productPhotoDTO);

	/**
	 * 상품 삭제
	 * 
	 * @param productNo
	 * @return
	 */
	int deleteProduct(String productNo);

	/**
	 * 상품 이미지 삭제
	 * 
	 * @param productNo
	 * @return
	 */
	int deleteProductPhoto(String productNo);

	/**
	 * 응찰하기
	 * 
	 * @param bidderDTO
	 * @return
	 */
	int insertBidding(BidderDTO bidderDTO);

	/**
	 * 응찰자명단 보기
	 * 
	 * @return
	 */
	Map<String, Object> selectAllBidding(String productNo);

	/**
	 * DB에서 해당 품목의 사진의 경로를 조회
	 * 
	 * @return
	 */
	ProductPhotoDTO selectProductPhoto(String productNo);

	/**
	 * 해당 품목번호로 해당하는 품목의 판매자 ID를 조회
	 * 
	 * @return
	 */
	String selectSellerId(String productNo);

	/**
	 * 해당 판매자의 ID로 판매자의 등급을 조회
	 * 
	 * @return
	 */
	String selectSellerGrade(String userId);

	/**
	 * 응찰상품 정보 가져오기
	 * 
	 * @param productNO
	 * @return
	 */
	BidderDTO selectOneBidding(String productNo);

	boolean isInterest(InterestDTO interest);

	int deadlineChk(String productNo);

	void isSeen(SeenProductDTO seenProduct);

	boolean newLikeItem(InterestDTO interest);

	/**
	 * 대분류카테고리 혜민
	 */
	List<CategoryDTO> selectCategory();

	/**
	 * 중분류카테고리 혜민
	 */
	List<CategoryDTO> selectDivision(String categoryName);

	/**
	 * 상품 등록하기 혜민
	 */
	int insertProduct(ProductDTO productDTO, ProductPhotoDTO productPhotoDTO);

	/**
	 * 민경 대분류
	 * 
	 * @return
	 */
	List<String> selectAllCategory();

	/**
	 * 민경 중분류
	 * 
	 * @param bigCategoryName
	 * @return
	 */
	List<String> selectDivisionsByCategory(String bigCategoryName);

	/**
	 * 민경 전체리스트
	 * 
	 * @param sort
	 * @return
	 */
	List<mainListProductDTO> selectListProduct(String sort);

	/**
	 * 민경 대분류 리스트
	 * 
	 * @param categoryName
	 * @param sort
	 * @return
	 */
	List<mainListProductDTO> selectListProductByCategory(String categoryName, String sort);

	/**
	 * 민경 중분류 리스트
	 * 
	 * @param divisionName
	 * @param sort
	 * @return
	 */
	List<mainListProductDTO> selectListProductByDivision(String divisionName, String sort);

	/**
	 * 민경 대분류검색
	 * 
	 * @param selectWord
	 * @return
	 */
	List<CategoryDTO> selectCategoryByKeyword(String selectWord);

	/**
	 * 민경 중분류 검색
	 * 
	 * @param selectWord
	 * @return
	 */
	List<CategoryDTO> selectDivisionByKeyword(String selectWord);

	/**
	 * 민경 카테고리 하나
	 */
	String selecOneCategory(String divisionName);

	/**
	 * 민경 판매자, 제목 상품리스트
	 * 
	 * @param keyword
	 * @return
	 */
	List<mainListProductDTO> selectListProductBySeller(String keyword);

	/**
	 * 민경 남은시간 계산하기
	 * 
	 * @param mainList
	 */
	void countDownDeadlineInMainList(List<mainListProductDTO> mainList);

	/**
	 * 민경 메인 top5 상품리스트 가져오기
	 * 
	 * @param sort
	 * @return
	 */
	List<mainListProductDTO> selectMainListProduct(String sort);
	/**
	 * 낙찰하기
	 * @param productNo
	 * @return
	 */
	
	String updateProcessByTimeout(String productNo);
	void closeProductList();
	/**
	 * 상품 상테 수정 배송완료 ->>>> 구매확정
	 * @param TransactionalInformationDTO
	 * @return
	 * */
	int updateState(TransactionalInformationDTO transactionalInformationDTO);
	
	
}
