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

	// 대분류
	@Override
	public List<String> selectAllCategory() {
		List<String> bigCategory = session.selectList("ProductMapper.selectCategory");

		return bigCategory;
	}

	// 중분류
	@Override
	public List<String> selectDivisionsByCategory(String bigCategoryName) {
		List<String> list = session.selectList("ProductMapper.selectDivisionByCategory", bigCategoryName);
		return list;
	}

	// 전체리스트
	@Override
	public List<mainListProductDTO> selectListProduct(String sort) {
		if (sort == null) {
			sort = "no";

		}
		List<mainListProductDTO> list = session.selectList("ProductMapper.selectAllList", sort);

		return list;
	}

	// 대분류 리스트
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

	// 중분류 리스트
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

	// 메인페이지 top 5 인기 마감 신규
	@Override
	public List<mainListProductDTO> selectmainProductList(String sort) {
		if (sort == null) {
			sort = "no";
		}
		List<mainListProductDTO> list = session.selectList("ProductMapper.mainContent", sort);
		return list;
	}

	// 유저이름, 제목별 상품리스트
	@Override
	public List<mainListProductDTO> selectListProductBySeller(String keyword) {
		List<mainListProductDTO> list = session.selectList("ProductMapper.selectListProductBySeller", keyword);
		return list;
	}

	// 대분류검색
	@Override
	public List<CategoryDTO> selectCategoryByKeyword(String selectWord) {
		if (selectWord == null) {
			return null;
		}
		List<CategoryDTO> list = session.selectList("ProductMapper.selectCategoryByKeyword", selectWord);

		return list;
	}

	// 중분류검색
	@Override
	public List<CategoryDTO> selectDivisionByKeyword(String selectWord) {
		if (selectWord == null) {
			return null;
		}
		List<CategoryDTO> list = session.selectList("ProductMapper.selectDivisionByKeyword", selectWord);

		return list;
	}

	// 대분류 번호검색
	@Override
	public String selectOneCategoryNo(String divisionName) {

		String categoryNo = session.selectOne("ProductMapper.selectOneCategory", divisionName);

		return categoryNo;
	}

	// 번호로 대분류 이름검색
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
	 * 대분류 카테고리 검색 혜민
	 * 
	 * @return
	 */
	@Override
	public List<CategoryDTO> selectCategory() {
		List<CategoryDTO> list = session.selectList("ProductMapper.selectCategoryHM");
		return list;
	}

	/**
	 * 중분류 카테고리 검색 혜민
	 */
	@Override
	public List<CategoryDTO> selectDivision(String categoryName) {
		List<CategoryDTO> list = session.selectList("ProductMapper.selectDivisionHM", categoryName);
		return list;
	}

	/**
	 * 상품 등록
	 * 
	 * @param productDTO
	 * @return 작성자 : 박혜민
	 */
	@Override
	public int insertProduct(ProductDTO productDTO) {
		int result = session.insert("ProductMapper.insertProductHM", productDTO);
		System.out.println("DAO의 insertProduct => " + result);
		return result;
	}

	/**
	 * 중분류이름으로 중분류 번호 가져오기 작성자 : 박혜민
	 */
	@Override
	public String selectDivisionName(String divisionName) {
		String divisionNo = session.selectOne("ProductMapper.selectDivisionNameHM", divisionName);
		return divisionNo;
	}

	/**
	 * 상품 이미지 등록
	 * 
	 * @param productphotoDTO
	 * @return 작성자 : 박혜민
	 */
	@Override
	public int insertProductPhoto(ProductPhotoDTO productPhotoDTO) {
		int result = session.insert("ProductMapper.insertProductPhotoHM", productPhotoDTO);
		System.out.println("DAO의 insertProductPhoto => " + result);
		return result;
	}

	/**
	 * 상품 등록시 process에 product-No추가 - 혜민
	 */
	@Override
	public int insertProcessProductName(ProductDTO productDTO) {

		int result = session.insert("ProductMapper.insertProcessProductNameHM", productDTO);
		System.out.println("DAO의 insertProcessProductName => " + result);
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
	 * 낙찰
	 */
	
	@Override
	public int updateProcessByTimeout(String productNo) {
		return session.update("ProductMapper.updateProcessByTimeout", productNo);
	}
	
	/////////////////////////
	//낙찰자
	@Override
	public String selectSuccessfulBidder(String productNo) {
		
		return session.selectOne("ProductMapper.selectSuccessfulBidder", productNo);
	}
	//낙찰자등록
	@Override
	public int updateBidderByTimeout(String id, String productNo) {
		
		Map<String, String> map  = new HashMap<>();
		map.put("id", id);
		map.put("productNo", productNo);
		return session.update("ProductMapper.updateBidderByTimeout", map);
	}
	/**
	 * 응찰자수 증가
	 */
	@Override
	public int updateBidderCount(BidderDTO bidderDTO) {
		String productNo = bidderDTO.getProductNo();
		return session.update("BidderMapper.updateBidding", productNo);
	}
	//마감 프로젝트 제외
	@Override
	public void closeProductList() {
		session.update("ProductMapper.closeProductList");
		
	}
	/**
	 * 1216추가 이미 낙찰자 있나 확인
	 */
	@Override
	public String selectAlreadySuccessfulBidder(String productNo) {
		return session.selectOne("ProductMapper.selectAlreadySuccessfulBidder", productNo);
	}
	/**
	 * 1217추가 구매현황 업데이트
	 */

	@Override
	public int updateBuyingListByTimeout(String id, String productNo) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("productNo", productNo);
		return session.update("ProductMapper.updateBuyingListByTimeout", map);
	}
	/**
	 * 1216 추가 낙찰자 없을 때 바로마감
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
