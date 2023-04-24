package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Chat;
import com.arshop.springboot.demo.ARShop.service.ChatService;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/v1/chat")
public class ChatController {

    private final ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @GetMapping("/{vendorID}")
    public List<Chat> getChat(@PathVariable int vendorID, HttpServletRequest request){
        return chatService.getChat(vendorID, request);
    }

    @PostMapping("/image/{vendorID}")
    public RespondMessage sendImage(@PathVariable int vendorID,@RequestParam(value = "file") MultipartFile file , HttpServletRequest request){
        return chatService.sendImage(vendorID,file, request);
    }

    @PostMapping("/message/{vendorID}")
    public RespondMessage sendMessage(@PathVariable int vendorID, @RequestBody Chat chat, HttpServletRequest request){
        return chatService.sendMessage(vendorID, chat, request);
    }

}
