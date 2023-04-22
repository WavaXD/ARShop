package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.*;
import com.arshop.springboot.demo.ARShop.entity.*;
import com.arshop.springboot.demo.ARShop.structure.CustomerDetailContext;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final AddressRepository addressRepository;
    private final IdentifyService identifyService;
    private final OrderRepository orderRepository;

    public CustomerService(CustomerRepository customerRepository, AddressRepository addressRepository, IdentifyService identifyService, OrderRepository orderRepository) {
        this.customerRepository = customerRepository;
        this.addressRepository = addressRepository;
        this.identifyService = identifyService;
        this.orderRepository = orderRepository;
    }

    public List<Address> getAddress(HttpServletRequest request){

        int selfID = identifyService.extractJwt(request);

        var address = addressRepository.findByCustomerID(selfID);

        return address;
    }

    public CustomerDetailContext getSelf(HttpServletRequest request){

        int selfID = identifyService.extractJwt(request);

        var self = customerRepository.findByCustomerID(selfID);

        var customerDetailContext = CustomerDetailContext.builder()
                .name(self.getCustomerName())
                .email(self.getCustomerEmail())
                .tel(self.getCustomerTel())
                .build();

        return customerDetailContext;
    }

    public RespondMessage updateAddress(Address address, HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        var getAddress = addressRepository.findByAddressID(address.getAddressID());

        if(getAddress.getCustomerID() != selfID){
            var respondMessage = RespondMessage.builder()
                    .respondMessage("it's not your address fool ya fool!")
                    .build();
            return respondMessage;
        }

        if(address.getReceiverName() != null
        && address.getPhone() != null
        && address.getDetail() != null){

            addressRepository.updateDefault(selfID);

            var updateAddress = Address.builder()
                    .addressID(address.getAddressID())
                    .customerID(selfID)
                    .receiverName(address.getReceiverName())
                    .phone(address.getPhone())
                    .province(address.getPhone())
                    .district(address.getDistrict())
                    .subDistrict(address.getSubDistrict())
                    .detail(address.getDetail())
                    .defaultAddress(address.isDefaultAddress())
                    .homeAddress(address.isHomeAddress())
                    .build();
            addressRepository.save(updateAddress);
        }else{
            var respondMessage = RespondMessage.builder()
                    .respondMessage("Receiver name or Phone or Detail can't be null!")
                    .build();
            return respondMessage;
        }

        var respondMessage = RespondMessage.builder()
                .respondMessage("Update Address Successfully")
                .build();
        return respondMessage;
    }

    public RespondMessage addAddress(Address address,HttpServletRequest request){

        int selfID = identifyService.extractJwt(request);
        System.out.println("is default is : "+address.isDefaultAddress());
        System.out.println("is home is : "+address.isHomeAddress());

        if(address.getReceiverName() != null
                && address.getPhone() != null
                && address.getDetail() != null){

            if(address.isDefaultAddress()){
                addressRepository.updateDefault(selfID);
            }

            var newAddress = Address.builder()
                    .customerID(selfID)
                    .receiverName(address.getReceiverName())
                    .phone(address.getPhone())
                    .province(address.getPhone())
                    .district(address.getDistrict())
                    .subDistrict(address.getSubDistrict())
                    .detail(address.getDetail())
                    .defaultAddress(address.isDefaultAddress())
                    .homeAddress(address.isHomeAddress())
                    .build();

            addressRepository.save(newAddress);
        }else{
            var respondMessage = RespondMessage.builder()
                    .respondMessage("Receiver name or Phone or Detail can't be null!")
                    .build();
            return respondMessage;
        }
        var respondMessage = RespondMessage.builder()
                .respondMessage("Add address Successfully")
                .build();

        return respondMessage;

    }

    public RespondMessage deleteAddress(int addressID,HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        var address = addressRepository.findByAddressID(addressID);

        if(address.getCustomerID() != selfID){
            var respondMessage = RespondMessage.builder()
                    .respondMessage("This is not your address")
                    .build();
            return respondMessage;
        }

        if(address.isDefaultAddress()){
            var respondMessage = RespondMessage.builder()
                    .respondMessage("Cannot delete your Main Address")
                    .build();
            return respondMessage;
        }

        addressRepository.deleteAddressByAddressID(addressID);

        var respondMessage = RespondMessage.builder()
                .respondMessage("Delete Address Successfully")
                .build();
        return respondMessage;

    }

    public List<Order> getOrder(HttpServletRequest request){

        int selfID = identifyService.extractJwt(request);

        var order = orderRepository.findByCustomerID(selfID);

        return order;
    }


}
