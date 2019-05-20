package value.mvc.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import value.mvc.model.dto.BidderDTO;
import value.mvc.model.dto.CategoryDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.InterestDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.ProductPhotoDTO;
import value.mvc.model.dto.SeenProductDTO;
import value.mvc.model.dto.mainListProductDTO;
import value.mvc.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private AdminController adminController;
	int count = 1;

	String userId;

	@RequestMapping("/select")
	public ModelAndView selectOneProduct(HttpServletRequest request, String productNo) {
		// security���� id�� �޾ƿ�
		try {
			CustomerDTO user = (CustomerDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			userId = user.getId();
		} catch (ClassCastException e) {
			// ���� �α����� ���������� user�� ���ٴ� String�� ��ȯ�ϱ� ������
			// dto�� ����ȯ�� �������Ͽ� ClassCastException�� �߻�
			// id�� ""�� �ʱ�ȭ
			userId = "";
		}

		// id�� ������ �����ϸ� �ȵǴ� �� ������ ���� ����
		boolean isInterest;
		SeenProductDTO seenProduct;
		InterestDTO interest;

		// �������� ����� �ʱ�ȭ
		ModelAndView mv = new ModelAndView();
		ProductPhotoDTO productPhoto = productService.selectProductPhoto(productNo);
		Map<String, Object> map = productService.selectOneProduct(productNo, productPhoto);
		ProductDTO product = (ProductDTO) map.get("product");
		List<String> description = (List<String>) map.get("description");
		String seller = productService.selectSellerId(productNo);
		String grade = productService.selectSellerGrade(seller);
		Map<String, Object> bidMap = productService.selectAllBidding(productNo);
		List<BidderDTO> bidderList = (List<BidderDTO>) bidMap.get("bidder");

		// id�� ������ �ƴ϶�� �� �α��ε� ���¶��
		if (!userId.equals("")) {
			interest = new InterestDTO(productNo, userId);
			isInterest = productService.isInterest(interest);
			seenProduct = new SeenProductDTO(productNo, userId, null);
			productService.isSeen(seenProduct);
		} else {
			isInterest = false;
		}

		int bidderCount = (int) bidMap.get("bidderCount");

		request.setAttribute("product", product);
		request.setAttribute("photo", productPhoto);
		request.setAttribute("seller", seller);
		request.setAttribute("grade", grade);
		request.setAttribute("bidderList", bidderList);
		request.setAttribute("bidderCount", bidderCount);
		request.setAttribute("description", description);
		request.setAttribute("isInterest", isInterest);
		request.setAttribute("productNo", productNo);
		request.setAttribute("userId", userId);

		mv.setViewName("product/product");

		return mv;
	}

	/**
	 * 
	 * �������������� �̵�
	 * 
	 * 
	 * ����Ʈ ���� - flag 0 ��ü����Ʈ ���� flag 1 ��з� ī�װ� �� ���� ī�װ� �������� - flag 0 ��з� ī�װ�
	 * �������� flag 1 �ߺз� ī�װ� ���� ������ - flag 0 hidden / flag 1 ��з� ī�װ� ��������
	 * 
	 * �ۼ��� : �ȹΰ�
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request) {

		String categoryName = request.getParameter("categoryName");
		List<mainListProductDTO> mainList = null;
		List<String> division = null;

		ModelAndView mv = new ModelAndView();

		String sort = request.getParameter("sort");

		if ("list".equals(request.getParameter("style"))) {

			request.setAttribute("listStyle", "list");
		}

		// ��ü�� All �������� ��з�
		mv.addObject("categoryName", categoryName);

		// ��ü����Ʈ
		if ("All".equals(categoryName)) {

			mainList = productService.selectListProduct(sort);

		} else {
			// ��з�����Ʈ
			mainList = productService.selectListProductByCategory(categoryName, sort);
			// �ߺз�
			division = productService.selectDivisionsByCategory(categoryName);

			mv.addObject("division", division);

		}

		mv.addObject("mainList", mainList);
		mv.addObject("listSize", mainList.size());

		// ��з�
		List<String> bigCategory = productService.selectAllCategory();
		mv.addObject("bigCategory", bigCategory);

		mv.setViewName("product/list");

		return mv; // views/product/list.jsp
	}

	// �ߺз� ī�װ��� ���� ��ǰ �˻�
	@RequestMapping("/selectByDivision")
	@ResponseBody
	public ModelAndView selectByDivision(HttpServletRequest request, String categoryName, String divisionName,
			String sort) {

		ModelAndView mv = new ModelAndView();
		if ("list".equals(request.getParameter("style"))) {

			request.setAttribute("listStyle", "list");
		}
		if (categoryName == null) {
			categoryName = productService.selecOneCategory(divisionName);
		}
		mv.addObject("divisionName", divisionName);
		mv.addObject("categoryName", categoryName);
		// �ߺз� ī�װ��� ���� ��ǰ �˻�
		List<mainListProductDTO> mainList = productService.selectListProductByDivision(divisionName, sort);

		mv.addObject("mainList", mainList);
		mv.addObject("listSize", mainList.size());

		// ������� ��ü ��з� ī�װ�
		List<String> bigCategory = productService.selectAllCategory();
		mv.addObject("bigCategory", bigCategory);

		// �ߺз�
		List<String> division = productService.selectDivisionsByCategory(categoryName);

		// �ߺз�
		mv.addObject("division", division);

		mv.setViewName("product/list");

		return mv; // views/product/list.jsp
	}

	@RequestMapping("like")
	@ResponseBody
	public int interest(String productNo) {
		// �α��� �� ���¿��� ����� �۵�
		if (!userId.equals("")) {
			System.out.println("id is exist");
			InterestDTO interest = new InterestDTO(productNo, userId);
			boolean result = productService.newLikeItem(interest);
			if (result)
				return 1;
		}

		return 0;
	}

	// 3�� �̳��� �Ա�
	@RequestMapping("check")
	@ResponseBody
	public int deadlineChk() {
		String productNo = "p150";
		int result = 0;
		int chk = productService.deadlineChk(productNo);
		if (chk >= 0)
			/* result=1; */ System.out.println("��������");
		else
			/* result = 0; */ System.out.println("�ð��ٵ�");

		return result;
	}

	/**
	 * ��ǰ��� �� �����ֱ�. �ۼ��� : ������
	 */
	@RequestMapping("productForm")
	public String productForm() {
		return "product/productForm";

	}

	/**
	 * ��ǰ ��з� �������� �ۼ��� : ������
	 * 
	 * @return
	 */
	@RequestMapping("selectCategory")
	@ResponseBody
	public List<CategoryDTO> selectAllCategory() {
		return productService.selectCategory();
	}

	/**
	 * ��ǰ �ߺз� �������� �ۼ��� : ������
	 * 
	 * @param bigCategoryName
	 * @return
	 */

	@RequestMapping("selectDivision")
	@ResponseBody
	public List<CategoryDTO> selectDivisions(String categoryName) {
		return productService.selectDivision(categoryName);
	}

	/**
	 * ��ǰ ����ϱ� �ۼ��� : ������
	 * 
	 * @param productDTO
	 * @param session
	 * @param request
	 * @param productPhotoDTO
	 * @return
	 */
	@RequestMapping("insert_result")
	public String insert_result() {
		return "redirect:/";
	}

	/**
	 * ��ǰ ����ϱ� �ۼ��� : ������
	 * 
	 * @param productDTO
	 * @param session
	 * @param request
	 * @param productPhotoDTO
	 * @return
	 */
	@RequestMapping("insert")
	public String insertProduct(@ModelAttribute("dto") ProductDTO productDTO, HttpSession session,
			HttpServletRequest request, ProductPhotoDTO productPhotoDTO) {
		System.out.println("before=======================================");
		System.out.println(productDTO.getDescription());
		productDTO.setDescription("`" + productDTO.getDescription().replace(',', '`'));
		productDTO.setDescription(productDTO.getDescription().replaceAll("<", "&lt;"));
		System.out.println("after========================================");
		System.out.println(productDTO.getDescription());
		System.out.println("end========================================");
		String path = session.getServletContext().getRealPath("/resources/img");

		// ���丮 ��� üũ
		File saveDir = new File(path);
		if (!saveDir.exists()) {
			saveDir.mkdirs();
		}

		// ���ε�� �����̸�
		String thumbnailName = productPhotoDTO.getThumbnail().getOriginalFilename();
		String photo1Name = productPhotoDTO.getPhoto1().getOriginalFilename();
		String photo2Name = productPhotoDTO.getPhoto2().getOriginalFilename();
		String photo3Name = productPhotoDTO.getPhoto3().getOriginalFilename();
		String photo4Name = productPhotoDTO.getPhoto4().getOriginalFilename();
		String photo5Name = productPhotoDTO.getPhoto5().getOriginalFilename();
		String photo6Name = productPhotoDTO.getPhoto6().getOriginalFilename();
		String photo7Name = productPhotoDTO.getPhoto7().getOriginalFilename();
		String photo8Name = productPhotoDTO.getPhoto8().getOriginalFilename();
		String photo9Name = productPhotoDTO.getPhoto9().getOriginalFilename();

		// ���ϸ� �ߺ� ����
		String[] temp = thumbnailName.split("\\.");

		temp[0] += count;
		count++;

		thumbnailName = temp[0] + "." + temp[1];

		String[] temp2 = photo1Name.split("\\.");
		temp2[0] += count;
		count++;

		photo1Name = temp2[0] + "." + temp2[1];

		String[] temp3 = photo2Name.split("\\.");
		temp3[0] += count;
		count++;

		photo2Name = temp3[0] + "." + temp3[1];

		if (photo3Name != "") {
			String[] temp4 = photo3Name.split("\\.");
			temp4[0] += count;
			count++;

			photo3Name = temp4[0] + "." + temp4[1];

		}

		if (photo4Name != "") {
			String[] temp5 = photo4Name.split("\\.");
			temp3[0] += count;
			count++;

			photo4Name = temp5[0] + "." + temp5[1];

		}

		if (photo5Name != "") {
			String[] temp6 = photo5Name.split("\\.");
			temp6[0] += count;
			count++;

			photo5Name = temp6[0] + "." + temp6[1];

		}

		if (photo6Name != "") {
			String[] temp7 = photo6Name.split("\\.");
			temp7[0] += count;
			count++;

			photo6Name = temp7[0] + "." + temp7[1];

		}

		if (photo7Name != "") {
			String[] temp8 = photo7Name.split("\\.");
			temp8[0] += count;
			count++;

			photo7Name = temp8[0] + "." + temp8[1];

		}

		if (photo8Name != "") {
			String[] temp9 = photo8Name.split("\\.");
			temp9[0] += count;
			count++;

			photo8Name = temp9[0] + "." + temp9[1];

		}

		if (photo9Name != "") {
			String[] temp10 = photo9Name.split("\\.");
			temp10[0] += count;
			count++;

			photo9Name = temp10[0] + "." + temp10[1];

		}

		String thumbnailPath = path + "/" + thumbnailName;
		String photo1Path = path + "/" + photo1Name;
		String photo2Path = path + "/" + photo2Name;
		String photo3Path;
		String photo4Path;
		String photo5Path;
		String photo6Path;
		String photo7Path;
		String photo8Path;
		String photo9Path;

		if (photo3Name == "" && photo4Name == "" && photo5Name == "" && photo6Name == "" && photo7Name == ""
				&& photo8Name == "" && photo9Name == "") {
			try {
				productPhotoDTO.getThumbnail().transferTo(new File(thumbnailPath));
				productPhotoDTO.getPhoto1().transferTo(new File(photo1Path));
				productPhotoDTO.getPhoto2().transferTo(new File(photo2Path));
			} catch (Exception e) {

				e.printStackTrace();
			}
			photo3Path = "";
			photo4Path = "";
			photo5Path = "";
			photo6Path = "";
			photo7Path = "";
			photo8Path = "";
			photo9Path = "";

		} else {
			// �̹����� ����� ���
			photo3Path = path + "/" + photo3Name;
			photo4Path = path + "/" + photo4Name;
			photo5Path = path + "/" + photo5Name;
			photo6Path = path + "/" + photo6Name;
			photo7Path = path + "/" + photo7Name;
			photo8Path = path + "/" + photo8Name;
			photo9Path = path + "/" + photo9Name;

			try { // ���� ����
				productPhotoDTO.getThumbnail().transferTo(new File(thumbnailPath));
				productPhotoDTO.getPhoto1().transferTo(new File(photo1Path));
				productPhotoDTO.getPhoto2().transferTo(new File(photo2Path));
				productPhotoDTO.getPhoto3().transferTo(new File(photo3Path));
				productPhotoDTO.getPhoto4().transferTo(new File(photo4Path));
				productPhotoDTO.getPhoto5().transferTo(new File(photo5Path));
				productPhotoDTO.getPhoto6().transferTo(new File(photo6Path));
				productPhotoDTO.getPhoto7().transferTo(new File(photo7Path));
				productPhotoDTO.getPhoto8().transferTo(new File(photo8Path));
				productPhotoDTO.getPhoto9().transferTo(new File(photo9Path));

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		String[] thumbnailReal = thumbnailPath.split("\\\\");
		String[] photo1Real = photo1Path.split("\\\\");
		String[] photo2Real = photo2Path.split("\\\\");
		String[] photo3Real;
		String[] photo4Real;
		String[] photo5Real;
		String[] photo6Real;
		String[] photo7Real;
		String[] photo8Real;
		String[] photo9Real;

		productPhotoDTO.setThumbnailPath(thumbnailReal[9] + "/" + thumbnailReal[10]);

		productPhotoDTO.setPhoto1Path(photo1Real[9] + "/" + photo1Real[10]);
		productPhotoDTO.setPhoto2Path(photo2Real[9] + "/" + photo2Real[10]);

		if (photo3Name.equals("")) {
			productPhotoDTO.setPhoto3Path("");
			productPhotoDTO.setPhoto4Path("");
			productPhotoDTO.setPhoto5Path("");
			productPhotoDTO.setPhoto6Path("");
			productPhotoDTO.setPhoto7Path("");
			productPhotoDTO.setPhoto8Path("");
			productPhotoDTO.setPhoto9Path("");

		} else if (photo4Name.equals("")) {
			photo3Real = photo3Path.split("\\\\");
			productPhotoDTO.setPhoto3Path(photo3Real[9] + "/" + photo3Real[10]);
			productPhotoDTO.setPhoto4Path("");
			productPhotoDTO.setPhoto5Path("");
			productPhotoDTO.setPhoto6Path("");
			productPhotoDTO.setPhoto7Path("");
			productPhotoDTO.setPhoto8Path("");
			productPhotoDTO.setPhoto9Path("");

		} else if (photo5Name.equals("")) {
			photo3Real = photo3Path.split("\\\\");
			photo4Real = photo4Path.split("\\\\");
			productPhotoDTO.setPhoto3Path(photo3Real[9] + "/" + photo3Real[10]);
			productPhotoDTO.setPhoto4Path(photo4Real[9] + "/" + photo4Real[10]);
			productPhotoDTO.setPhoto5Path("");
			productPhotoDTO.setPhoto6Path("");
			productPhotoDTO.setPhoto7Path("");
			productPhotoDTO.setPhoto8Path("");
			productPhotoDTO.setPhoto9Path("");

		} else if (photo6Name.equals("")) {
			photo3Real = photo3Path.split("\\\\");
			photo4Real = photo4Path.split("\\\\");
			photo5Real = photo5Path.split("\\\\");
			productPhotoDTO.setPhoto3Path(photo3Real[9] + "/" + photo3Real[10]);
			productPhotoDTO.setPhoto4Path(photo4Real[9] + "/" + photo4Real[10]);
			productPhotoDTO.setPhoto5Path(photo5Real[9] + "/" + photo5Real[10]);
			productPhotoDTO.setPhoto6Path("");
			productPhotoDTO.setPhoto7Path("");
			productPhotoDTO.setPhoto8Path("");
			productPhotoDTO.setPhoto9Path("");

		} else if (photo7Name.equals("")) {
			photo3Real = photo3Path.split("\\\\");
			photo4Real = photo4Path.split("\\\\");
			photo5Real = photo5Path.split("\\\\");
			photo6Real = photo6Path.split("\\\\");
			productPhotoDTO.setPhoto3Path(photo3Real[9] + "/" + photo3Real[10]);
			productPhotoDTO.setPhoto4Path(photo4Real[9] + "/" + photo4Real[10]);
			productPhotoDTO.setPhoto5Path(photo5Real[9] + "/" + photo5Real[10]);
			productPhotoDTO.setPhoto6Path(photo6Real[9] + "/" + photo6Real[10]);
			productPhotoDTO.setPhoto7Path("");
			productPhotoDTO.setPhoto8Path("");
			productPhotoDTO.setPhoto9Path("");

		} else if (photo8Name.equals("")) {
			photo3Real = photo3Path.split("\\\\");
			photo4Real = photo4Path.split("\\\\");
			photo5Real = photo5Path.split("\\\\");
			photo6Real = photo6Path.split("\\\\");
			photo7Real = photo7Path.split("\\\\");
			productPhotoDTO.setPhoto3Path(photo3Real[9] + "/" + photo3Real[10]);
			productPhotoDTO.setPhoto4Path(photo4Real[9] + "/" + photo4Real[10]);
			productPhotoDTO.setPhoto5Path(photo5Real[9] + "/" + photo5Real[10]);
			productPhotoDTO.setPhoto6Path(photo6Real[9] + "/" + photo6Real[10]);
			productPhotoDTO.setPhoto7Path(photo7Real[9] + "/" + photo7Real[10]);
			productPhotoDTO.setPhoto8Path("");
			productPhotoDTO.setPhoto9Path("");

		} else if (photo9Name.equals("")) {
			photo3Real = photo3Path.split("\\\\");
			photo4Real = photo4Path.split("\\\\");
			photo5Real = photo5Path.split("\\\\");
			photo6Real = photo6Path.split("\\\\");
			photo7Real = photo7Path.split("\\\\");
			photo8Real = photo8Path.split("\\\\");
			productPhotoDTO.setPhoto3Path(photo3Real[9] + "/" + photo3Real[10]);
			productPhotoDTO.setPhoto4Path(photo4Real[9] + "/" + photo4Real[10]);
			productPhotoDTO.setPhoto5Path(photo5Real[9] + "/" + photo5Real[10]);
			productPhotoDTO.setPhoto6Path(photo6Real[9] + "/" + photo6Real[10]);
			productPhotoDTO.setPhoto7Path(photo7Real[9] + "/" + photo7Real[10]);
			productPhotoDTO.setPhoto8Path(photo8Real[9] + "/" + photo8Real[10]);
			productPhotoDTO.setPhoto9Path("");

		} else {
			photo3Real = photo3Path.split("\\\\");
			photo4Real = photo4Path.split("\\\\");
			photo5Real = photo5Path.split("\\\\");
			photo6Real = photo6Path.split("\\\\");
			photo7Real = photo7Path.split("\\\\");
			photo8Real = photo8Path.split("\\\\");
			photo9Real = photo9Path.split("\\\\");
			productPhotoDTO.setPhoto3Path(photo3Real[9] + "/" + photo3Real[10]);
			productPhotoDTO.setPhoto4Path(photo4Real[9] + "/" + photo4Real[10]);
			productPhotoDTO.setPhoto5Path(photo5Real[9] + "/" + photo5Real[10]);
			productPhotoDTO.setPhoto6Path(photo6Real[9] + "/" + photo6Real[10]);
			productPhotoDTO.setPhoto7Path(photo7Real[9] + "/" + photo7Real[10]);
			productPhotoDTO.setPhoto8Path(photo8Real[9] + "/" + photo8Real[10]);
			productPhotoDTO.setPhoto9Path(photo9Real[9] + "/" + photo9Real[10]);
		}

		int result = productService.insertProduct(productDTO, productPhotoDTO);
		return "product/productFormResult";
	}
	// �����ϱ�

	@RequestMapping("bid")
	public String newBid(String productNo, String totalPrice) {
		if (!userId.equals("")) {
			int realPrice = Integer.parseInt(totalPrice);
			BidderDTO bidderDTO = new BidderDTO();
			bidderDTO.setProductNo(productNo);
			bidderDTO.setPrice(realPrice);
			bidderDTO.setId(userId);

			int result = productService.insertBidding(bidderDTO);
		}

		return "forward:select";

	}

	/**
	 * 12/16 �ΰ��߰� ���� �ð��� ���� �� �����ϱ�
	 */
	@Transactional
	@RequestMapping("updateProcessByTimeout")
	public String updateProcessByTimeout(HttpServletRequest request) {

		String productNo = request.getParameter("productNo");
		String id = productService.updateProcessByTimeout(productNo);
		if (id.equals("1")) {
			// �̹� ������Ʈ ����
			request.setAttribute("alreadySubmit", "yes");
			return "forward:select";
		}

		// ������ ������ ���������� ����
		if (id != null) {
			adminController.endBidEmailForBuyer(id, productNo);
		}
		// ������ ������� �������� �Ǹ��ڿ��� ����
		adminController.endBidEmailForSeller(productNo);

		return "forward:select";
	}

}
