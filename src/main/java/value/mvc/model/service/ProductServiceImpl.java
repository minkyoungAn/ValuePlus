package value.mvc.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import value.mvc.model.dao.ProductDAO;
import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDao;
	
	
	@Override
	public List<ProductDTO> selectAllProduct(String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductDTO selectOneProduct(String productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> selectProductByCategory(String categoryNo, String divisionNo, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertProduct(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProductPhoto(ProductPhotoDTO productphotoDTO) {
		// TODO Auto-generated method stub
		return 0;
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
		return 0;
	}

	@Override
	public List<BidderDTO> selectAllBidding(String productNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
