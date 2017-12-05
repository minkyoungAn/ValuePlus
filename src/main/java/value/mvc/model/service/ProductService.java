package value.mvc.model.service;

import java.util.List;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.ProcessDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;
import value.mvc.model.dto.mainListProductDTO;

public interface ProductService {
	
	/**
	 * 기능 : 전체리스트 상품검색
	 * 작성자 : 안민경
	 */
	List<mainListProductDTO> selectMainListProduct(String sort);
	
	/**
	 * 전체상품 검색
	 * @param sort
	 * sort에 따라 정렬방식 변화
	 * @return
	 */
	List<ProductDTO> selectAllProduct(String sort);
	
	/**
	 * 상품 상세보기
	 * @param productNo
	 * @return
	 */
	ProductDTO selectOneProduct(String productNo);
	
	/**
	 * 상품 카테고리별 보기
	 * @param categoryNo(대분류), division(중분류)
	 * @param sort(정렬)
	 * @return
	 */
	List<ProductDTO> selectProductByCategory(String categoryNo, String divisionNo, String sort);


	/**
	 * 상품 등록
	 * @param productDTO
	 * @return
	 */
	int insertProduct (ProductDTO productDTO);
	
	/**
	 * 상품 이미지 등록
	 * @param productphotoDTO
	 * @return
	 */
	int insertProductPhoto (ProductPhotoDTO productphotoDTO);
	
	/**
	 * 상품 삭제
	 * @param productNo
	 * @return
	 */
	int deleteProduct (String productNo);

	/**
	 * 상품 이미지 삭제
	 * @param productNo
	 * @return
	 */
	int deleteProductPhoto (String productNo);
	
	/**
	 * 응찰하기
	 * @param bidderDTO
	 * @return
	 */
	int insertBidding (BidderDTO bidderDTO);
	
	/**
	 * 응찰자명단 보기
	 * @return
	 */
	List<BidderDTO> selectAllBidding (String productNo);

	/**
	 * 대분류 전체 보기
	 * 작성자 : 안민경
	 * @return
	 */
	List<CategoryDTO> selectAllCategory();

	/**
	 * 대분류별 상품 불러오기
	 * @param bigCategoryName
	 */
	List<mainListProductDTO> selectMainListProductByCategory(String bigCategoryName);

	/**
	 * 카테고리 중분류 불러오기
	 * 작성자 : 안민경
	 * @param bigCategoryName
	 * @return
	 */
	List<CategoryDTO> selectDivisionsByCategory(String bigCategoryName);
	
	
}
