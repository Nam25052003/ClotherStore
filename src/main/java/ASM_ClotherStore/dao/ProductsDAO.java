package ASM_ClotherStore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.ProductProperties;
import ASM_ClotherStore.entity.Products;

@Repository
public interface ProductsDAO extends JpaRepository<Products, Integer> {

	@Query(value = "SELECT p.* FROM products p " + "INNER JOIN productdetail pd ON p.id = pd.productid "
			+ "INNER JOIN productproperties pp ON pd.productpropertiesid = pp.id "
			+ "WHERE pp.gender = 'Male' AND pp.type = 'adults'", nativeQuery = true)
	List<Products> findMaleAdultProducts();

	@Query(value = "SELECT p.* FROM products p " + "INNER JOIN productdetail pd ON p.id = pd.productid "
			+ "INNER JOIN productproperties pp ON pd.productpropertiesid = pp.id "
			+ "WHERE pp.gender = 'Female' AND pp.type = 'adults'", nativeQuery = true)
	List<Products> findFemaleAdultProducts();

	@Query(value = "SELECT p.* FROM products p " + "INNER JOIN productdetail pd ON p.id = pd.productid "
			+ "INNER JOIN productproperties pp ON pd.productpropertiesid = pp.id "
			+ "WHERE pp.type = 'kids'", nativeQuery = true)
	List<Products> findKidsProducts();

	@Query(value = "SELECT pp.color FROM products p " + "INNER JOIN productdetail pd ON p.id = pd.productid "
			+ "INNER JOIN productproperties pp ON pd.productpropertiesid = pp.id "
			+ "WHERE p.id = ?1", nativeQuery = true)
	String findColorByProductId(Integer id);

	@Query(value = "SELECT pp.size FROM products p " + "INNER JOIN productdetail pd ON p.id = pd.productid "
			+ "INNER JOIN productproperties pp ON pd.productpropertiesid = pp.id "
			+ "WHERE p.id = ?1", nativeQuery = true)
	String findSizeByProductId(Integer id);
}
