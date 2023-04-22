package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address, Integer> {

    Address findByAddressID(int addressID);

    List<Address> findByCustomerID(int customerID);

    @Modifying(clearAutomatically = true)
    @Query("Update Address c SET c.defaultAddress = false WHERE c.customerID = :customerID")
    void updateDefault(@Param("customerID") int customerID);

    void deleteAddressByAddressID(int addressID);


}
