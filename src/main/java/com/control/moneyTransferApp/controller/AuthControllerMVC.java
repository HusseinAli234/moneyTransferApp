package com.control.moneyTransferApp.controller;

import com.control.moneyTransferApp.dto.UserDto;
import com.control.moneyTransferApp.service.UserService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AuthControllerMVC {
    private final UserService userService;

    @GetMapping("/sign_in")
    public String login()
    {
        return "auth/login";
    }
    @GetMapping("/sign_profile")
    public String signProfile(Model model, Authentication auth)
    {
        model.addAttribute("user",userService.findUserByName(auth.getName()));
        return "profile/profile";
    }
    @GetMapping("/sign_up")
    public String register()
    {
        return "auth/register";

    }
    @PostMapping("/sign_up")
    public ResponseEntity<String> register(@RequestParam(name = "name") String name,@RequestParam(name = "password") String password)
    {
        return userService.register(UserDto.builder().password(password).name(name).build());
    }
}
