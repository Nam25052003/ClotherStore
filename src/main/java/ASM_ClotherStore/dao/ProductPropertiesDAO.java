package ASM_ClotherStore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.ProductProperties;
@Repository
public interface ProductPropertiesDAO extends JpaRepository<ProductProperties, Integer> {

}
