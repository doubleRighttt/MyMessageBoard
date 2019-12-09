package com.hzh.MyMessageBoard.controller;

import com.hzh.MyMessageBoard.pojo.Message;
import com.hzh.MyMessageBoard.service.MessageService;
import com.hzh.MyMessageBoard.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CommonController {

    @Autowired
    private MessageService messageService;
    @RequestMapping(value = "/index.action")
    public String login(Model model, HttpSession session){
        List<Message> messageList = messageService.listAll();
        String ms ="";
        ms += "[";
        for(Message message : messageList){
            String m = "";
            m += "\"";
            String message1 = message.getMessage().toString();
            m += message1+"\",\"";
            String userId = String.valueOf(message.getUserId());
            m += userId+"\",\"";
            String username = message.getUserName().toString();
            m += username+"\",\"";
            String row = String.valueOf(message.getRow());
            m += row+"\",\"";
            String line = String.valueOf(message.getLine());
            m += line+"\",";
            ms += m;
        }
        ms += "]";
        model.addAttribute("ml",ms);
        return "messages/messages_page";
    }

}
