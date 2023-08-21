package ASM_ClotherStore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.OrderDetail;
import ASM_ClotherStore.entity.Report;

@Repository
public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {

}
