package com.arshop.springboot.demo.ARShop.structure;

import com.arshop.springboot.demo.ARShop.entity.Address;
import com.arshop.springboot.demo.ARShop.entity.Coupon;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProcessOrderContext {
    private List<OrderDetail> orderDetails;
    private Coupon coupon;
    private Address address;
    private Delivery delivery;

}
