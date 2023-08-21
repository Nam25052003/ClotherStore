package ASM_ClotherStore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ASM_ClotherStore.entity.Roles;

@Repository
public interface RolesDAO extends JpaRepository<Roles, String>{

}
