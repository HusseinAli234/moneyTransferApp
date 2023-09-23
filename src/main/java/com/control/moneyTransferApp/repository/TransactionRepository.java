package com.control.moneyTransferApp.repository;

import com.control.moneyTransferApp.model.Transaction;
import com.control.moneyTransferApp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;

public interface TransactionRepository extends JpaRepository<Transaction,Long> {
    Transaction findById(long id);
    Transaction findByRecipientOrSender(User sender,User recipient);
    Transaction findByRecipientAndSender(User sender,User recipient);
    Transaction findByCreatedDate(LocalDate date);
}
