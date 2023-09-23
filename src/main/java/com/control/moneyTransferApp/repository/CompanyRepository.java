package com.control.moneyTransferApp.repository;

import com.control.moneyTransferApp.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyRepository extends JpaRepository<Company,Long> {
    Company findByUniqueCode(String code);
    Company findByCompanyName(String name);
}
