package ASM_ClotherStore.rest_api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ASM_ClotherStore.entity.Authorities;
import ASM_ClotherStore.service.AuthoritiesService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/authorities")
public class AuthoritiesRestController {

	@Autowired
	AuthoritiesService authoritiesService;

	@GetMapping()
	public Map<String, Object> getAuthorities() {
		return authoritiesService.getAuthorities();
	}

	@PostMapping()
	public Authorities create(@RequestBody Authorities authority) {
		return authoritiesService.create(authority);
	}

	@DeleteMapping("/{id}")
	public void delete(@PathVariable("id") Integer id) {
		authoritiesService.delete(id);
	}
}
