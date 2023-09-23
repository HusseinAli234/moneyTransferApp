package com.control.moneyTransferApp.controller;

import com.control.moneyTransferApp.model.Transaction;
import com.control.moneyTransferApp.service.TransactionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserControllerMVC {
    private final TransactionService transactionService;
    @GetMapping
    public String mainPage()
    {
        return "main";
    }


}
