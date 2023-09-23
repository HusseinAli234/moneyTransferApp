package com.control.moneyTransferApp.repository;

import com.control.moneyTransferApp.model.Account;
import com.control.moneyTransferApp.model.Company;
import com.control.moneyTransferApp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AccountRepository extends JpaRepository<Account,Long> {
    Account findByUserAndCompany(User user, Company company);

    boolean existsAccountByUserAndCompany(User user,Company company);
}
