package ASM_ClotherStore.rest_api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ASM_ClotherStore.entity.ProductProperties;
import ASM_ClotherStore.entity.Products;
import ASM_ClotherStore.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/product")
public class ProductRestController {

	@Autowired
	ProductService productService;

	@GetMapping("/{id}")
	public Products getOne(@PathVariable("id") Integer id) {
		return productService.findById(id);
	}

	@GetMapping("/all")
	public List<Products> getAll() {
		return productService.findAll();
	}

	@PostMapping
	public Products post(@RequestBody Products product) {
		productService.create(product);
		return product;
	}

	@PutMapping("{id}")
	public Products put(@PathVariable("id") Integer id, @RequestBody Products product) {
		return productService.update(product);
	}

	@DeleteMapping("{id}")
	public void delete(@PathVariable("id") Integer id) {
		productService.delete(id);
	}

	@GetMapping("/color/{id}")
	public ResponseEntity<Map<String, String>> getColorByProductId(@PathVariable Integer id) {
		String color = productService.findColorByProductId(id);
		Map<String, String> response = new HashMap<>();
		response.put("color", color);
		return ResponseEntity.ok(response);
	}

	@GetMapping("/size/{id}")
	public ResponseEntity<Map<String, String>> getSizeByProductId(@PathVariable Integer id) {
		String size = productService.findSizeByProductId(id);
		Map<String, String> response = new HashMap<>();
		response.put("size", size);
		return ResponseEntity.ok(response);
	}
}
