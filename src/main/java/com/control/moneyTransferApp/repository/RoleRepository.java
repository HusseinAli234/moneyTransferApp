package com.control.moneyTransferApp.repository;

import com.control.moneyTransferApp.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role,Long> {
    Role findRoleById(Long id);
}
