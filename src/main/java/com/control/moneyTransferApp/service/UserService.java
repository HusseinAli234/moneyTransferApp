package com.control.moneyTransferApp.service;

import com.control.moneyTransferApp.dto.UserDto;
import com.control.moneyTransferApp.model.Role;
import com.control.moneyTransferApp.model.User;
import com.control.moneyTransferApp.repository.RoleRepository;
import com.control.moneyTransferApp.repository.UserRepository;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
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
      return   userRepository.findByUniqueCode(name);
    }


}
