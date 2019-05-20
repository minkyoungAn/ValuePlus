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
	 * ��ǰ ���� ���� ��ۿϷ� ->>>> ����Ȯ��
	 * @param TransactionalInformationDTO
	 * @return
	 * */
	int updateState(TransactionalInformationDTO transactionalInformationDTO);
	
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
	ProductDTO selectOneProduct(String productNo);

	/**
	 * ��ǰ ����
	 * 
	 * @param productNo
	 * @return
	 */
	int deleteProduct(String productNo);

	/**
	 * ������ǰ ���� �������� -*������*
	 * 
	 * @param productNo
	 * @return
	 */
	BidderDTO selectOneBidding(String productNo);

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
	List<BidderDTO> selectAllBidding(String productNo);

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

	int selectBidderCount(String productNo);

	String selectIsInterest(InterestDTO interest);

	int newInterest(InterestDTO interest);

	int deadlineChk(String productNo);

	String seenChk(SeenProductDTO seenProduct);

	int insertSeen(SeenProductDTO seenProduct);

	/**
	 * ��з� ī�װ� - ����
	 */
	List<CategoryDTO> selectCategory();

	/**
	 * �ߺз� ī�װ� - ����
	 */
	List<CategoryDTO> selectDivision(String categoryName);

	/**
	 * ��ǰ ��� - ����
	 * 
	 * @param productDTO
	 * @return
	 */
	int insertProduct(ProductDTO productDTO);

	/**
	 * �ߺз��̸����� �ߺз� ��ȣ �������� - ����
	 */
	String selectDivisionName(String divisionNo);

	/**
	 * ��ǰ �̹��� ��� - ����
	 * 
	 * @param productphotoDTO
	 * @return
	 */
	int insertProductPhoto(ProductPhotoDTO productPhotoDTO);

	/**
	 * ��ǰ ��Ͻ� process�� product-No�߰� - ����
	 */
	int insertProcessProductName(ProductDTO productDTO);

	/**
	 * �ΰ� top5 ���θ���Ʈ ��������
	 * 
	 * @param sort
	 * @return
	 */
	public List<mainListProductDTO> selectmainProductList(String sort);

	/**
	 * ��ü����Ʈ
	 * 
	 * @param sort
	 * @return
	 */
	public List<mainListProductDTO> selectListProduct(String sort);

	/**
	 * �ΰ� ��з�����Ʈ
	 * 
	 * @param categoryName
	 * @param sort
	 * @return
	 */
	public List<mainListProductDTO> selectListProductByCategory(String categoryName, String sort);

	/**
	 * �ΰ� �ߺз�����Ʈ
	 * 
	 * @param divisionName
	 * @param sort
	 * @return
	 */
	public List<mainListProductDTO> selectListProductByDivision(String divisionName, String sort);

	/**
	 * �ΰ� ��з��˻�
	 * 
	 * @param selectWord
	 * @return
	 */
	List<CategoryDTO> selectCategoryByKeyword(String selectWord);

	/**
	 * �ΰ� �ߺз��˻�
	 * 
	 * @param selectWord
	 * @return
	 */
	List<CategoryDTO> selectDivisionByKeyword(String selectWord);

	/**
	 * �ΰ� ī�װ�no �ϳ��˻�
	 * 
	 * @param divisionName
	 * @return
	 */
	String selectOneCategoryNo(String divisionName);

	/**
	 * �ΰ� ī�װ� �ϳ� �˻�
	 * 
	 * @param divisionName
	 * @return
	 */
	String selectOneCategory(String divisionName);

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
	 * �ΰ� �Ǹ���, ����˻�
	 * 
	 * @param keyword
	 * @return
	 */
	public List<mainListProductDTO> selectListProductBySeller(String keyword);

	int deleteInterest(InterestDTO interest);

	int updatePrice(BidderDTO bidderDTO);
	

	//�Աݴ��
		int updateProcessByTimeout(String productNo);
		//�����ڵ��
		int updateBidderByTimeout(String id, String productNo);
		//�����ڼ� �ø���
		int updateBidderCount(BidderDTO bidderDTO);
		//������ã��
		String selectSuccessfulBidder(String productNo);
		//������Ʈ ����
		void closeProductList();
		//1216�̹� ������ ����߳� Ȯ��
		String selectAlreadySuccessfulBidder(String productNo);
		//1216 ���Ÿ�� ������Ʈ
		int updateBuyingListByTimeout(String id, String productNo);
		//1216 ������ ���� �� �ٷθ���
		int updateProcessEndByTimeout(String productNo);


}
