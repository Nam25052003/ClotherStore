package ASM_ClotherStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ASM_ClotherStore.dao.CategoriesDAO;
import ASM_ClotherStore.entity.Categories;
import ASM_ClotherStore.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoriesDAO categoriesDAO;

	@Override
	public List<Categories> findAll() {
		return categoriesDAO.findAll();
	}

}
