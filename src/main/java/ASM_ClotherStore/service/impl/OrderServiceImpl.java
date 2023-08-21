package ASM_ClotherStore.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import ASM_ClotherStore.dao.OrderDetailDAO;
import ASM_ClotherStore.dao.OrdersDAO;
import ASM_ClotherStore.entity.OrderDetail;
import ASM_ClotherStore.entity.Orders;
import ASM_ClotherStore.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrdersDAO ordersDAO;

	@Autowired
	OrderDetailDAO orderDetailDAO;

	@Override
	public Orders create(JsonNode orderData) {

		ObjectMapper objectMapper = new ObjectMapper();

		Orders orders = objectMapper.convertValue(orderData, Orders.class);
		ordersDAO.save(orders);

		TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {
		};
		List<OrderDetail> list = objectMapper.convertValue(orderData.get("orderDetail"), type).stream()
				.peek(d -> d.setOrders(orders)).collect(Collectors.toList());
		orderDetailDAO.saveAll(list);
		return orders;
	}

	@Override
	public Orders findById(Long id) {
		return ordersDAO.findById(id).get();
	}

	@Override
	public List<Orders> findByUsername(String username) {
		return ordersDAO.findByUsername(username);
	}

}
