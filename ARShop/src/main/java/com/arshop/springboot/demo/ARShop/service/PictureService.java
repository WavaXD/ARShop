package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.ProductPictureRepository;
import com.arshop.springboot.demo.ARShop.entity.ProductPicture;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class PictureService {

    private final ProductPictureRepository productPictureRepository;

    public PictureService(ProductPictureRepository productPictureRepository) {
        this.productPictureRepository = productPictureRepository;
    }

    public void updatePicture(){

        List<String> pictureList = new LinkedList<>();

        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/120017965_1636104314223TIOf.png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/120019875_1589963364423Dxam_2.png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/120022624_c_Chantel_P_BK_NT.png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(1).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(10).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(11).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(11)(1).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(12).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(12)(1).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(13).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(14).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(15).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(16).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(17).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(2).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(3).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(4).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(5).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(5)(1).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(6).png");
        pictureList.add("https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/image+(7).png");


        var picture = productPictureRepository.findAll();

        int numMax = pictureList.size() - 1;
        int num = 0;

        for(ProductPicture element : picture){

            if(num >= numMax){
                num = 0;
            }

            var p = ProductPicture.builder()
                    .pictureID(element.getPictureID())
                    .productID(element.getProductID())
                    .pictureName(pictureList.get(num))
                    .build();
            productPictureRepository.save(p);

            num+=1;

        }


    }
}
