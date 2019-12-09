package com.hzh.MyMessageBoard.service.serviceImpl;

import com.hzh.MyMessageBoard.dao.MessageDao;
import com.hzh.MyMessageBoard.pojo.Message;
import com.hzh.MyMessageBoard.pojo.User;
import com.hzh.MyMessageBoard.service.MessageService;
import com.hzh.MyMessageBoard.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageDao messageDao;

    @Override
    public List<Message> listAll() {
        List<Message> messages = messageDao.ListAll();
        return messages;
    }
}
