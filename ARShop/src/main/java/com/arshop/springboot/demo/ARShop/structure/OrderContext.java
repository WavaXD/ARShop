package com.arshop.springboot.demo.ARShop.structure;

import com.arshop.springboot.demo.ARShop.entity.Address;
import com.arshop.springboot.demo.ARShop.entity.Order;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderContext {

    private Order productOrder;
    private Address address;
}
