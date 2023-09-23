package com.control.moneyTransferApp.repository;

import com.control.moneyTransferApp.model.Transaction;
import com.control.moneyTransferApp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface TransactionRepository extends JpaRepository<Transaction,Long> {
    Transaction findById(long id);
    List<Transaction> findByRecipientOrSender(User sender, User recipient);
    Transaction findByRecipientAndSender(User sender,User recipient);
    Transaction findByCreatedDate(LocalDate date);
}
