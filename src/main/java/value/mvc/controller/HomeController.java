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
	 * ���� ī�װ� �� ����Ʈ
	 * 
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();

		// ��ü�˻� + ��з� ī�װ�
		// ��з�
		// ��ü ��з� ī�װ�
		List<String> bigCategory = productService.selectAllCategory();
		mv.addObject("bigCategory", bigCategory);

		// �α�
		List<mainListProductDTO> bidCountList = productService.selectMainListProduct("bid_count desc");
		// ����
		List<mainListProductDTO> deadLineList = productService.selectMainListProduct("deadline");
		// �ű�
		// �ű�
	      List<mainListProductDTO> startDateList = productService.selectMainListProduct("start_date desc");
	      
		mv.addObject("bidCountList", bidCountList);
		mv.addObject("deadLineList", deadLineList);
		mv.addObject("startDateList", startDateList);

		mv.setViewName("main/main");

		return mv;
	}


	/**
	 * �ΰ�: ���� ��ü �˻������� ī�װ� ,����, ��ǰ, ��������
	 */
	@RequestMapping("selectMain")
	public ModelAndView selectMain(String keyword) {

		ModelAndView mv = new ModelAndView();
		mv.addObject("keyword", keyword);

		if (keyword.equals("")) {
			mv.addObject("message", "�˻�� �Է����ּ���.");

		} else {
			List<CategoryDTO> category = productService.selectCategoryByKeyword(keyword);
			List<CategoryDTO> division = productService.selectDivisionByKeyword(keyword);
			if (category.isEmpty() && division.isEmpty()) {
				mv.addObject("disivionMsg", "�˻� ����� �����ϴ�.");
			} else {
				mv.addObject("bigCategory", category);
				mv.addObject("division", division);

			}

			// �����̸�, ���� ��ǰ����Ʈ
			List<mainListProductDTO> mainList = productService.selectListProductBySeller(keyword);
			if (mainList.isEmpty()) {
				mv.addObject("listMsg", "�˻� ����� �����ϴ�.");
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
	 * �ΰ��߰� 12/15 ���ú���ǰ ����
	 */
	@Scheduled(cron="0 0/15 * * * ?")
	public void deleteTodaySeeProduct() {
		customerService.deleteTodaySeeProduct();
		productService.closeProductList();
		//12/18 ����Ȯ�� �ڵ�������Ʈ
		adminService.updateDeliveryProcess();
		adminService.updateEndProcess();
	}
	

	
}
