package ASM_ClotherStore.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ASM_ClotherStore.dao.AccountsDAO;
import ASM_ClotherStore.dao.AuthoritiesDAO;
import ASM_ClotherStore.dao.RolesDAO;
import ASM_ClotherStore.entity.Authorities;
import ASM_ClotherStore.service.AuthoritiesService;

@Service
public class AuthoritiesServiceImpl implements AuthoritiesService {

	@Autowired
	AuthoritiesDAO authoritiesDAO;

	@Autowired
	AccountsDAO accountsDAO;

	@Autowired
	RolesDAO rolesDAO;

	@Override
	public Map<String, Object> getAuthorities() {
		Map<String, Object> data = new HashMap<>();
		data.put("authorities", authoritiesDAO.findAll());
		data.put("roles", rolesDAO.findAll());
		data.put("accounts", accountsDAO.findAll());
		return data;
	}

	@Override
	public Authorities create(Authorities authority) {
		return authoritiesDAO.save(authority);
	}

	@Override
	public void delete(Integer id) {
		authoritiesDAO.deleteById(id);
	}

}
