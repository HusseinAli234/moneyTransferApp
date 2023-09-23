insert into SERVICES(company_name, unique_code) VALUES ( 'O','978065' ),
                                                       ( 'Megacom','978165' ),
                                                       ( 'Jet','878065' ),
                                                       ( 'Aknet','978075' );
insert into USERS(name, password, unique_code, balance, enabled, role_id) VALUES ( 'Hussein','$2a$10$iw61lPhlWej9MhIejFawluPy/iHSXi5hZ5epp2vsmn/meFNr2H2m6','666666',1000,true,2 ),( 'Hussa','$2a$10$iw61lPhlWej9MhIejFawluPy/iHSXi5hZ5epp2vsmn/meFNr2H2m6','777777',1000,true,2 );
insert into ACCOUNTS(company_code, user_code, balance) VALUES ( '978065','666666',1000 ),( '978165','666666',1000 ),( '878065','666666',1000 ),( '978075','666666',1000 ),( '978065','777777',1000 ),( '978165','777777',1000 ),( '878065','777777',1000 ),( '978075','777777',1000 );

-- Два пользователя у которых код 666666 и 777777, а также пароль qwe