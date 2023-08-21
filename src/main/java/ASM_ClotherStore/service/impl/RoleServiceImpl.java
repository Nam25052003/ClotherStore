package ASM_ClotherStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ASM_ClotherStore.dao.RolesDAO;
import ASM_ClotherStore.entity.Roles;
import ASM_ClotherStore.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	RolesDAO rolesDAO;
	
	@Override
	public List<Roles> findAll() {
		return rolesDAO.findAll();
	}

}
