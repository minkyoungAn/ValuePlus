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
	 * �����ϱ� => �� ���ų���
	 */
	int insertBuyingList(BuyingListDTO buyingListDTO);
	/**
	 * ��ǰ �󼼺���
	 * 
	 * @param productNo
	 * @return
	 */
	Map<String, Object> selectOneProduct(String productNo, ProductPhotoDTO productPhotoDTO);

	/**
	 * ��ǰ ����
	 * 
	 * @param productNo
	 * @return
	 */
	int deleteProduct(String productNo);

	/**
	 * ��ǰ �̹��� ����
	 * 
	 * @param productNo
	 * @return
	 */
	int deleteProductPhoto(String productNo);

	/**
	 * �����ϱ�
	 * 
	 * @param bidderDTO
	 * @return
	 */
	int insertBidding(BidderDTO bidderDTO);

	/**
	 * �����ڸ�� ����
	 * 
	 * @return
	 */
	Map<String, Object> selectAllBidding(String productNo);

	/**
	 * DB���� �ش� ǰ���� ������ ��θ� ��ȸ
	 * 
	 * @return
	 */
	ProductPhotoDTO selectProductPhoto(String productNo);

	/**
	 * �ش� ǰ���ȣ�� �ش��ϴ� ǰ���� �Ǹ��� ID�� ��ȸ
	 * 
	 * @return
	 */
	String selectSellerId(String productNo);

	/**
	 * �ش� �Ǹ����� ID�� �Ǹ����� ����� ��ȸ
	 * 
	 * @return
	 */
	String selectSellerGrade(String userId);

	/**
	 * ������ǰ ���� ��������
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
	 * ��з�ī�װ� ����
	 */
	List<CategoryDTO> selectCategory();

	/**
	 * �ߺз�ī�װ� ����
	 */
	List<CategoryDTO> selectDivision(String categoryName);

	/**
	 * ��ǰ ����ϱ� ����
	 */
	int insertProduct(ProductDTO productDTO, ProductPhotoDTO productPhotoDTO);

	/**
	 * �ΰ� ��з�
	 * 
	 * @return
	 */
	List<String> selectAllCategory();

	/**
	 * �ΰ� �ߺз�
	 * 
	 * @param bigCategoryName
	 * @return
	 */
	List<String> selectDivisionsByCategory(String bigCategoryName);

	/**
	 * �ΰ� ��ü����Ʈ
	 * 
	 * @param sort
	 * @return
	 */
	List<mainListProductDTO> selectListProduct(String sort);

	/**
	 * �ΰ� ��з� ����Ʈ
	 * 
	 * @param categoryName
	 * @param sort
	 * @return
	 */
	List<mainListProductDTO> selectListProductByCategory(String categoryName, String sort);

	/**
	 * �ΰ� �ߺз� ����Ʈ
	 * 
	 * @param divisionName
	 * @param sort
	 * @return
	 */
	List<mainListProductDTO> selectListProductByDivision(String divisionName, String sort);

	/**
	 * �ΰ� ��з��˻�
	 * 
	 * @param selectWord
	 * @return
	 */
	List<CategoryDTO> selectCategoryByKeyword(String selectWord);

	/**
	 * �ΰ� �ߺз� �˻�
	 * 
	 * @param selectWord
	 * @return
	 */
	List<CategoryDTO> selectDivisionByKeyword(String selectWord);

	/**
	 * �ΰ� ī�װ� �ϳ�
	 */
	String selecOneCategory(String divisionName);

	/**
	 * �ΰ� �Ǹ���, ���� ��ǰ����Ʈ
	 * 
	 * @param keyword
	 * @return
	 */
	List<mainListProductDTO> selectListProductBySeller(String keyword);

	/**
	 * �ΰ� �����ð� ����ϱ�
	 * 
	 * @param mainList
	 */
	void countDownDeadlineInMainList(List<mainListProductDTO> mainList);

	/**
	 * �ΰ� ���� top5 ��ǰ����Ʈ ��������
	 * 
	 * @param sort
	 * @return
	 */
	List<mainListProductDTO> selectMainListProduct(String sort);
	/**
	 * �����ϱ�
	 * @param productNo
	 * @return
	 */
	
	String updateProcessByTimeout(String productNo);
	void closeProductList();
	/**
	 * ��ǰ ���� ���� ��ۿϷ� ->>>> ����Ȯ��
	 * @param TransactionalInformationDTO
	 * @return
	 * */
	int updateState(TransactionalInformationDTO transactionalInformationDTO);
	
	
}
