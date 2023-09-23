package com.control.moneyTransferApp.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "balance")
    private Long accountNumber;

    @ManyToOne
    @JoinColumn(name = "company_code", referencedColumnName = "unique_code")
    private Company company;

    @ManyToOne
    @JoinColumn(name = "user_code", referencedColumnName = "unique_code")
    private User user;


}
