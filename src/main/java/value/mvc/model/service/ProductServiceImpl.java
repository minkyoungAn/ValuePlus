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

	//void �� �ٲ��� ������
	@Transactional
    @Override
    public int insertBidding(BidderDTO bidderDTO) {
       
       int bidResult = productDao.insertBidding(bidderDTO);
       productDao.updatePrice(bidderDTO);
       productDao.updateBidderCount(bidderDTO);
       // ���簡 Ȯ�� �� ����
       
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
	/*�ΰ� �߰� */
	// ��ü����Ʈ
	@Override
	public List<mainListProductDTO> selectListProduct(String sort) {
		List<mainListProductDTO> list = productDao.selectListProduct(sort);
		 countDownDeadlineInMainList(list);
		return list;
	}
	

	//��з� ����Ʈ
	@Override
	public List<mainListProductDTO> selectListProductByCategory(String categoryName, String sort) {
		
		List<mainListProductDTO> list = productDao.selectListProductByCategory(categoryName, sort);
		 countDownDeadlineInMainList(list);
		return list;
	}
	//�ߺз� ����Ʈ
	@Override
	public List<mainListProductDTO> selectListProductByDivision(String divisionName, String sort) {
		
		List<mainListProductDTO> list = productDao.selectListProductByDivision(divisionName, sort);
		 countDownDeadlineInMainList(list);
		return list;
	}

	//��з�
	@Override
	public List<String> selectAllCategory() {
		List<String> bigCategory = productDao.selectAllCategory();

		return bigCategory;
	}
	//�ߺз�
	@Override
	public List<String> selectDivisionsByCategory(String bigCategoryName) {
		List<String> division = productDao.selectDivisionsByCategory(bigCategoryName);

		return division;

	}
	
	//���� top5
	@Override
	public List<mainListProductDTO> selectMainListProduct(String sort) {
		List<mainListProductDTO> list = productDao.selectmainProductList(sort);
		 countDownDeadlineInMainList(list);
		return list;
	}
	
	
	//// �����̸�, ���� ��ǰ����Ʈ
	@Override
	public List<mainListProductDTO> selectListProductBySeller(String keyword) {
		 List<mainListProductDTO> list = productDao.selectListProductBySeller(keyword);
		 countDownDeadlineInMainList(list);
		return list;
	}

	//ī�װ� �ϳ� �˻�
	@Transactional
	@Override
	public String selecOneCategory(String divisionName) {
		String categoryNo= productDao.selectOneCategoryNo(divisionName);
		
		String categoryName = productDao.selectOneCategory(categoryNo);
		return categoryName;
	}

	//��з��˻�
	@Override
	public List<CategoryDTO> selectCategoryByKeyword(String selectWord) {
		List<CategoryDTO> list = productDao.selectCategoryByKeyword(selectWord);
		return list;
	}
	//�ߺз��˻�
	@Override
	public List<CategoryDTO> selectDivisionByKeyword(String selectWord) {
		List<CategoryDTO> list = productDao.selectDivisionByKeyword(selectWord);
		return list;
	}
	
	/**
	 * 12/16 �ΰ��߰� deadline null ����ó��
	 */
	//��¥���ֱ�!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	public void countDownDeadlineInMainList(List<mainListProductDTO> mainList) {
		for (mainListProductDTO dto : mainList) {
			// �γ�¥�� ���� ���ϱ�
			String countDownDate = dto.getDeadline();
			if(countDownDate == null) {
				System.out.println("����ó�� �ϱ�");
				return;
			}
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

				Date endDate = formatter.parse(countDownDate);
				Date beginDate = new Date();

				// �ð����̸� �ð�,��,�ʸ� ���� ������ ������ �Ϸ� ������ ����
				long diff = endDate.getTime() - beginDate.getTime();

				// Time calculations for days, hours, minutes and seconds
				double days = Math.floor(diff / (1000 * 60 * 60 * 24));
				double hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
				double minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
				double seconds = Math.floor((diff % (1000 * 60)) / 1000);
				String date = "";
				if(days <=0 && hours <=0 && minutes<=0 && seconds<=0) {
					date = "����";
				}else if (days > 0) {
					date = (int) days + "�� " + (int) hours + "�ð�";
				} else if (days <= 0 && hours <= 0) {
					date = (int) minutes + "�� " + (int) seconds + "��";
				} else {
					date = (int) hours + "�ð� " + (int) minutes + "��";
				}

				dto.setDeadline(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}
	}
	




	/* ���� �߰� */
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
		int deleteResult = 0; // ������ 12/12

		if (selectResult == null)
			insertResult = productDao.newInterest(interest);
		else {
			System.out.println("selectResult is not null");
			deleteResult = productDao.deleteInterest(interest); // ���� 12/12
			System.out.println("delete is success");
		}
		if (selectResult == null && insertResult != 0)
			result = true;
		if (selectResult ==null && deleteResult !=0) // ���� 12/12
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
	 * ��з� - ����
	 */
	@Override
	public List<CategoryDTO> selectCategory() {
		List<CategoryDTO> list = productDao.selectCategory();
		return list;

	}
	
	/**
	 * �ߺз� -  ����
	 */
	@Override
	public List<CategoryDTO> selectDivision(String categoryName) {
		List<CategoryDTO> list = productDao.selectDivision(categoryName);
		return list;
	}
	
	/**
	 * ��ǰ ����ϱ� - ����
	 */
	@Override
	@Transactional
	public int insertProduct(ProductDTO productDTO, ProductPhotoDTO productPhotoDTO) {
		String divisionName = productDTO.getDivisionNo();
		
		//dao -> division���̺��� division no�� �������� method ���� ==> divisionNO
		String divisionNo = productDao.selectDivisionName(divisionName);
			productDTO.setDivisionNo(divisionNo);

		//��ǰ ���
		int result = productDao.insertProduct(productDTO);
			System.out.println("service result1 => " + result);
		
		//��ǰ ��Ͻ� �̹��� �߰�	
		int result2 = productDao.insertProductPhoto(productPhotoDTO);
			System.out.println("service result2 => " + result2);
			
		//��ǰ ��Ͻ� process table�� product_no �߰�	
		int result3 = productDao.insertProcessProductName(productDTO);
			System.out.println("service result3 => " + result3);
			
			/*if(result==0 || result2==0 || result3 ==0) {
			try {
				throw new Exception("���ܹ߻��ؼ� insert�� �����մϴ�.");
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
	 * 12/16 ���� �����ϱ� ������ ������, ���� �̹� ���� ��
	 */

	@Override
	public String updateProcessByTimeout(String productNo) {
		//�̹� �����ڸ� ����� ��.
		if(productDao.selectAlreadySuccessfulBidder(productNo) != null) {
			//�̹� �Ѹ� �ִ�.
			return "1";
		}
		//1216 �߰� ������ ���� �� ���̻� ���� x
		String id = productDao.selectSuccessfulBidder(productNo);
		if(id==null) {
			//���������ְ� 24���� open �� close��
			productDao.updateProcessEndByTimeout(productNo);
			return null;
		}
		
		//������Ʈ prodcut, bidderList�� id ã�Ƽ� ������ ��� 
		int result = productDao.updateProcessByTimeout(productNo);
		//product ���̺� �����ڵ��
		int result2 = productDao.updateBidderByTimeout(id, productNo);
		//buylist ���̺� ������ ������Ȳ ���
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
