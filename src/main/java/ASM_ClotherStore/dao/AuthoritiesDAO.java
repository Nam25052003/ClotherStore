package ASM_ClotherStore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.Accounts;
import ASM_ClotherStore.entity.Authorities;

@Repository
public interface AuthoritiesDAO extends JpaRepository<Authorities, Integer> {
	
}
