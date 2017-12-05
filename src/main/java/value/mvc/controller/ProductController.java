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
	 * ����Ʈ ���� - flag 0 ��ü����Ʈ ���� flag 1 ��з� ī�װ� �� ����
	 * ī�װ� �������� - flag 0 ��з� ī�װ� �������� flag 1 �ߺз� ī�װ� ����
	 * ������ - flag 0 hidden / flag 1 ��з� ī�װ� ��������
	 * 
	 * �ۼ��� : �ȹΰ�
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest request) {
		System.out.println("�Դ٤�����������");
		String bigCategoryName = request.getParameter("categoryName");
		String sort = request.getParameter("sort");
		ModelAndView mv = new ModelAndView();
		
		//��ü�˻�
		if("All".equals(bigCategoryName)) {
			//��ü��ǰ�˻�
			
			List<mainListProductDTO> mainList = productService.selectMainListProduct(null);
			
			//��ü ��з���
			List<CategoryDTO> category = productService.selectAllCategory();
			
			mv.addObject("mainList", mainList);
			mv.addObject("category", category);
				
		}
		//ī�װ� �˻�
		else {
			System.out.println("start");
			//ī�װ��� ���� ��ǰ �˻�
			//List<mainListProductDTO> mainListByCategory = productService.selectMainListProductByCategory(bigCategoryName);
			//��з��� ���� �ߺз�ī�װ�
			//mv.addObject("mainListByCategory", mainListByCategory);
			//List<CategoryDTO> division = productService.selectDivisionsByCategory(bigCategoryName);
			//mv.addObject("division", division);
		}
		
		
		mv.setViewName("/product/list");
		
		return mv; // views/product/list.jsp
	}
}
