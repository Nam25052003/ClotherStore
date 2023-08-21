package ASM_ClotherStore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.Categories;

@Repository
public interface CategoriesDAO extends JpaRepository<Categories, Integer>{

}
