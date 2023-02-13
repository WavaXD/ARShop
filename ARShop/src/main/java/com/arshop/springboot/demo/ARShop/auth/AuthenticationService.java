package com.arshop.springboot.demo.ARShop.auth;

import com.arshop.springboot.demo.ARShop.config.JwtService;
import com.arshop.springboot.demo.ARShop.dao.CustomerRepository;
import com.arshop.springboot.demo.ARShop.entity.Customer;
import com.arshop.springboot.demo.ARShop.user.Role;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationService {

    private final CustomerRepository repository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;

    public AuthenticationResponse register(RegisterRequest request) {
        var user = Customer.builder()
                .customerName(request.getCustomerName())
                .customerEmail(request.getCustomerEmail())
                .customerPassword(passwordEncoder.encode(request.getCustomerPassword()))
                .customerTel(request.getCustomerTel())
                .customerGender(request.getCustomerGender())
                .customerBirthdate(request.getCustomerBirthdate())
                .role(Role.USER)
                .build();
        repository.save(user);
        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }

    public AuthenticationResponse authenticate(AuthenticationRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getCustomerEmail(),
                        request.getCustomerPassword()
                )
        );
        var user = repository.findByCustomerEmail(request.getCustomerEmail())
                .orElseThrow();
        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }
}
