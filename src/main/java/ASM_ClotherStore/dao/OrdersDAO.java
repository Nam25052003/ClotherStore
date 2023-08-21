package ASM_ClotherStore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.Orders;

@Repository
public interface OrdersDAO extends JpaRepository<Orders, Long> {

	@Query(value = "SELECT o.* FROM orders o\r\n"
			+ "inner join accounts acc on acc.username = o.username \r\n"
			+ "WHERE acc.username = ?", nativeQuery = true)
	List<Orders> findByUsername(String username);
}
