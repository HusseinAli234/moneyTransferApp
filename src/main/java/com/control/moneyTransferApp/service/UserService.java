package com.control.moneyTransferApp.service;

import com.control.moneyTransferApp.dto.UserDto;
import com.control.moneyTransferApp.model.User;
import com.control.moneyTransferApp.repository.AccountRepository;
import com.control.moneyTransferApp.repository.CompanyRepository;
import com.control.moneyTransferApp.repository.RoleRepository;
import com.control.moneyTransferApp.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository repository;
    private final AccountRepository accountRepository;
    private final CompanyRepository companyRepository;
    private final TransactionService transactionService;
    public static String generateUniqueNumber() {
        UUID uuid = UUID.randomUUID();
        long leastSigBits = uuid.getLeastSignificantBits();
        String uniqueNumber = String.valueOf(leastSigBits).substring(1, 7);
        return uniqueNumber;
    }

    public ResponseEntity<String> register(UserDto userDto) {
        String uniqueCode = generateUniqueNumber();
        if (userRepository.existsUserByNameAndPassword(userDto.getName(), userDto.getPassword())) {
            return new ResponseEntity<>("Пользователь уже существует!", HttpStatus.CONFLICT);
        } else {

             userRepository.save(User.builder().balance(1000L).name(userDto.getName()).password(new BCryptPasswordEncoder().encode(userDto.getPassword())).uniqueCode(uniqueCode).enabled(true).role(repository.findRoleById(2L)).build());
            return new ResponseEntity<>("Успешная регистрация!", HttpStatus.ACCEPTED);

        }
    }

    public User findUserByName(String name)
    {
      return   userRepository.findFirstByUniqueCode(name);
    }

    public User findByName(String name)
    {
        return userRepository.findByName(name);
    }


    public void makePayment(int sum, String name, String userCode) {
        if(accountRepository.existsAccountByUserAndCompany(userRepository.findFirstByUniqueCode(userCode),companyRepository.findByCompanyName(name))) {
            transactionService.createTransaction()
            Long number = accountRepository.findByUserAndCompany(userRepository.findFirstByUniqueCode(userCode), companyRepository.findByCompanyName(name)).getAccountNumber();
            accountRepository.findByUserAndCompany(userRepository.findFirstByUniqueCode(userCode), companyRepository.findByCompanyName(name)).setAccountNumber(number + sum);
           Long balanc = userRepository.findFirstByUniqueCode(userCode).getBalance();
            userRepository.findFirstByUniqueCode(userCode).setBalance(balanc - sum);
        }
        else {

        }

    }
}
