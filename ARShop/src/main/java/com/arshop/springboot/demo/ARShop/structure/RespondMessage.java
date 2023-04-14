package com.arshop.springboot.demo.ARShop.structure;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RespondMessage {
    private String respondMessage;
}
