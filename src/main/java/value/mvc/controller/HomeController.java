package value.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.mainListProductDTO;
import value.mvc.model.service.AdminService;
import value.mvc.model.service.CustomerService;
import value.mvc.model.service.ProductService;

@Controller
public class HomeController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private AdminService adminService;
	/**
	 * 메인 카테고리 및 리스트
	 * 
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();

		// 전체검색 + 대분류 카테고리
		// 대분류
		// 전체 대분류 카테고리
		List<String> bigCategory = productService.selectAllCategory();
		mv.addObject("bigCategory", bigCategory);

		// 인기
		List<mainListProductDTO> bidCountList = productService.selectMainListProduct("bid_count desc");
		// 마감
		List<mainListProductDTO> deadLineList = productService.selectMainListProduct("deadline");
		// 신규
		// 신규
	      List<mainListProductDTO> startDateList = productService.selectMainListProduct("start_date desc");
	      
		mv.addObject("bidCountList", bidCountList);
		mv.addObject("deadLineList", deadLineList);
		mv.addObject("startDateList", startDateList);

		mv.setViewName("main/main");

		return mv;
	}


	/**
	 * 민경: 메인 전체 검색페이지 카테고리 ,유저, 상품, 공지사항
	 */
	@RequestMapping("selectMain")
	public ModelAndView selectMain(String keyword) {

		ModelAndView mv = new ModelAndView();
		mv.addObject("keyword", keyword);

		if (keyword.equals("")) {
			mv.addObject("message", "검색어를 입력해주세요.");

		} else {
			List<CategoryDTO> category = productService.selectCategoryByKeyword(keyword);
			List<CategoryDTO> division = productService.selectDivisionByKeyword(keyword);
			if (category.isEmpty() && division.isEmpty()) {
				mv.addObject("disivionMsg", "검색 결과가 없습니다.");
			} else {
				mv.addObject("bigCategory", category);
				mv.addObject("division", division);

			}

			// 유저이름, 제목별 상품리스트
			List<mainListProductDTO> mainList = productService.selectListProductBySeller(keyword);
			if (mainList.isEmpty()) {
				mv.addObject("listMsg", "검색 결과가 없습니다.");
			}
			mv.addObject("mainList", mainList);
			mv.addObject("listSize", mainList.size());

		}

		mv.setViewName("select/selectMain");

		return mv;

	}
	

	@RequestMapping("guideMain")
	public String guide() {
		return "guide/guideMain";
	}
	
	/**
	 * 민경추가 12/15 오늘본상품 삭제
	 */
	@Scheduled(cron="0 0/15 * * * ?")
	public void deleteTodaySeeProduct() {
		customerService.deleteTodaySeeProduct();
		productService.closeProductList();
		//12/18 구매확정 자동업데이트
		adminService.updateDeliveryProcess();
		adminService.updateEndProcess();
	}
	

	
}
