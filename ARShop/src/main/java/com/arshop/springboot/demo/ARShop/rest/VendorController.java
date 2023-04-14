package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Vendor;
import com.arshop.springboot.demo.ARShop.service.VendorService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/vendor")
public class VendorController {

    private final VendorService vendorService;

    public VendorController(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    @PostMapping("/detail")
    public Vendor getVendor(@RequestBody Vendor vendorDetail){
        return vendorService.getVendor(vendorDetail);
    }

}
