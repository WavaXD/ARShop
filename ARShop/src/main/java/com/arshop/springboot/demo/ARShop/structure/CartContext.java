package com.arshop.springboot.demo.ARShop.structure;

import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartContext {
    private OrderDetail orderDetail;
    private int price;
}
