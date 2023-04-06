package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.CustomerRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.Base64;

@Service
public class IdentifyService {

    private final CustomerRepository repository;

    public IdentifyService(CustomerRepository repository) {
        this.repository = repository;
    }

    public Integer extractJwt(HttpServletRequest request){
        final String authHeader = request.getHeader("Authorization");
        final String jwt;

        jwt = authHeader.substring(7);

        String[] chunks = jwt.split("\\.");

        Base64.Decoder decoder = Base64.getUrlDecoder();
        //String header = new String(decoder.decode(chunks[0]));
        String payload = new String(decoder.decode(chunks[1]));

        String[] splitPayload = payload.split("(?!\\.)(?!\\@)\\W");

        String jwtEmail = splitPayload[5];

        var user = repository.findByCustomerEmail(jwtEmail)
                .orElseThrow();

        return user.getCustomerID();
    }
}
