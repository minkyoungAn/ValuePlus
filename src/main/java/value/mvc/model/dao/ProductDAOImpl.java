package value.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;
import value.mvc.model.dto.mainListProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession session;
	
	
	
	/**
	 * 전체 리스트 페이지
	 * 작성자 안민경
	 */
	@Override
	public List<mainListProductDTO> selectMainListProductByCategory(String bigCategoryName) {
		
		List<mainListProductDTO> list = session.selectList("productMapper.selectProductByCategory", bigCategoryName);
		return list;
	}

	

	@Override
	public List<CategoryDTO> selectDivisionsByCategory(String bigCategoryName) {
		List<CategoryDTO> list = session.selectList("productMapper.selectDivisionByCategory", bigCategoryName);		
		return list;
	}



	@Override
	public List<CategoryDTO> selectAllCategory() {
		List<CategoryDTO> list = session.selectList("productMapper.selectCategory");
		return list;
	}


	@Override
	public List<mainListProductDTO> selectMainListProduct(String sort) {
		List<mainListProductDTO> list = session.selectList("productMapper.selectAllMainList", sort);
		return list;
	}
//////////////////////////////////////////////////////////////////////////
	
	@Override
	public List<ProductDTO> selectAllProduct(String sort) {

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
