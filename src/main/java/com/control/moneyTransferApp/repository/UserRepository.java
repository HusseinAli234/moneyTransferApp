package com.control.moneyTransferApp.repository;

import com.control.moneyTransferApp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {
    User findFirstByUniqueCode(String uniqueCode);

    User findByName(String name);

    Boolean existsUserByNameAndPassword(String name,String password);

}
