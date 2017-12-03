package value.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import value.mvc.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	
	
}
