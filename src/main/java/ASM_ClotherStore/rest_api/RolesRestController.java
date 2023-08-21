package ASM_ClotherStore.rest_api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ASM_ClotherStore.entity.Roles;
import ASM_ClotherStore.service.RoleService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/roles")
public class RolesRestController {

	@Autowired
	RoleService roleService;
	@GetMapping
	public List<Roles> getAll() {
		return roleService.findAll();
	}
}
