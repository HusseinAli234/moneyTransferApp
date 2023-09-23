package com.control.moneyTransferApp.controller;

import com.control.moneyTransferApp.dto.UserDto;
import com.control.moneyTransferApp.model.User;
import com.control.moneyTransferApp.service.TransactionService;
import com.control.moneyTransferApp.service.UserCredentialService;
import com.control.moneyTransferApp.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class UserRestController {
    private final TransactionService transactionService;
    private final UserService userService;

    @PostMapping("/transaction")
    public String makeTransaction(@RequestParam("recipient") String recipient, @RequestParam(name = "sender") String sender, @RequestParam(name = "sum") int sum)
    {
        if(transactionService.createTransaction(recipient,sender,sum))
        {
            return "redirect:/sign_profile";
        }
        else
        {
            return "redirect:/";
        }
    }

    @GetMapping("/getUserById")
    public UserDto getUser(@RequestParam String id)
    {
       return UserDto.builder().balance(userService.findUserByName(id).getBalance()).build();
    }

    @PostMapping("/servicePayment")
    public void makePayment(@RequestParam(name = "sum") int sum,@RequestParam(name = "companyName") String name,@RequestParam(name = "userCode") String userCode)
    {
        userService.makePayment(sum,name,userCode);
    }
}
