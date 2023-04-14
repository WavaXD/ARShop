package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.VendorRepository;
import com.arshop.springboot.demo.ARShop.entity.Vendor;
import org.springframework.stereotype.Service;

@Service
public class VendorService {
    private final VendorRepository vendorRepository;

    public VendorService(VendorRepository vendorRepository) {
        this.vendorRepository = vendorRepository;
    }

    public Vendor getVendor(Vendor vendorDetail){
        var vendor = vendorRepository.findByVendorID(vendorDetail.getVendorID());

        System.out.println(vendor);

        if(vendor != null){
            System.out.println("Im not null");
            var vendorBuilder = Vendor.builder()
                    .vendorName(vendor.getVendorName())
                    .vendorTel(vendor.getVendorTel())
                    .build();

            return vendorBuilder;
        }

        return vendor;
    }

}
