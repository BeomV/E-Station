package test.com.estation.user.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UserVO {
    private int user_num;
    private String user_id;
    private String user_pw;
    private String email;
    private String birthdate;
    private Timestamp created_at;
    private Timestamp last_at;
    private String tel;

}
