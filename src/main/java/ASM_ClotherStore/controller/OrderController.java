package ASM_ClotherStore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ASM_ClotherStore.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService orderService;

	@RequestMapping("/checkout")
	public String checkout() {
		return "order/check-out";
	}

	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();
		model.addAttribute("orders", orderService.findByUsername(username));
		return "order/orders";
	}

	@RequestMapping("/detail/{id}")
	public String detail(Model model, @PathVariable("id") Long id) {
		model.addAttribute("orders", orderService.findById(id));
		return "order/order-detail";
	}
}
