package com.isteer.utils;

import com.isteer.services.UserService;
import com.isteer.spring.security.Principles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class EmailService {

    @Autowired
    private final JavaMailSender mailSender;

    @Autowired
    private final UserDetailsService userDetailsService;

    @Autowired
    UserService service;

    @Value("${spring.mail.username}")
    String fromEmail;

    public EmailService(JavaMailSender mailSender, UserDetailsService userDetailsService) {
        this.mailSender = mailSender;
        this.userDetailsService = userDetailsService;
    }


    @Async
    public void sendEmail(String userName) {
        try {

            UserDetails userDetails = userDetailsService.loadUserByUsername(userName);
            if(((Principles) userDetails).user.getInvalidAttempt()<=5) {
                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(((Principles) userDetails).user.getUserEmail());
                message.setSubject("Invalid Attempt");
                message.setText("Trying to login with invalid credentials");
                message.setFrom(fromEmail);
                service.updateInvalidAttempt(userName,((Principles) userDetails).user.getInvalidAttempt()+1);
                mailSender.send(message);
            }else {
                service.disableUser(userName,0);
            }
        } catch (UsernameNotFoundException e) {
            throw new RuntimeException(e);
        } catch (MailException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}