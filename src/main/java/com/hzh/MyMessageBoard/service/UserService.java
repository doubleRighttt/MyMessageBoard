package com.hzh.MyMessageBoard.service;

import com.hzh.MyMessageBoard.pojo.User;

public interface UserService {
    public User getUserByLoginName(String loginName);
}
