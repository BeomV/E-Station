package test.com.estation.user.model;

public interface UserDAO {
    int register(UserVO vo);


    UserVO login(UserVO vo);
}
