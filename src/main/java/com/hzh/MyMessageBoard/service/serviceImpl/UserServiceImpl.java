package com.hzh.MyMessageBoard.service.serviceImpl;

import com.hzh.MyMessageBoard.dao.UserDao;
import com.hzh.MyMessageBoard.pojo.User;
import com.hzh.MyMessageBoard.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;
    @Override
    public User getUserByLoginName(String loginName) {
        User user = userDao.getUserByLoginName(loginName);
        return user;
    }
}
