package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.service.PictureService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/picture")
public class PictureController {

    private final PictureService pictureService;

    public PictureController(PictureService pictureService) {
        this.pictureService = pictureService;
    }

    @Transactional
    @GetMapping("/update")
    public void updatePicture(HttpServletRequest request){
        pictureService.updatePicture();
    }
}
