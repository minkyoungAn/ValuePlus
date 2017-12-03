package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;

public interface ProductDAO {
	
	/**
	 * ��ü��ǰ �˻�
	 * @param sort
	 * sort�� ���� ���Ĺ�� ��ȭ
	 * @return
	 */
	List<ProductDTO> selectAllProduct(String sort);
	
	/**
	 * ��ǰ �󼼺���
	 * @param productNo
	 * @return
	 */
	ProductDTO selectOneProduct(String productNo);
	
	/**
	 * ��ǰ ī�װ��� ����
	 * @param categoryNo(��з�), division(�ߺз�)
	 * @param sort(����)
	 * @return
	 */
	List<ProductDTO> selectProductByCategory(String categoryNo, String divisionNo, String sort);


	/**
	 * ��ǰ ���
	 * @param productDTO
	 * @return
	 */
	int insertProduct (ProductDTO productDTO);
	
	/**
	 * ��ǰ �̹��� ���
	 * @param productphotoDTO
	 * @return
	 */
	int insertProductPhoto (ProductPhotoDTO productphotoDTO);
	
	/**
	 * ��ǰ ����
	 * @param productNo
	 * @return
	 */
	int deleteProduct (String productNo);

	/**
	 * ��ǰ �̹��� ����
	 * @param productNo
	 * @return
	 */
	int deleteProductPhoto (String productNo);
	
	/**
	 * �����ϱ�
	 * @param bidderDTO
	 * @return
	 */
	int insertBidding (BidderDTO bidderDTO);
	
	/**
	 * �����ڸ�� ����
	 * @return
	 */
	List<BidderDTO> selectAllBidding (String productNo);
	
}
