package ASM_ClotherStore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.ProductDetail;

@Repository
public interface ProductDetailDAO extends JpaRepository<ProductDetail, Integer> {

}
