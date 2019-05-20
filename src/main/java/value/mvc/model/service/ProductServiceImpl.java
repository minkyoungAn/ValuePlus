package value.mvc.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import value.mvc.model.dao.ProductDAO;
import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.BuyingListDTO;
import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.InterestDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;
import value.mvc.model.dto.SeenProductDTO;
import value.mvc.model.dto.TransactionalInformationDTO;
import value.mvc.model.dto.mainListProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDao;

	
	@Override
	public Map<String, Object> selectOneProduct(String productNo, ProductPhotoDTO productPhoto) {
		ProductDTO product = productDao.selectOneProduct(productNo);
		String description = product.getDescription();
		String[] desArr;
		List<String> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();

		desArr = description.split("`");
		/*for (int i = 0; i < desArr.length; i++) {
			if (i + 1 == desArr.length) {
				desArr[i] = null;
				break;
			}
			desArr[i] = desArr[i + 1];
		}*/

		for (int i = 0; i < desArr.length; i++) {
			list.add(desArr[i]);
		}

		map.put("product", product);
		map.put("description", list);

		return map;
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

	//void 로 바꿀지 생각중
	@Transactional
    @Override
    public int insertBidding(BidderDTO bidderDTO) {
       
       int bidResult = productDao.insertBidding(bidderDTO);
       productDao.updatePrice(bidderDTO);
       productDao.updateBidderCount(bidderDTO);
       // 현재가 확인 및 업뎃
       
       return bidResult;
    }
	@Override
	public Map<String, Object> selectAllBidding(String productNo) {
		Map<String, Object> map = new HashMap<>();
		List<BidderDTO> customer = productDao.selectAllBidding(productNo);
		int bidderCount = productDao.selectBidderCount(productNo);

		map.put("bidder", customer);
		map.put("bidderCount", bidderCount);

		return map;
	}
	/*민경 추가 */
	// 전체리스트
	@Override
	public List<mainListProductDTO> selectListProduct(String sort) {
		List<mainListProductDTO> list = productDao.selectListProduct(sort);
		 countDownDeadlineInMainList(list);
		return list;
	}
	

	//대분류 리스트
	@Override
	public List<mainListProductDTO> selectListProductByCategory(String categoryName, String sort) {
		
		List<mainListProductDTO> list = productDao.selectListProductByCategory(categoryName, sort);
		 countDownDeadlineInMainList(list);
		return list;
	}
	//중분류 리스트
	@Override
	public List<mainListProductDTO> selectListProductByDivision(String divisionName, String sort) {
		
		List<mainListProductDTO> list = productDao.selectListProductByDivision(divisionName, sort);
		 countDownDeadlineInMainList(list);
		return list;
	}

	//대분류
	@Override
	public List<String> selectAllCategory() {
		List<String> bigCategory = productDao.selectAllCategory();

		return bigCategory;
	}
	//중분류
	@Override
	public List<String> selectDivisionsByCategory(String bigCategoryName) {
		List<String> division = productDao.selectDivisionsByCategory(bigCategoryName);

		return division;

	}
	
	//메인 top5
	@Override
	public List<mainListProductDTO> selectMainListProduct(String sort) {
		List<mainListProductDTO> list = productDao.selectmainProductList(sort);
		 countDownDeadlineInMainList(list);
		return list;
	}
	
	
	//// 유저이름, 제목별 상품리스트
	@Override
	public List<mainListProductDTO> selectListProductBySeller(String keyword) {
		 List<mainListProductDTO> list = productDao.selectListProductBySeller(keyword);
		 countDownDeadlineInMainList(list);
		return list;
	}

	//카테고리 하나 검색
	@Transactional
	@Override
	public String selecOneCategory(String divisionName) {
		String categoryNo= productDao.selectOneCategoryNo(divisionName);
		
		String categoryName = productDao.selectOneCategory(categoryNo);
		return categoryName;
	}

	//대분류검색
	@Override
	public List<CategoryDTO> selectCategoryByKeyword(String selectWord) {
		List<CategoryDTO> list = productDao.selectCategoryByKeyword(selectWord);
		return list;
	}
	//중분류검색
	@Override
	public List<CategoryDTO> selectDivisionByKeyword(String selectWord) {
		List<CategoryDTO> list = productDao.selectDivisionByKeyword(selectWord);
		return list;
	}
	
	/**
	 * 12/16 민경추가 deadline null 예외처리
	 */
	//날짜계산넣기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	public void countDownDeadlineInMainList(List<mainListProductDTO> mainList) {
		for (mainListProductDTO dto : mainList) {
			// 두날짜의 차이 구하기
			String countDownDate = dto.getDeadline();
			if(countDownDate == null) {
				System.out.println("예외처리 하기");
				return;
			}
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

				Date endDate = formatter.parse(countDownDate);
				Date beginDate = new Date();

				// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
				long diff = endDate.getTime() - beginDate.getTime();

				// Time calculations for days, hours, minutes and seconds
				double days = Math.floor(diff / (1000 * 60 * 60 * 24));
				double hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
				double minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
				double seconds = Math.floor((diff % (1000 * 60)) / 1000);
				String date = "";
				if(days <=0 && hours <=0 && minutes<=0 && seconds<=0) {
					date = "마감";
				}else if (days > 0) {
					date = (int) days + "일 " + (int) hours + "시간";
				} else if (days <= 0 && hours <= 0) {
					date = (int) minutes + "분 " + (int) seconds + "초";
				} else {
					date = (int) hours + "시간 " + (int) minutes + "분";
				}

				dto.setDeadline(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}
	}
	




	/* 태은 추가 */
	@Override
	public BidderDTO selectOneBidding(String productNo) {
		return productDao.selectOneBidding(productNo);
	}

	@Override
	public ProductPhotoDTO selectProductPhoto(String productNo) {
		return productDao.selectProductPhoto(productNo);
	}

	@Override
	public String selectSellerId(String productNo) {
		return productDao.selectSellerId(productNo);
	}

	@Override
	public String selectSellerGrade(String userId) {
		return productDao.selectSellerGrade(userId);
	}
	@Override
	@Transactional
	public boolean newLikeItem(InterestDTO interest) {
		System.out.println("newLikeItem start");
		String selectResult = productDao.selectIsInterest(interest);
		boolean result = false;
		int insertResult = 0;
		int deleteResult = 0; // 삽입함 12/12

		if (selectResult == null)
			insertResult = productDao.newInterest(interest);
		else {
			System.out.println("selectResult is not null");
			deleteResult = productDao.deleteInterest(interest); // 삽입 12/12
			System.out.println("delete is success");
		}
		if (selectResult == null && insertResult != 0)
			result = true;
		if (selectResult ==null && deleteResult !=0) // 삽입 12/12
			result = false;
		
		System.out.println("asdf -> "+ deleteResult);
		return result;
	}

	@Override
	@Transactional
	public boolean isInterest(InterestDTO interest) {
		//System.out.println("test start");
		String selectResult = productDao.selectIsInterest(interest);
		boolean result = false;
//		System.out.println("initialize => " + result);
		if (selectResult != null)
			result = true;
//		System.out.println("selectResult => " + selectResult);
//		System.out.println("final result is =>" + result);
		return result;
	}
	
	@Override
	public int deadlineChk(String productNo) {
		return productDao.deadlineChk(productNo);
	}
	
	@Override
	public void isSeen(SeenProductDTO seenProduct) {
//		System.out.println("is seen serv");
		String seen = productDao.seenChk(seenProduct);
//		System.out.println("productNo -> " +seenProduct.getProductNo());
//		System.out.println("wow -> " + seen);
		if(seen==null) {
			productDao.insertSeen(seenProduct);
		}
	}
	
	/** 
	 * 대분류 - 혜민
	 */
	@Override
	public List<CategoryDTO> selectCategory() {
		List<CategoryDTO> list = productDao.selectCategory();
		return list;

	}
	
	/**
	 * 중분류 -  혜민
	 */
	@Override
	public List<CategoryDTO> selectDivision(String categoryName) {
		List<CategoryDTO> list = productDao.selectDivision(categoryName);
		return list;
	}
	
	/**
	 * 상품 등록하기 - 혜민
	 */
	@Override
	@Transactional
	public int insertProduct(ProductDTO productDTO, ProductPhotoDTO productPhotoDTO) {
		String divisionName = productDTO.getDivisionNo();
		
		//dao -> division테이블에서 division no를 가져오는 method 실행 ==> divisionNO
		String divisionNo = productDao.selectDivisionName(divisionName);
			productDTO.setDivisionNo(divisionNo);

		//상품 등록
		int result = productDao.insertProduct(productDTO);
			System.out.println("service result1 => " + result);
		
		//상품 등록시 이미지 추가	
		int result2 = productDao.insertProductPhoto(productPhotoDTO);
			System.out.println("service result2 => " + result2);
			
		//상품 등록시 process table에 product_no 추가	
		int result3 = productDao.insertProcessProductName(productDTO);
			System.out.println("service result3 => " + result3);
			
			/*if(result==0 || result2==0 || result3 ==0) {
			try {
				throw new Exception("예외발생해서 insert를 중지합니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/
			
		return 0;
	}

	@Override
	public int insertBuyingList(BuyingListDTO buyingListDTO) {
		// TODO Auto-generated method stub
		return productDao.insertBuyingList(buyingListDTO);
	}

	/**
	 * 12/16 수정 낙찰하기 낙찰자 없을때, 낙찰 이미 했을 때
	 */

	@Override
	public String updateProcessByTimeout(String productNo) {
		//이미 낙찰자를 등록한 뒤.
		if(productDao.selectAlreadySuccessfulBidder(productNo) != null) {
			//이미 한명 있다.
			return "1";
		}
		//1216 추가 낙찰자 없을 때 더이상 진행 x
		String id = productDao.selectSuccessfulBidder(productNo);
		if(id==null) {
			//마감으로주고 24시의 open 을 close로
			productDao.updateProcessEndByTimeout(productNo);
			return null;
		}
		
		//업데이트 prodcut, bidderList의 id 찾아서 낙찰자 등록 
		int result = productDao.updateProcessByTimeout(productNo);
		//product 테이블 낙찰자등록
		int result2 = productDao.updateBidderByTimeout(id, productNo);
		//buylist 테이블 낙찰자 구매현황 등록
		int result3 = productDao.updateBuyingListByTimeout(id, productNo);
		return id;
	}

	@Override
	public void closeProductList() {
		productDao.closeProductList();
		
	}
	
	@Override
	public int updateState(TransactionalInformationDTO transactionalInformationDTO) {
		// TODO Auto-generated method stub
		return productDao.updateState(transactionalInformationDTO);
	}
	
	
}
