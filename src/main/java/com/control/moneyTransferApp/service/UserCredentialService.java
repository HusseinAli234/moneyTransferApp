package com.control.moneyTransferApp.service;

import com.control.moneyTransferApp.model.User;
import com.control.moneyTransferApp.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserCredentialService implements UserDetailsService {
    private final UserRepository userRepository;

    @Autowired
    public UserCredentialService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String code) throws UsernameNotFoundException {
        User user = userRepository.findFirstByUniqueCode(code);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with code: " + code);
        }
        return user;
    }


}
