package com.arshop.springboot.demo.ARShop.auth;

import com.arshop.springboot.demo.ARShop.config.JwtService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    private final AuthenticationService service;
    private JwtService jwtService;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(
            @RequestBody RegisterRequest request
    ){
        return ResponseEntity.ok(service.register(request));
    }

    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> authenticate(
            @RequestBody AuthenticationRequest request
    ){
        return ResponseEntity.ok(service.authenticate(request));
    }

    @GetMapping("/extract")
    public String extractJwt(HttpServletRequest request){
        final String authHeader = request.getHeader("Authorization");
        final String jwt;

        jwt = authHeader.substring(7);

        return extractEmail(jwt);
    }

    public String extractEmail(String jwt){
        final String userEmail;
        userEmail = jwtService.extractUsername(jwt);
        return userEmail;
    }
}
