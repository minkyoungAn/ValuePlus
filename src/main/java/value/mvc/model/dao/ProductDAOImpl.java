package value.mvc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.BuyingListDTO;
import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.InterestDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;
import value.mvc.model.dto.SeenProductDTO;
import value.mvc.model.dto.TransactionalInformationDTO;
import value.mvc.model.dto.mainListProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession session;

	@Override
	public ProductDTO selectOneProduct(String productNo) {
		// return null;
		System.out.println(productNo);
		return session.selectOne("ProductMapper.selectOneProduct", productNo);
	}

	// ��з�
	@Override
	public List<String> selectAllCategory() {
		List<String> bigCategory = session.selectList("ProductMapper.selectCategory");

		return bigCategory;
	}

	// �ߺз�
	@Override
	public List<String> selectDivisionsByCategory(String bigCategoryName) {
		List<String> list = session.selectList("ProductMapper.selectDivisionByCategory", bigCategoryName);
		return list;
	}

	// ��ü����Ʈ
	@Override
	public List<mainListProductDTO> selectListProduct(String sort) {
		if (sort == null) {
			sort = "no";

		}
		List<mainListProductDTO> list = session.selectList("ProductMapper.selectAllList", sort);

		return list;
	}

	// ��з� ����Ʈ
	@Override
	public List<mainListProductDTO> selectListProductByCategory(String categoryName, String sort) {
		if (sort == null) {
			sort = "no";
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("categoryName", categoryName);
		map.put("sort", sort);

		List<mainListProductDTO> list = session.selectList("ProductMapper.selectListByCategory", map);

		return list;
	}

	// �ߺз� ����Ʈ
	@Override
	public List<mainListProductDTO> selectListProductByDivision(String divisionName, String sort) {
		if (sort == null) {
			sort = "no";
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("divisionName", divisionName);
		map.put("sort", sort);

		List<mainListProductDTO> list = session.selectList("ProductMapper.selectListByDivision", map);

		return list;
	}

	// ���������� top 5 �α� ���� �ű�
	@Override
	public List<mainListProductDTO> selectmainProductList(String sort) {
		if (sort == null) {
			sort = "no";
		}
		List<mainListProductDTO> list = session.selectList("ProductMapper.mainContent", sort);
		return list;
	}

	// �����̸�, ���� ��ǰ����Ʈ
	@Override
	public List<mainListProductDTO> selectListProductBySeller(String keyword) {
		List<mainListProductDTO> list = session.selectList("ProductMapper.selectListProductBySeller", keyword);
		return list;
	}

	// ��з��˻�
	@Override
	public List<CategoryDTO> selectCategoryByKeyword(String selectWord) {
		if (selectWord == null) {
			return null;
		}
		List<CategoryDTO> list = session.selectList("ProductMapper.selectCategoryByKeyword", selectWord);

		return list;
	}

	// �ߺз��˻�
	@Override
	public List<CategoryDTO> selectDivisionByKeyword(String selectWord) {
		if (selectWord == null) {
			return null;
		}
		List<CategoryDTO> list = session.selectList("ProductMapper.selectDivisionByKeyword", selectWord);

		return list;
	}

	// ��з� ��ȣ�˻�
	@Override
	public String selectOneCategoryNo(String divisionName) {

		String categoryNo = session.selectOne("ProductMapper.selectOneCategory", divisionName);

		return categoryNo;
	}

	// ��ȣ�� ��з� �̸��˻�
	@Override
	public String selectOneCategory(String categoryNo) {

		String categoryName = session.selectOne("ProductMapper.selectCategoryName", categoryNo);

		return categoryName;
	}

	@Override
	public int deleteProduct(String productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProductPhoto(String productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBidding(BidderDTO bidderDTO) {
		// TODO Auto-generated method stub
		return session.insert("BidderMapper.insertBidding", bidderDTO);
	}

	@Override
	public List<BidderDTO> selectAllBidding(String productNo) {
		return session.selectList("ProductMapper.selectAllBidding", productNo);
	}

	@Override
	public int selectBidderCount(String productNo) {
		return session.selectOne("ProductMapper.selectBidderCount", productNo);
	}

	@Override
	public ProductPhotoDTO selectProductPhoto(String productNo) {
		return session.selectOne("ProductMapper.selectProductPhoto", productNo);
	}

	@Override
	public String selectSellerId(String productNo) {
		return session.selectOne("ProductMapper.selectSellerId", productNo);
	}

	@Override
	public String selectSellerGrade(String userId) {
		return session.selectOne("ProductMapper.selectSellerGrade", userId);
	}

	@Override
	public BidderDTO selectOneBidding(String productNo) {
		return null;
	}

	@Override
	public String selectIsInterest(InterestDTO interest) {
//		System.out.println("parameter chk");
//		System.out.println("productNo : " + interest.getProductNo());
//		System.out.println("userId : " + interest.getUserID());
		return session.selectOne("ProductMapper.selectIsInterest", interest);
	}

	@Override
	public int newInterest(InterestDTO interest) {
		int result = session.insert("ProductMapper.newInterest", interest);
		// session.commit();
		System.out.println("insert=?" + result);

		return result;
	}

	@Override
	public int deadlineChk(String productNo) {
		return session.selectOne("ProductMapper.deadlineChk", productNo);
	}

	@Override
	public String seenChk(SeenProductDTO seenProduct) {
		// System.out.println("seen chk");
		return session.selectOne("ProductMapper.seenChk", seenProduct);
	}

	@Override
	public int insertSeen(SeenProductDTO seenProduct) {
		// System.out.println("insert Seen");
		return session.insert("ProductMapper.insertSeen", seenProduct);
	}

	/**
	 * ��з� ī�װ� �˻� ����
	 * 
	 * @return
	 */
	@Override
	public List<CategoryDTO> selectCategory() {
		List<CategoryDTO> list = session.selectList("ProductMapper.selectCategoryHM");
		return list;
	}

	/**
	 * �ߺз� ī�װ� �˻� ����
	 */
	@Override
	public List<CategoryDTO> selectDivision(String categoryName) {
		List<CategoryDTO> list = session.selectList("ProductMapper.selectDivisionHM", categoryName);
		return list;
	}

	/**
	 * ��ǰ ���
	 * 
	 * @param productDTO
	 * @return �ۼ��� : ������
	 */
	@Override
	public int insertProduct(ProductDTO productDTO) {
		int result = session.insert("ProductMapper.insertProductHM", productDTO);
		System.out.println("DAO�� insertProduct => " + result);
		return result;
	}

	/**
	 * �ߺз��̸����� �ߺз� ��ȣ �������� �ۼ��� : ������
	 */
	@Override
	public String selectDivisionName(String divisionName) {
		String divisionNo = session.selectOne("ProductMapper.selectDivisionNameHM", divisionName);
		return divisionNo;
	}

	/**
	 * ��ǰ �̹��� ���
	 * 
	 * @param productphotoDTO
	 * @return �ۼ��� : ������
	 */
	@Override
	public int insertProductPhoto(ProductPhotoDTO productPhotoDTO) {
		int result = session.insert("ProductMapper.insertProductPhotoHM", productPhotoDTO);
		System.out.println("DAO�� insertProductPhoto => " + result);
		return result;
	}

	/**
	 * ��ǰ ��Ͻ� process�� product-No�߰� - ����
	 */
	@Override
	public int insertProcessProductName(ProductDTO productDTO) {

		int result = session.insert("ProductMapper.insertProcessProductNameHM", productDTO);
		System.out.println("DAO�� insertProcessProductName => " + result);
		return result;
	}

	@Override
	public int deleteInterest(InterestDTO interest) {
		 System.out.println("delete insert");
		 System.out.println("productNo => " + interest.getProductNo());
		 System.out.println("userId => " + interest.getUserID());
//		 session.d
		return session.delete("ProductMapper.deleteInterest", interest);
	}
	@Override
	public int updatePrice(BidderDTO bidderDTO) {
		
		return session.update("ProductMapper.updatePrice",bidderDTO);
	}

	@Override
	public int insertBuyingList(BuyingListDTO buyingListDTO) {
		return session.insert("customerMapper.insertBuyingList", buyingListDTO);
		
	}

	/**
	 * ����
	 */
	
	@Override
	public int updateProcessByTimeout(String productNo) {
		return session.update("ProductMapper.updateProcessByTimeout", productNo);
	}
	
	/////////////////////////
	//������
	@Override
	public String selectSuccessfulBidder(String productNo) {
		
		return session.selectOne("ProductMapper.selectSuccessfulBidder", productNo);
	}
	//�����ڵ��
	@Override
	public int updateBidderByTimeout(String id, String productNo) {
		
		Map<String, String> map  = new HashMap<>();
		map.put("id", id);
		map.put("productNo", productNo);
		return session.update("ProductMapper.updateBidderByTimeout", map);
	}
	/**
	 * �����ڼ� ����
	 */
	@Override
	public int updateBidderCount(BidderDTO bidderDTO) {
		String productNo = bidderDTO.getProductNo();
		return session.update("BidderMapper.updateBidding", productNo);
	}
	//���� ������Ʈ ����
	@Override
	public void closeProductList() {
		session.update("ProductMapper.closeProductList");
		
	}
	/**
	 * 1216�߰� �̹� ������ �ֳ� Ȯ��
	 */
	@Override
	public String selectAlreadySuccessfulBidder(String productNo) {
		return session.selectOne("ProductMapper.selectAlreadySuccessfulBidder", productNo);
	}
	/**
	 * 1217�߰� ������Ȳ ������Ʈ
	 */

	@Override
	public int updateBuyingListByTimeout(String id, String productNo) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("productNo", productNo);
		return session.update("ProductMapper.updateBuyingListByTimeout", map);
	}
	/**
	 * 1216 �߰� ������ ���� �� �ٷθ���
	 */

	@Override
	public int updateProcessEndByTimeout(String productNo) {
		return session.update("ProductMapper.updateProcessEndByTimeout", productNo);
		
	}
	

	@Override
	public int updateState(TransactionalInformationDTO transactionalInformationDTO) {
		// TODO Auto-generated method stub
		return session.update("ProductMapper.updateState", transactionalInformationDTO);
	}

	 
}
