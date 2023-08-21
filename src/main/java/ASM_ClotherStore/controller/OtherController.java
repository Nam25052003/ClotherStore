package ASM_ClotherStore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ASM_ClotherStore.entity.Accounts;
import ASM_ClotherStore.service.AccountService;
import ASM_ClotherStore.service.CookiesService;

@Controller
@RequestMapping("/other")
public class OtherController {

	@Autowired
	HttpSession httpSession;

	@Autowired
	AccountService accountService;

	@Autowired
	CookiesService cookiesService;

	@RequestMapping("/contact")
	public String contact() {
		return "other/contact";
	}

	@RequestMapping("/aboutus")
	public String about() {
		return "other/about";
	}

	@GetMapping("/profile")
	public String profile(Model model, @ModelAttribute("Account") Accounts accounts) {
		String username = cookiesService.getValue("username");
//		model.addAttribute("account", accountService.findById(username));
		return "other/profile";
	}

	@PostMapping("/profile/save")
	public String profileSave(Model model, @ModelAttribute("Account") Accounts accounts) {

		return "other/profile";
	}
}
