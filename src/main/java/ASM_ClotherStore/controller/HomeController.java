package ASM_ClotherStore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ASM_ClotherStore.entity.Products;
import ASM_ClotherStore.service.ProductService;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	ProductService productService;

	@RequestMapping("/index")
	public String index(Model model) {
		List<Products> male = productService.findMaleAdultProducts();
		List<Products> female = productService.findFemaleAdultProducts();
		List<Products> kids = productService.findKidsProducts();
		model.addAttribute("male", male);
		model.addAttribute("female", female);
		model.addAttribute("kids", kids);
		return "layout/index";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin/auth/auth.html";
	}
}
