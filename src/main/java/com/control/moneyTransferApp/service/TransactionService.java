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
            Long balanceSend =  userRepository.findFirstByUniqueCode(sender).getBalance();
            userRepository.findFirstByUniqueCode(sender).setBalance(balanceSend - ((long)sum));
            Long balanceRecip = userRepository.findFirstByUniqueCode(recipient).getBalance();
            userRepository.findFirstByUniqueCode(recipient).setBalance(balanceRecip + ((long)sum));
            transactionRepository.save(Transaction.builder().createdDate(LocalDate.now()).sender(userRepository.findFirstByUniqueCode(sender)).recipient(userRepository.findFirstByUniqueCode(recipient)).sum((long)sum).build());
            return true;


    }

    public List<Transaction> getTransactionByCode(String code)
    {
       return transactionRepository.findByRecipientOrSender(userRepository.findFirstByUniqueCode(code),userRepository.findFirstByUniqueCode(code));
    }
}
