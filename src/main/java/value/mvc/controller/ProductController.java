package value.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.mainListProductDTO;
import value.mvc.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	/**
	 * 리스트 띄우기 - flag 0 전체리스트 띄우기 flag 1 대분류 카테고리 별 띄우기
	 * 카테고리 가져오기 - flag 0 대분류 카테고리 가져오기 flag 1 중분류 카테고리 띄우기
	 * 더보기 - flag 0 hidden / flag 1 대분류 카테고리 가져오기
	 * 
	 * 작성자 : 안민경
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest request) {
		System.out.println("왔다ㄹㄴㅇㄹㅇㅁ");
		String bigCategoryName = request.getParameter("categoryName");
		String sort = request.getParameter("sort");
		ModelAndView mv = new ModelAndView();
		
		//전체검색
		if("All".equals(bigCategoryName)) {
			//전체상품검색
			
			List<mainListProductDTO> mainList = productService.selectMainListProduct(null);
			
			//전체 대분류들
			List<CategoryDTO> category = productService.selectAllCategory();
			
			mv.addObject("mainList", mainList);
			mv.addObject("category", category);
				
		}
		//카테고리 검색
		else {
			System.out.println("start");
			//카테고리에 따른 상품 검색
			//List<mainListProductDTO> mainListByCategory = productService.selectMainListProductByCategory(bigCategoryName);
			//대분류를 가진 중분류카테고리
			//mv.addObject("mainListByCategory", mainListByCategory);
			//List<CategoryDTO> division = productService.selectDivisionsByCategory(bigCategoryName);
			//mv.addObject("division", division);
		}
		
		
		mv.setViewName("/product/list");
		
		return mv; // views/product/list.jsp
	}
}
