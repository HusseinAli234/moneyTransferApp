package com.control.moneyTransferApp.service;


import com.control.moneyTransferApp.model.Transaction;
import com.control.moneyTransferApp.repository.TransactionRepository;
import com.control.moneyTransferApp.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TransactionService {

    private final TransactionRepository transactionRepository;
    private final UserRepository userRepository;
    public boolean createTransaction(String recipient, String sender, int sum) {
            Long balanceSend =  userRepository.findByUniqueCode(sender).getBalance();
            userRepository.findByUniqueCode(sender).setBalance(balanceSend - ((long)sum));
            Long balanceRecip = userRepository.findByUniqueCode(recipient).getBalance();
            userRepository.findByUniqueCode(recipient).setBalance(balanceRecip + ((long)sum));
            transactionRepository.save(Transaction.builder().createdDate(LocalDate.now()).sender(userRepository.findByUniqueCode(sender)).recipient(userRepository.findByUniqueCode(recipient)).sum((long)sum).build());
            return true;


    }

    public List<Transaction> getTransactionByCode(String code)
    {
       return transactionRepository.findByRecipientOrSender(userRepository.findByUniqueCode(code),userRepository.findByUniqueCode(code));
    }
}
