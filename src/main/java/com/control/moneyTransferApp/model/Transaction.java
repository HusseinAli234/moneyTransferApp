package com.control.moneyTransferApp.model;


import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@Builder
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table(name = "transactions")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "recipient")
    private User recipient;
    @ManyToOne
    @JoinColumn(name = "sender")
    private User sender;
    private Long sum;
    private LocalDate createdDate;
    @ManyToOne
    @JoinColumn(name = "company_code")
    private Company company;


}
