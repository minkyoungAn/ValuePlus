package value.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import value.mvc.model.service.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
}
