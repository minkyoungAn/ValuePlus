package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.BuyingListDTO;
import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.InterestDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;
import value.mvc.model.dto.SeenProductDTO;
import value.mvc.model.dto.TransactionalInformationDTO;
import value.mvc.model.dto.mainListProductDTO;

public interface ProductDAO {
	
	/**
	 * 상품 상태 수정 배송완료 ->>>> 구매확정
	 * @param TransactionalInformationDTO
	 * @return
	 * */
	int updateState(TransactionalInformationDTO transactionalInformationDTO);
	
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
	ProductDTO selectOneProduct(String productNo);

	/**
	 * 상품 삭제
	 * 
	 * @param productNo
	 * @return
	 */
	int deleteProduct(String productNo);

	/**
	 * 응찰상품 정보 가져오기 -*공태은*
	 * 
	 * @param productNo
	 * @return
	 */
	BidderDTO selectOneBidding(String productNo);

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
	List<BidderDTO> selectAllBidding(String productNo);

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

	int selectBidderCount(String productNo);

	String selectIsInterest(InterestDTO interest);

	int newInterest(InterestDTO interest);

	int deadlineChk(String productNo);

	String seenChk(SeenProductDTO seenProduct);

	int insertSeen(SeenProductDTO seenProduct);

	/**
	 * 대분류 카테고리 - 혜민
	 */
	List<CategoryDTO> selectCategory();

	/**
	 * 중분류 카테고리 - 혜민
	 */
	List<CategoryDTO> selectDivision(String categoryName);

	/**
	 * 상품 등록 - 혜민
	 * 
	 * @param productDTO
	 * @return
	 */
	int insertProduct(ProductDTO productDTO);

	/**
	 * 중분류이름으로 중분류 번호 가져오기 - 혜민
	 */
	String selectDivisionName(String divisionNo);

	/**
	 * 상품 이미지 등록 - 혜민
	 * 
	 * @param productphotoDTO
	 * @return
	 */
	int insertProductPhoto(ProductPhotoDTO productPhotoDTO);

	/**
	 * 상품 등록시 process에 product-No추가 - 혜민
	 */
	int insertProcessProductName(ProductDTO productDTO);

	/**
	 * 민경 top5 메인리스트 가져오기
	 * 
	 * @param sort
	 * @return
	 */
	public List<mainListProductDTO> selectmainProductList(String sort);

	/**
	 * 전체리스트
	 * 
	 * @param sort
	 * @return
	 */
	public List<mainListProductDTO> selectListProduct(String sort);

	/**
	 * 민경 대분류리스트
	 * 
	 * @param categoryName
	 * @param sort
	 * @return
	 */
	public List<mainListProductDTO> selectListProductByCategory(String categoryName, String sort);

	/**
	 * 민경 중분류리스트
	 * 
	 * @param divisionName
	 * @param sort
	 * @return
	 */
	public List<mainListProductDTO> selectListProductByDivision(String divisionName, String sort);

	/**
	 * 민경 대분류검색
	 * 
	 * @param selectWord
	 * @return
	 */
	List<CategoryDTO> selectCategoryByKeyword(String selectWord);

	/**
	 * 민경 중분류검색
	 * 
	 * @param selectWord
	 * @return
	 */
	List<CategoryDTO> selectDivisionByKeyword(String selectWord);

	/**
	 * 민경 카테고리no 하나검색
	 * 
	 * @param divisionName
	 * @return
	 */
	String selectOneCategoryNo(String divisionName);

	/**
	 * 민경 카테고리 하나 검색
	 * 
	 * @param divisionName
	 * @return
	 */
	String selectOneCategory(String divisionName);

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
	 * 민경 판매자, 제목검색
	 * 
	 * @param keyword
	 * @return
	 */
	public List<mainListProductDTO> selectListProductBySeller(String keyword);

	int deleteInterest(InterestDTO interest);

	int updatePrice(BidderDTO bidderDTO);
	

	//입금대기
		int updateProcessByTimeout(String productNo);
		//낙찰자등록
		int updateBidderByTimeout(String id, String productNo);
		//응찰자수 올리기
		int updateBidderCount(BidderDTO bidderDTO);
		//낙찰자찾기
		String selectSuccessfulBidder(String productNo);
		//프로젝트 제외
		void closeProductList();
		//1216이미 낙찰자 등록했나 확인
		String selectAlreadySuccessfulBidder(String productNo);
		//1216 구매목록 업데이트
		int updateBuyingListByTimeout(String id, String productNo);
		//1216 낙찰자 없을 때 바로마감
		int updateProcessEndByTimeout(String productNo);


}
