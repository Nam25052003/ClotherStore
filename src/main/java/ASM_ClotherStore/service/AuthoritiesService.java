package ASM_ClotherStore.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import ASM_ClotherStore.entity.Authorities;

public interface AuthoritiesService {

	public Map<String, Object> getAuthorities();

	public Authorities create(@RequestBody Authorities authority);

	public void delete(@PathVariable("id") Integer id);
}
