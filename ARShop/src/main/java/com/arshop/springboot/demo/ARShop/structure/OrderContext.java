package com.arshop.springboot.demo.ARShop.structure;

import com.arshop.springboot.demo.ARShop.entity.Address;
import com.arshop.springboot.demo.ARShop.entity.Order;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderContext {

    private Order productOrder;
    private List<OrderDetail> orderDetails;
    private Address address;
}
