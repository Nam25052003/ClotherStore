package ASM_ClotherStore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ASM_ClotherStore.entity.Products;
import ASM_ClotherStore.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping("/list")
	public String list(Model model) {
		List<Products> list = productService.findAll();
		model.addAttribute("items", list);
		return "product/products";
	}

	@RequestMapping("/men")
	public String men(Model model) {
		List<Products> male = productService.findMaleAdultProducts();
		model.addAttribute("male", male);
		return "product/men-product";
	}

	@RequestMapping("/woman")
	public String woman(Model model) {
		List<Products> female = productService.findFemaleAdultProducts();
		model.addAttribute("female", female);
		return "product/woman-product";
	}

	@RequestMapping("/kids")
	public String kids(Model model) {
		List<Products> kids = productService.findKidsProducts();
		model.addAttribute("kids", kids);
		return "product/kids-product";
	}

	@GetMapping("/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Products products = productService.findById(id);
		model.addAttribute("item", products);
		return "product/product-detail";
	}
}
