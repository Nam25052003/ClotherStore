package ASM_ClotherStore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.Accounts;

@Repository
public interface AccountsDAO extends JpaRepository<Accounts, String> {

	@Query(value = "SELECT DISTINCT ar.username  FROM Authorities ar WHERE ar.roleid IN ('DIRE', 'STAF')", nativeQuery = true)
	List<Accounts> getAdministrators();
	
	
}
