package com.minhthuan.project.book.mapping;

import com.minhthuan.project.book.model.AccountModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountMapper implements ObjectMapper<AccountModel>{

    @Override
    public AccountModel mapping(ResultSet rs) {
        try {
            AccountModel t = new AccountModel();
            t.setFirstName(rs.getString("firstName"));
            t.setLastName(rs.getString("lastName"));
            t.setEmail(rs.getString("email"));
            t.setPassword(rs.getString("password"));
            return t;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
}
