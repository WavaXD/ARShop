package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.*;
import com.arshop.springboot.demo.ARShop.service.CustomerService;
import com.arshop.springboot.demo.ARShop.structure.CustomerDetailContext;
import com.arshop.springboot.demo.ARShop.structure.ProductContext;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/customer")
public class CustomerController {

    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping("/addresses")
    public List<Address> getAddress(HttpServletRequest request){
        return customerService.getAddress(request);
    }

    @GetMapping("/self")
    public CustomerDetailContext getSelf(HttpServletRequest request){
        return customerService.getSelf(request);
    }

    @Transactional
    @PostMapping("/address/update")
    public RespondMessage updateAddress(@RequestBody Address address, HttpServletRequest request){
        return customerService.updateAddress(address,request);
    }

    @Transactional
    @PostMapping("/address/add")
    public RespondMessage addAddress(@RequestBody Address address,HttpServletRequest request){
        return customerService.addAddress(address,request);
    }

    @PostMapping("/test")
    public void testJson(@RequestBody Address address,HttpServletRequest request){
        System.out.println("default : "+address.isDefaultAddress());
        System.out.println("home : "+address.isHomeAddress());
    }

    @Transactional
    @DeleteMapping(path = "/address/{addressID}")
    public RespondMessage deleteAddress(@PathVariable int addressID,HttpServletRequest request){
        return customerService.deleteAddress(addressID,request);
    }

    @GetMapping("/order")
    public List<Order> getOrder(HttpServletRequest request){
        return customerService.getOrder(request);
    }


}
