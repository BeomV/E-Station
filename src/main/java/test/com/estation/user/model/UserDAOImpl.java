package test.com.estation.user.model;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public int register(UserVO vo) {
        return sqlSession.insert("USER_REGISTER", vo);
    }

    @Override
    public UserVO login(UserVO vo) {
        return sqlSession.selectOne("USER_LOGIN", vo);
    }

}
