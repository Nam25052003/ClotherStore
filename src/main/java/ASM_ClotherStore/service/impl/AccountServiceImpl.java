package ASM_ClotherStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ASM_ClotherStore.dao.AccountsDAO;
import ASM_ClotherStore.entity.Accounts;
import ASM_ClotherStore.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountsDAO accountsDAO;
	
	@Override
	public List<Accounts> findAll() {
		return accountsDAO.findAll();
	}

	@Override
	public Accounts findById(String username) {
		return accountsDAO.findById(username).get();
	}

	@Override
	public List<Accounts> getAdministrators() {
		return accountsDAO.getAdministrators();
	}

	@Override
	public Accounts create(Accounts accounts) {		
		return accountsDAO.save(accounts);
	}

}
