package ASM_ClotherStore.service;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;

import ASM_ClotherStore.entity.Orders;

public interface OrderService {

	Orders create(JsonNode orderData);

	Orders findById(Long id);

	List<Orders> findByUsername(String username);

}
