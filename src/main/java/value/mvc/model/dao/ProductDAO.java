package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;

public interface ProductDAO {
	
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
	
}
