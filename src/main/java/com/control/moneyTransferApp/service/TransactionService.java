package com.control.moneyTransferApp.service;


import com.control.moneyTransferApp.model.Transaction;
import com.control.moneyTransferApp.repository.TransactionRepository;
import com.control.moneyTransferApp.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
@RequiredArgsConstructor
public class TransactionService {

    private final TransactionRepository transactionRepository;
    private final UserRepository userRepository;
    public boolean createTransaction(String recipient, String sender, int sum) {
        if(!(sum <= 0))
        {
            transactionRepository.save(Transaction.builder().createdDate(LocalDate.now()).sender(userRepository.findByUniqueCode(sender)).recipient(userRepository.findByUniqueCode(recipient)).sum((long)sum).build());
            return true;
        }
        return false;

    }
}
