package ASM_ClotherStore.controller;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ASM_ClotherStore.entity.Accounts;
import ASM_ClotherStore.service.AccountService;

@Controller
@RequestMapping("/security")
public class SecurityController {

	@Autowired
	AccountService accountService;

	@PersistenceContext
	private EntityManager entityManager;

	@GetMapping("/signup/form")
	public String signup() {
		return "security/signup";
	}

	@PostMapping("/signup/save")
	public String signupsave(Model model, @ModelAttribute("accounts") Accounts accounts) {
		accountService.create(accounts);
		return "security/login";
	}

	@RequestMapping("/fogot/form")
	public String fogot() {
		return "security/fogot";
	}

	@RequestMapping("/login/form")
	public String loginForm(Model model) {
		model.addAttribute("message", "Vui lòng đăng nhập!");
		return "security/login";
	}

	@RequestMapping("/login/success")
	public String loginSuccess(Model model) {
		model.addAttribute("message", "Đăng nhập thành công!");
		return "security/login";
	}

	@RequestMapping("/login/error")
	public String loginError(Model model) {
		model.addAttribute("message", "Sai thông tin đăng nhập!");
		return "security/login";
	}

	@RequestMapping("/access/denied")
	public String unauthoried(Model model) {
		model.addAttribute("message", "Không có quyền truy xuất!");
		return "security/login";
	}

	@RequestMapping("/logout/success")
	public String logoffSuccess(Model model) {
		model.addAttribute("message", "Bạn đã đăng xuất!");
		return "security/login";
	}

	@CrossOrigin("*")
	@ResponseBody
	@RequestMapping("/rest/security/authentication")
	public Object getAuthentication(HttpSession session) {
		return session.getAttribute("authentication");
	}
}
