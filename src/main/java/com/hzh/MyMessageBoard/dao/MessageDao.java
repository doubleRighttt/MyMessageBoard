package com.hzh.MyMessageBoard.dao;

import com.hzh.MyMessageBoard.pojo.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageDao {
    public List<Message> ListAll();
}
