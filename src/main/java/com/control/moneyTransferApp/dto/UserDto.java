package com.control.moneyTransferApp.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class UserDto {

    private String password;
    private String name;
    private Long balance;

}
