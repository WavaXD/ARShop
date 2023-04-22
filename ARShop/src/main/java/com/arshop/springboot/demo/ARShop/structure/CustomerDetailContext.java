package com.arshop.springboot.demo.ARShop.structure;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerDetailContext {
    private String name;
    private String email;
    private String tel;
}
