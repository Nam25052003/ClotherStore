package ASM_ClotherStore.service;

import java.util.List;

import ASM_ClotherStore.entity.Accounts;

public interface AccountService {
	public List<Accounts> findAll();

	public Accounts findById(String username);

	public List<Accounts> getAdministrators();
	
	public Accounts create(Accounts accounts);
}
