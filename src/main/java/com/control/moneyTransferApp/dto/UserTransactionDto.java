package com.control.moneyTransferApp.dto;


import com.control.moneyTransferApp.model.Transaction;
import com.control.moneyTransferApp.model.User;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Builder
public class UserTransactionDto {
    private List<Transaction> transactionList;
    private User user;
}
