package com.hzh.MyMessageBoard.dao;

import com.hzh.MyMessageBoard.pojo.User;
import org.springframework.stereotype.Component;

@Component
public interface UserDao {
    public User getUserByLoginName(String username);
    public User getUserByLoginId(Integer loginId);
}
