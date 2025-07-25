package com.minhthuan.project.book.service;

import com.minhthuan.project.book.IDAO.AccountIDAO;
import com.minhthuan.project.book.IService.AccountIService;
import com.minhthuan.project.book.model.AccountModel;
import jakarta.inject.Inject;
import java.util.List;

public class AccountService implements AccountIService{
    
    @Inject
    private AccountIDAO accountDAO;
    
    @Override
    public List<AccountModel> findAllAcount() {
        return accountDAO.findAllAccount();
    }

    @Override
    public Long insertAccount(AccountModel acc) {
        return accountDAO.insertAccount(acc);
    }
      
}
