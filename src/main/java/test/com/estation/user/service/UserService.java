package test.com.estation.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.com.estation.user.model.UserDAO;
import test.com.estation.user.model.UserVO;

@Service
public class UserService {

    @Autowired
    UserDAO dao;


    public int register(UserVO vo) {
        return dao.register(vo);
    }

    public UserVO login(UserVO vo) {
        return dao.login(vo);
    }
}
