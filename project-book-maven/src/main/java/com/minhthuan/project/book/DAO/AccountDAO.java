package com.minhthuan.project.book.DAO;

import com.minhthuan.project.book.IDAO.AccountIDAO;
import com.minhthuan.project.book.mapping.AccountMapper;
import com.minhthuan.project.book.model.AccountModel;
import java.util.List;

public class AccountDAO extends AbstractDAO<AccountModel> implements AccountIDAO{

    @Override
    public List<AccountModel> findAllAccount() {
        String sql = "select * from account";
        return find(sql, new AccountMapper());
    }

    @Override
    public Long insertAccount(AccountModel acc) {
        String sql = "insert into account(firstName, lastName, email, password) values(?,?,?,?)";
        return insert(sql, acc.getFirstName(), acc.getLastName(), acc.getEmail(), acc.getPassword());
    }
    
}
