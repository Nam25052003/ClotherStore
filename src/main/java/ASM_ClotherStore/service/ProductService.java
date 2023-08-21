package ASM_ClotherStore.service;

import java.util.List;

import ASM_ClotherStore.entity.ProductProperties;
import ASM_ClotherStore.entity.Products;

public interface ProductService {

	List<Products> findAll();

	Products findById(Integer id);

	List<Products> findMaleAdultProducts();

	List<Products> findFemaleAdultProducts();

	List<Products> findKidsProducts();

	String findColorByProductId(Integer id);
	
	String findSizeByProductId(Integer id);

	Products create(Products product);

	Products update(Products product);

	void delete(Integer id);
}
