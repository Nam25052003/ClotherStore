package ASM_ClotherStore.rest_api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;

import ASM_ClotherStore.entity.Orders;
import ASM_ClotherStore.service.OrderService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest")
public class OrderRestController {

	@Autowired
	OrderService orderService;

	@PostMapping("/orders")
	public Orders create(@RequestBody JsonNode orderData) {
		return orderService.create(orderData);
	}
}
