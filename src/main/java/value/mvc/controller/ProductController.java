package value.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import value.mvc.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
}
