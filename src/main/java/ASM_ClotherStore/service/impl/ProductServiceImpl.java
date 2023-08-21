package ASM_ClotherStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ASM_ClotherStore.dao.ProductsDAO;
import ASM_ClotherStore.entity.ProductProperties;
import ASM_ClotherStore.entity.Products;
import ASM_ClotherStore.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductsDAO productsDAO;

	@Override
	public List<Products> findAll() {
		return productsDAO.findAll();
	}

	@Override
	public Products findById(Integer id) {
		return productsDAO.findById(id).get();
	}

	@Override
	public List<Products> findMaleAdultProducts() {
		return productsDAO.findMaleAdultProducts();
	}

	@Override
	public List<Products> findFemaleAdultProducts() {
		return productsDAO.findFemaleAdultProducts();
	}

	@Override
	public List<Products> findKidsProducts() {
		return productsDAO.findKidsProducts();
	}

	@Override
	public String findColorByProductId(Integer id) {
		return productsDAO.findColorByProductId(id);
	}

	@Override
	public String findSizeByProductId(Integer id) {
		return productsDAO.findSizeByProductId(id);
	}

	@Override
	public Products create(Products products) {
		return productsDAO.save(products);
	}

	@Override
	public Products update(Products products) {
		return productsDAO.save(products);
	}

	@Override
	public void delete(Integer id) {
		productsDAO.deleteById(id);
	}
}
