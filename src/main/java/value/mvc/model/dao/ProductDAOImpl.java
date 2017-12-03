package value.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession session;
	
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
