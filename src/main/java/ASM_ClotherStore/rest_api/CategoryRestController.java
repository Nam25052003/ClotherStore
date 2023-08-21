package ASM_ClotherStore.rest_api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ASM_ClotherStore.entity.Categories;
import ASM_ClotherStore.service.CategoryService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/")
public class CategoryRestController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping("/categories")
	public List<Categories> getAll() {
		return categoryService.findAll();
	}
}
