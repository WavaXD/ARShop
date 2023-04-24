package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.ChatRepository;
import com.arshop.springboot.demo.ARShop.entity.Chat;
import com.arshop.springboot.demo.ARShop.structure.DateUtils;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class ChatService {

    private final ChatRepository chatRepository;
    private final IdentifyService identifyService;
    private final StorageService storageService;
    private final DateUtils dateUtils;

    public ChatService(ChatRepository chatRepository, IdentifyService identifyService, StorageService storageService, DateUtils dateUtils) {
        this.chatRepository = chatRepository;
        this.identifyService = identifyService;
        this.storageService = storageService;
        this.dateUtils = dateUtils;
    }

    public List<Chat> getChat(int vendorID, HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        var chat = chatRepository.findByCustomerIDAndVendorID(selfID,vendorID);

        return chat;
    }

    public RespondMessage createRespondMessage(String message){
        var respondMessage = RespondMessage.builder()
                .respondMessage(message)
                .build();

        return respondMessage;
    }

    public RespondMessage sendImage(int vendorID, MultipartFile file , HttpServletRequest request){

        int selfID = identifyService.extractJwt(request);

        File fileObj = convertMultiPartFileToFile(file);

        try{
            BufferedImage bImage = null;
            bImage = ImageIO.read(fileObj);
        }catch(IOException e){
            return createRespondMessage("Please send image");
        }

        LocalDateTime localDate = LocalDateTime.now();
        Date date = dateUtils.asDateTime(localDate);

        Timestamp timestamp = new Timestamp(date.getTime());

        var charBuilder = Chat.builder()
                .customerID(selfID)
                .vendorID(vendorID)
                .chatTime(timestamp)
                .chatFile(storageService.uploadFile(file))
                .build();

        chatRepository.save(charBuilder);

        return createRespondMessage("Send image Successfully");

    }

    public RespondMessage sendMessage(int vendorID, Chat chat , HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        if(chat.getChatDetail() == null || chat.getChatDetail().trim().equals("")){
            return createRespondMessage("Please send message");
        }

        LocalDateTime localDate = LocalDateTime.now();
        Date date = dateUtils.asDateTime(localDate);

        Timestamp timestamp = new Timestamp(date.getTime());

        var charBuilder = Chat.builder()
                .customerID(selfID)
                .vendorID(vendorID)
                .chatTime(timestamp)
                .chatDetail(chat.getChatDetail())
                .build();

        chatRepository.save(charBuilder);

        return createRespondMessage("Send message Successfully");
    }

    private File convertMultiPartFileToFile(MultipartFile file) {
        File convertedFile = new File(file.getOriginalFilename());
        try (FileOutputStream fos = new FileOutputStream(convertedFile)) {
            fos.write(file.getBytes());
        } catch (IOException e) {
            log.error("Error converting multipartFile to file", e);
        }
        return convertedFile;
    }
}
